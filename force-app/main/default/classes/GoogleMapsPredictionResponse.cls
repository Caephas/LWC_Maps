/**
 * Representing a namespace !!!!
 *  datatype variablename = variableValue;
 */
public with sharing class GoogleMapsPredictionResponse {

    public class PlacesAutocompleteResponse {
        public List<PlaceAutocompletePrediction> predictions{get;set;}
        public PlacesAutocompleteStatus status {get;set;}
        public string error_message {get;set;}
        public string[] info_messages {get;set;}
    }    
    
    
    public enum PlacesAutocompleteStatus {OK,ZERO_RESULTS,INVALID_REQUEST,OVER_QUERY_LIMIT,REQUEST_DENIED,UNKNOWN_ERROR}
    
    
    public class PlaceAutocompletePrediction{
       public string description {get;set;}
       public List<PlaceAutocompleteMatchedSubstring> matched_substrings{get;set;}
       public PlaceAutocompleteStructuredFormat structured_formatting{get;set;}
       public List<PlaceAutoCompleteTerm> terms {get;set;}
       public string place_id {get;set;} 
       public string[] types {get;set;}
    }
    
   
    public class PlaceAutocompleteMatchedSubstring{
        public  integer length {get;set;}
        public  integer offset {get;set;}
    }
   
    public class PlaceAutocompleteStructuredFormat{
       public string main_text{get;set;}
       public List<PlaceAutocompleteMatchedSubstring> main_text_matched_substrings {get;set;}
       public string secondary_text {get;set;}
       public List<PlaceAutocompleteMatchedSubstring> secondary_text_matched_substrings{get;set;}
   
    }
    
    public class PlaceAutocompleteTerm{
        public integer offset {get;set;}
        public string value {get;set;}
    }

}
