// This file is contains the necessary code to communicate with the referralSourceNew HTML file
import { LightningElement, api, track } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent'
import Name from '@salesforce/schema/Referral_Source__c.Name'
import OWNERSHIP from '@salesforce/schema/Referral_Source__c.Ownership__c'
import PHONE from '@salesforce/schema/Referral_Source__c.Referral_Source_Phone__c'
import getAutoComplete from '@salesforce/apex/MapCallout.getAutoComplete'
import createNewReferralSource from '@salesforce/apex/ReferralSourceWizardController.createNewReferralSource'

export default class ReferralSourceNew extends LightningElement {

    @api horizontalAlign = 'space';
    //assigning required fields 

    referralSourceInfo = {
        referralSourceName: Name,
        Ownership: OWNERSHIP,
        Phone: PHONE

    }

    showError(){
        const evt = new ShowToastEvent({
            title : 'Error',
            message : 'Please verify your input and try again😣',
            variant : 'error'
        });
        this.dispatchEvent(evt)
    }
    showSuccess(){
        const evt = new ShowToastEvent({
            title : 'Success',
            message : 'Record created successfully😃',
            variant : 'success'
        });
        this.dispatchEvent(evt)
    }

    value = "--None--"
    addressSearchInput = "";
    addressIsGeocode = false;

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
        state: ""
    }

    @track
    addressInfoGeocode = {
        lng: -55.722656,
        lat: 9.855216
    }

    get mapAddressInfo() {
        if (!this.addressIsGeocode) {
            const info = { ...this.addressInfo };

            return {
                location: {
                    City: info.country,
                    Country: info.country,
                    PostalCode: info.zip,
                    State: info.state,
                    Street: info.street,
                }
            }
        } else {
            const geocodeInfo = { ...this.addressInfoGeocode };
            return {
                location: {
                    Latitude: geocodeInfo.lat,
                    Longitude: geocodeInfo.lng
                }
            }
        }


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
                        optionsMap = [...optionsMap, {
                            key: index,
                            label: pred,
                            value: pred
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
        const address = event.currentTarget.dataset.value;
        console.log('selected address =>', address);
        let splitAddresses = address.split(',');
        console.log(splitAddresses);
        this.addressInfo.street = splitAddresses[0].trim();
        this.addressInfo.city = splitAddresses[1].trim();
        this.addressInfo.state = splitAddresses[2].trim();

        this.addressPredictions = [];
        this.addressSearchInput = "";
        //this.addressIsGeocode = true;

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
            ownership: this.referralSourceInfo.Ownership,
            name: this.referralSourceInfo.referralSourceName
        }

        createNewReferralSource({ dataInput: referralData })
            .then(res => {
                if(res === true){
                    this.showSuccess()
                    this.refreshComponent()
                    // publish a lightning message toast to show success
                    // clear all values in the form  or redirect to referral source page
                }else{
                     // publish a lightning message toast to show failure
                     this.showError()
                }
                
            }).catch(error => {
                // publish a lightning message toast to show failure
                this.showError()
        })
    }

}