public with sharing class LwcControllerAutoCompleteResponse {

    // 1-> success , 2 --> error
    @auraenabled
    public integer status {get;set;}
    @auraenabled
    public List<string> error_messages {get;set;}
    @auraenabled
    public List<string> predicted_addresses {get;set;}

    public LwcControllerAutoCompleteResponse(){
        error_messages = new List<string>();
        predicted_addresses = new List<string>();
    }


}