@isTest
public with sharing class GeocodingApiResponseTest {
    @isTest
    static void testApiResponse(){
        GeocodingApiResponse testApiResponse = new GeocodingApiResponse();
        testApiResponse.error_messages = new List<String>{'error on load', 'check values'};
        testApiResponse.results = new List<GeocodingAddressResult>();
        testApiResponse.status = GoogleMapsPredictionResponse.PlacesAutocompleteStatus.OVER_QUERY_LIMIT;
    }
} 
