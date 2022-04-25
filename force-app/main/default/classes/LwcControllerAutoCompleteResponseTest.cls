@isTest
public with sharing class LwcControllerAutoCompleteResponseTest {
  @isTest
  static void lwcControllerResponse(){
    LwcControllerAutoCompleteResponse lwcControllerResponse = new LwcControllerAutoCompleteResponse();
    lwcControllerResponse.status = 200;
    lwcControllerResponse.error_messages = new List<String>{'error', 'error_messages'};
    //lwcControllerResponse.predicted_addresses = new List<AddressProperties>();

  }
}
 