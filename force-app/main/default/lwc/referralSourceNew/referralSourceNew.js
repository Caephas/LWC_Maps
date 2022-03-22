// This file is contains the necessary code to communicate with the referralSourceNew HTML file
import { LightningElement, api, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent'
import Name from '@salesforce/schema/Referral_Source__c.Name'
import PHONE from '@salesforce/schema/Referral_Source__c.Referral_Source_Phone__c'
import getAutoComplete from '@salesforce/apex/MapCallout.getAutoComplete'
import getPlaceIdDetails from '@salesforce/apex/MapCallout.getPlaceIdDetails';
import createNewReferralSource from '@salesforce/apex/ReferralSourceWizardController.createNewReferralSource'

export default class ReferralSourceNew extends LightningElement {

    @api horizontalAlign = 'space';
    //assigning required fields 

    referralSourceInfo = {
        referralSourceName: Name,
        Phone: PHONE

    }

    showError() {
        const evt = new ShowToastEvent({
            title: 'Error',
            message: 'Please verify your input and try again😣',
            variant: 'error'
        });
        this.dispatchEvent(evt)
    }
    showSuccess() {
        const evt = new ShowToastEvent({
            title: 'Success',
            message: 'Record created successfully😃',
            variant: 'success'
        });
        this.dispatchEvent(evt)
    }

    // value = "--None--"
    addressSearchInput = "";
   
    @track
    addressPredictions = [];

    get displayPredictions() {
        return this.addressPredictions.length > 0;
    }
  

    @track
    addressInfo = {
        country: "USA",
        city: "",
        street: "",
        state: "",
        zip: ""
    }
    get mapAddressInfo (){
        return {
            location: {
                City: this.addressInfo.city,
                Country: this.addressInfo.country,
                PostalCode: this.addressInfo.zip,
                State: this.addressInfo.state,
                Street: this.addressInfo.street
            }
        }
    }


    // what does this do ?? 
    handleRecordSelected(event) {
        let selectedRecordId = event.detail.recordId;

    }

   


    handleSearchAddress(event) {
        getAutoComplete({ input: event.detail.value })
            .then(res => {
                if (res.status === 1) {

                    let addressPreds = [...res.predicted_addresses];
                    let index = 0;
                    let optionsMap = [];
                    for (let pred of addressPreds) {
                        console.log(pred);
                        optionsMap = [...optionsMap, {
                            key: index,
                            label: pred.description,
                            value: pred.place_id
                        }]

                        index += 1;
                    }
                    this.addressPredictions = optionsMap;
                } else {
                    this.addressPredictions = [];
                }
            })
            .catch(error => console.error('an exception was caught ==> ', error));

    }


    handleChangePrediction(event) {
        const placeId = event.currentTarget.dataset.value;
        getPlaceIdDetails({ input: placeId }).then(res => {
            const responseDetails = { ...res };
            if (responseDetails.status !== 'OK') {
                // publish a message saying an error occured
            } else {
                let { city, street, state, zip } = responseDetails;
                this.addressInfo.city = city;
                this.addressInfo.state = state;
                this.addressInfo.zip = zip;
                this.addressInfo.street = street;
                this.addressPredictions = [];
                this.addressSearchInput = "";
            }

        }).catch(err => {

        })


    }
    handleChange(event) {
        this.referralSourceInfo[event.target.name] = event.detail.value
    }

    refreshComponent(event) {
        eval("$A.get('e.force:refreshView').fire();");
    }

    handleSave() {
        const referralData = {

            street: this.addressInfo.street,
            city: this.addressInfo.city,
            country: this.addressInfo.country,
            province: this.addressInfo.state,
            postalCode: this.addressInfo.zip,
            name: this.referralSourceInfo.referralSourceName,
            phoneNumber: this.referralSourceInfo.Phone
        }

        createNewReferralSource({ dataInput: referralData })
            .then(res => {
                if (res === true) {
                    this.showSuccess()
                    this.refreshComponent()
                    // publish a lightning message toast to show success
                    // clear all values in the form  or redirect to referral source page
                } else {
                    // publish a lightning message toast to show failure
                    this.showError()
                }

            }).catch(error => {
                // publish a lightning message toast to show failure
                this.showError()
            })
    }

}