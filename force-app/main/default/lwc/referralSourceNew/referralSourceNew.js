// This file is contains the necessary code to communicate with the referralSourceNew HTML file
import { LightningElement, api, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent'
import Name from '@salesforce/schema/Referral_Source__c.Name'
import OWNERSHIP from '@salesforce/schema/Referral_Source__c.Ownership__c'
import PHONE from '@salesforce/schema/Referral_Source__c.Referral_Source_Phone__c'
import getAutoComplete from '@salesforce/apex/MapCallout.getAutoComplete'
import getPlaceIdDetails from '@salesforce/apex/MapCallout.getPlaceIdDetails';
import createNewReferralSource from '@salesforce/apex/ReferralSourceWizardController.createNewReferralSource'

export default class ReferralSourceNew extends LightningElement {

    @api horizontalAlign = 'space';
    //assigning required fields 

    referralSourceInfo = {
        referralSourceName: Name,
        Ownership: OWNERSHIP,
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

    value = "--None--"
    addressSearchInput = "";
   
    @track
    addressPredictions = [];




    get displayPredictions() {
        return this.addressPredictions.length > 0;
    }
    get options() {
        return [
            { label: '--None--', value: '--None--' },
            { label: 'Public', value: 'Public' },
            { label: 'Private', value: 'Private' },
            { label: 'Subsidiary', value: 'Subsidiary' },
            { label: 'Other', value: 'Other' },
        ];
    }



    @track
    addressInfo = {
        country: "USA",
        city: "",
        street: "",
        state: "",
        zip: ""
    }



    // what does this do ?? 
    handleRecordSelected(event) {
        let selectedRecordId = event.detail.recordId;

    }

    handleChangeAddress(event) {
        const detail = { ...event.detail };
        let { country, city, street, province, postalCode } = detail;
        this.addressInfo.country = country;
        this.addressInfo.city = city;
        this.addressInfo.state = province;
        this.addressInfo.zip = postalCode;
        this.addressInfo.street = street;
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
        console.log('selected placeId =>', placeId);
        getPlaceIdDetails({ input: placeId }).then(res => {
            const responseDetails = { ...res };
            console.log(responseDetails);
            if (responseDetails.status !== 'OK') {
                // publish a message saying an error occured
                console.log('An error occured from the backend !!!!')
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
            console.log(err)

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
            ownership: this.referralSourceInfo.Ownership,
            name: this.referralSourceInfo.referralSourceName
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