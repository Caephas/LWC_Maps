/* eslint-disable no-useless-concat */
import { LightningElement, api } from 'lwc';
import DoSearch from "@salesforce/apex/SearchRecordLwcController.DoSearch"

export default class SearchRecordLwc extends LightningElement {

    @api objectApiName;
    searchText;

    searchResults = [];
    selectedRecordId;


    get hasResults() {
        return this.searchResults.length > 0;
    }


    triggerSearch(event) {
        this.searchText = event.target.value;
        let dynamicSoslQuery = "FIND " + "'" + this.searchText + "*'" + " IN ALL FIELDS RETURNING " + this.objectApiName + "(Id,Name)";
        // console.log(dynamicSoslQuery);
        if (this.searchText.length >= 3) {
            DoSearch({ soslquery: dynamicSoslQuery })
                .then(response => {
                    //console.log("res : ", response);
                    const r = response;
                    this.searchResults = [...r];
                })
                .catch(error => {
                    console.log('error: ', error);
                });
        } else {
            this.searchResults = [];
        }
    }

    onResultChanged(event) {
        //console.log(event.currentTarget.dataset.value);
        this.searchResults = [];
        this.searchText = '';
        const recId = event.currentTarget.dataset.value;
        const customEventDetail = {
            recordId: recId,
            objectApiName: this.objectApiName
        }

        const customEvent = new CustomEvent('recordselected', { detail: customEventDetail });
        this.dispatchEvent(customEvent);
    }

}