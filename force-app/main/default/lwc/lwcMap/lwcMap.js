import { LightningElement, api } from 'lwc';

export default class LwcMap extends LightningElement {

    @api addressInformation;

    //mapMarkers; 
    zoomLevel = 15
    listView = "visible";

    connectedCallback() {
        if (this.addressInformation == undefined) {
            this.addressInformation = {
                location: {
                    City: "",
                    Country: "",
                    PostalCode: "", 
                    State: "",
                    Street: "",
                }
            }
        }
    }
    // get back to this !!!!
    handleAddressLookupChange() {

    }
    get mapMarkers() {

        return [{ ...this.addressInformation }];
    }

}