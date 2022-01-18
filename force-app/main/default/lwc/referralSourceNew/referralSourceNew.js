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


const src = "https://maps.googleapis.com/maps/api/js?key=AIzaSyC6XvLeyFoXx--aNwexPJhQm9l8ZulhzVs&libraries=places&callback=initMap"

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

    @track
    addressInfo = {
        country: "USA",
        city: "",
        street: "",
        state: "New York",
        zip: ""
    }

    get mapAddressInfo() {
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
    }

    handleRecordSelected(event) {
        let selectedRecordId = event.detail.recordId;

    }

    handleChangeAddress(event) {

        const detail = { ...event.detail };
        console.log('address is changed !!! ', detail)
        let { country, city, street, province, postalCode } = detail;
        this.addressInfo.country = country;
        this.addressInfo.city = city;
        this.addressInfo.state = province;
        this.addressInfo.zip = postalCode;
        this.addressInfo.street = street;
    }

    handleSearchAddress = async () => {
        const response = await fetch(
            "https://api.publicapis.org/entries",
            {
                // Request type
                method: "GET",
                headers: {
                    "mode": "no-cors",
                    // "Access-Control-Allow-Origin": 'http://127.0.0.1',
                    "Accept": "application/json",
                    // "Access-Control-Allow-Headers": 'Content-Type, Authorization'
                }
            }
        )
    }

}