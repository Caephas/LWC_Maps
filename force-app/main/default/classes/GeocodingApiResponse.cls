public with sharing class GeocodingApiResponse {
    public List<GeocodingAddressResult> results {get;set;}
    public List<string> error_messages {get;set;}
    public GoogleMapsPredictionResponse.PlacesAutocompleteStatus status {get;set;}
}
