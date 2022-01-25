public class MapCallout {

    @AuraEnabled
    public static String getAutoComplete(String input){

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://maps.googleapis.com/maps/api/place/autocomplete/json?input='+input+'&types=address&key=AIzaSyC6XvLeyFoXx--aNwexPJhQm9l8ZulhzVs');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        //if the request is successful, parse the JSON response.
        
        if(response.getStatusCode() == 200){
            
            return response.getBody();
        }else{
            return null;
        }
    
        }

}