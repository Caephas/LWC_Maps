public class MapCallout {

    private static Http http = new Http();


    @AuraEnabled(cacheable=true)
    public static LwcControllerAutoCompleteResponse getAutoComplete(String input){

        LwcControllerAutoCompleteResponse response = new LwcControllerAutoCompleteResponse();

        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://maps.googleapis.com/maps/api/place/autocomplete/json?input='+input+'&key=AIzaSyC6XvLeyFoXx--aNwexPJhQm9l8ZulhzVs');
        request.setMethod('GET');
        HttpResponse httpresponse = http.send(request);
        
        //if the request is successful, parse the JSON response.
        
        system.debug(httpresponse.getBody());
        if(httpresponse.getStatusCode() == 200){
            GoogleMapsPredictionResponse.PlacesAutocompleteResponse parsedResponse = (GoogleMapsPredictionResponse.PlacesAutocompleteResponse)
                                                                                JSON.deserialize(httpresponse.getBody(),
                                                                                GoogleMapsPredictionResponse.PlacesAutocompleteResponse.class);   

            //system.debug(parsedResponse);
            switch on (parsedResponse.status){
                when OK{
                    if(parsedResponse.predictions.size() > 0 ){
                        for(GoogleMapsPredictionResponse.PlaceAutocompletePrediction prediction : parsedResponse.predictions){
                            response.status = 1;
                            response.predicted_addresses.add(prediction.description);
                        }
                    }
                }
                when INVALID_REQUEST{
                    response.status = 2;
                }
                when OVER_QUERY_LIMIT{
                    response.status = 3;
                }
                when REQUEST_DENIED{
                    response.status = 4;
                }
                when UNKNOWN_ERROR{
                    response.status = 5;
                }
                when ZERO_RESULTS{
                    response.status = 6;
                    response.error_messages.add('No Results found for search term \'' + input + '\'');
                }
            }
         }
        
            return response;
        }

}