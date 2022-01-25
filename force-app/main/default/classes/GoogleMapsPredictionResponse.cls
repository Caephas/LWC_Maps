public with sharing class GoogleMapsPredictionResponse {

    public class PlacesAutocompleteResponse{
        public PlaceAutocompletePrediction predictions{get;set;}
        public PlacesAutocompleteStatus status {get;set;}
        String error_message;
        String [] info_messages = new List<String>();
    }    
    public class PlaceAutocompletePrediction{
        String description;
       public PlaceAutocompleteMatchedSubstring matched_substrings{get;set;}
       public PlaceAutocompleteStructuredFormat structured_formatting{get;set;}
       public  PlaceAutoCompleteTerm terms {get;set;}
        String place_id; 
        String reference;
        String [] types = new List<String>();
    }
    public class PlacesAutocompleteStatus { 

    }
   public class PlaceAutocompleteMatchedSubstring{
       Integer length;
        Integer offset;
   }
   public class PlaceAutocompleteStructuredFormat{
       String main_text;
       public PlaceAutocompleteMatchedSubstring main_text_matched_substrings {get;set;}
       String secondary_text;
       public PlaceAutocompleteMatchedSubstring secondary_text_matched_substrings{get;set;}
   }
    public class PlaceAutocompleteTerm{
        Integer offset;
        String value;
    }

}
