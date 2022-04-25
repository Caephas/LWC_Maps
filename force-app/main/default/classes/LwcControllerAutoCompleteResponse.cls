
public with sharing class LwcControllerAutoCompleteResponse {

    // 1-> success , 2 --> error
    @auraenabled
    public integer status {get;set;}
    @auraenabled 
    public List<string> error_messages {get;set;}
    @auraenabled
    public List<AddressProperties> predicted_addresses {get;set;}

    public LwcControllerAutoCompleteResponse(){
        error_messages = new List<string>();
        //change predicted_addresses to a custom data type with two properties description and place_id
        predicted_addresses = new List<AddressProperties>();
    }
    public class AddressProperties{
        @auraenabled
        public string description {get;set;}
        @auraenabled
        public string place_id {get;set;}

        public AddressProperties(String description, String place_id ){
            this.description = description;
            this.place_id = place_id;
        }
    }

}