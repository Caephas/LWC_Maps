public class MapCallout {

    private static Http http = new Http();


    @AuraEnabled(cacheable=true)
    public static LwcControllerAutoCompleteResponse getAutoComplete(String input){

        LwcControllerAutoCompleteResponse response = new LwcControllerAutoCompleteResponse();
        string encodedInput = EncodingUtil.urlEncode(input, 'UTF-8');
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://maps.googleapis.com/maps/api/place/autocomplete/json?input='+encodedInput+'&key=AIzaSyC6XvLeyFoXx--aNwexPJhQm9l8ZulhzVs&location=37.0902%2C-95.7129&radius=200000');
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
                            if(prediction.description.containsIgnoreCase('Usa')){
                                //new custom type that takes prediction.description and place_id
                                response.predicted_addresses.add(new LwcControllerAutoCompleteResponse.AddressProperties(prediction.description, prediction.place_id));
                            }
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

    
    @AuraEnabled
    public static string GetLocationForAddress(string address){
        string modifiedAddress = address.replaceAll(' ', '+').remove(',');
        try {
            HttpRequest request = new HttpRequest();
            request.setEndpoint('https://maps.googleapis.com/maps/api/geocode/json?address='+modifiedAddress+'&key=AIzaSyC6XvLeyFoXx--aNwexPJhQm9l8ZulhzVs');
            request.setMethod('GET');
            HttpResponse httpresponse = http.send(request);

            system.debug(httpresponse.getBody());
            return httpresponse.getBody();

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }    
    /**
     * @description getPlaceIdDetails gets the description of a place given it's place id
     * @param  input input : the place id
     * @return       return details of the place_id from google
     */ 
    @AuraEnabled(cacheable=true)
    public static PlaceIdPredictionResponse getPlaceIdDetails(String input){
        PlaceIdPredictionResponse placeResponse = new PlaceIdPredictionResponse();
        
        string encodedInput = EncodingUtil.urlEncode(input, 'UTF-8');
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://maps.googleapis.com/maps/api/place/details/json?key=AIzaSyC6XvLeyFoXx--aNwexPJhQm9l8ZulhzVs&fields=address_components&place_id='+encodedInput);
        request.setMethod('GET');
        HttpResponse httpresponse = http.send(request);

        if (httpresponse.getStatusCode() == 200){
            GoogleMapsPredictionResponse.PlaceDetailsResponse parsedPlaceDetailsResponse = (GoogleMapsPredictionResponse.PlaceDetailsResponse)
                                                                                        JSON.deserialize(httpresponse.getBody(),
                                                                                        GoogleMapsPredictionResponse.PlaceDetailsResponse.class); 
        
            
            switch on(parsedPlaceDetailsResponse.status){
                when OK{
                    placeResponse = PlaceIdPredictionResponse.ExtractInformationFromPlaceDetailResponse(parsedPlaceDetailsResponse.result);
                    placeResponse.status = 'OK';
                }
                when INVALID_REQUEST{
                    placeResponse.status = 'INVALID_REQUEST';
                }
                when OVER_QUERY_LIMIT{
                    placeResponse.status = 'OVER_QUERY_LIMIT';
                }
                when REQUEST_DENIED{
                    placeResponse.status = 'REQUEST_DENIED';
                }
                when UNKNOWN_ERROR{
                    placeResponse.status = 'UNKNOWN_ERROR';
                }
                when ZERO_RESULTS{
                    placeResponse.status = 'ZERO_RESULTS';
                }
            }
                                                                                    }

        return placeResponse;
    }

}