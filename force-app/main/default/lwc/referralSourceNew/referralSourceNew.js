// This file is contains the necessary code to communicate with the referralSourceNew HTML file

import { LightningElement, api, track } from 'lwc';
import Name from '@salesforce/schema/Referral_Source__c.Name'
import NUMBEROFREFERRALS from '@salesforce/schema/Referral_Source__c.Number_of_Referrals_Total__c'
import TOTALEXPENSES from '@salesforce/schema/Referral_Source__c.Total_Expenses__c'
import CONTACTPERSON from '@salesforce/schema/Referral_Source__c.Contact_Person__c'
import NUMBEROFACTIVITIESLAST30DAYS from '@salesforce/schema/Referral_Source__c.Number_of_Activities_Last_30_days__c'
import DATEOFMOSTRECENTREFERRAL from '@salesforce/schema/Referral_Source__c.Date_of_Most_Recent_Referral__c'
import CONTACTPERSONPHONE from '@salesforce/schema/Referral_Source__c.Contact_Person_Phone__c'
import CONTACTPERSONFAXNUMBER from '@salesforce/schema/Referral_Source__c.Contact_Person_Fax_Number__c'
import CONTACTPERSONEMAIL from '@salesforce/schema/Referral_Source__c.Contact_Person_Email__c'
import OWNERSHIP from '@salesforce/schema/Referral_Source__c.Ownership__c'
import MARKETERSFROMREFERRALS from '@salesforce/schema/Referral_Source__c.Marketers_from_Referrals__c'
import getAutoComplete from '@salesforce/apex/MapCallout.getAutoComplete'

export default class ReferralSourceNew extends LightningElement {
    //assigning required fields 


    referralSourceName = Name
    Number_of_Referrals_Total__c = NUMBEROFREFERRALS
    Total_Expenses__c = TOTALEXPENSES
    Contact_Person__c = CONTACTPERSON
    Number_of_Activities_Last_30_days__c = NUMBEROFACTIVITIESLAST30DAYS
    Date_of_Most_Recent_Referral__c = DATEOFMOSTRECENTREFERRAL
    Contact_Person_Phone__c = CONTACTPERSONPHONE
    Contact_Person_Fax_Number__c = CONTACTPERSONFAXNUMBER
    Contact_Person_Email__c = CONTACTPERSONEMAIL
    Ownership__c = OWNERSHIP
    Marketers_from_Referrals__c = MARKETERSFROMREFERRALS

    addressSearchInput = "";
    addressIsGeocode = false;

    @track
    addressPredictions = [];

    get displayPredictions() {
        return this.addressPredictions.length > 0;
    }



    @track
    addressInfo = {
        country: "",
        city: "",
        street: "",
        state: "",
        zip: ""
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
        this.addressInfo.street =splitAddresses[0].trim();
        this.addressInfo.city = splitAddresses[1].trim();
        this.addressInfo.state = splitAddresses[2].trim();
        
        this.addressPredictions = [];
        this.addressSearchInput = "";
        //this.addressIsGeocode = true;

    }


}