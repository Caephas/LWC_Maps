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

    public class AddressComponent {
        public String long_name {get;set;}
        public String short_name {get;set;}
        public List<String> types {get;set;}
    }
    public class PlaceReview {
        public String author_name {get;set;}
        public Integer rating {get;set;}
        public String relative_time_description {get;set;}
        //Time is a reseved keyword 
        public Integer placeReviewTime {get;set;}
        public String author_url {get;set;}
        public String language {get;set;}
        public String profile_photo_url {get;set;}
        public String text {get;set;}
    }
    public class PlusCode {
        public String global_code {get;set;}
        public String compound_code {get;set;}
    }
    public class PlaceOpeningHours {
        public Boolean open_now {get;set;}
        public List<PlaceOpeningHoursPeriod> periods {get;set;}
        public List<String> weekday_text {get;set;}
    } 
    public class PlaceOpeningHoursPeriod {
        public PlaceOpeningHoursPeriodDetail close {get;set;}
        public PlaceOpeningHoursPeriodDetail open {get;set;}
    }
    public class PlaceOpeningHoursPeriodDetail {
        public Integer day {get;set;}
        //PlaceOpeningHoursPeriodDetail (Time)
        public String periodDetailTime {get;set;}
    }
    public class Geometry {
        public LatLngLiteral location {get;set;}
        public Bounds viewport {get;set;}

    }
    public class LatLngLiteral{
        public Integer lat {get;set;}
        public Integer lng {get;set;}
    }	
    public class Bounds {
        public LatLngLiteral northeast {get;set;}
        public LatLngLiteral southwest {get;set;}
    }
    public class Place {
        public List<AddressComponent> address_components {get;set;}
        public String adr_address {get;set;}
        public String business_status {get;set;}
        public String formatted_address {get;set;}
        public String formatted_phone_number {get;set;}
        public Geometry geometry {get;set;}
        public String icon {get;set;}
        public String icon_background_color {get;set;}
        public String website {get;set;}
        public String vicinity {get;set;}
        public Integer utc_offset {get;set;}
        public Integer user_ratings_total {get;set;}
        public String url {get;set;}
        public List<String> types {get;set;}
        public String scope {get;set;}
        public String reference {get;set;}
        public Integer rating {get;set;}
        public Integer price_level {get;set;}
        public String place_id {get;set;}
        public Boolean permanently_closed {get;set;}
        public String name {get;set;}
        public String international_phone_number {get;set;}
        public String icon_mask_base_uri {get;set;}
        public List<PlaceReview> placeReview {get;set;}
        public PlusCode plus_code {get;set;}
        public List<PlacePhoto> photos {get;set;}
        public PlaceOpeningHours opening_hours {get;set;}
    }
    public class PlacePhoto {
        public Integer height {get;set;}
        public List<String> html_attributions {get;set;}
        public String photo_reference {get;set;}
        public Integer width {get;set;}
    }
    public enum PlaceDetailsStatus {OK,ZERO_RESULTS,INVALID_REQUEST,OVER_QUERY_LIMIT,REQUEST_DENIED,UNKNOWN_ERROR}
   
    public class PlaceDetailsResponse{
        public List<String> html_attributions {get;set;}
        public Place result {get;set;}
        public PlaceDetailsStatus status {get;set;}
        public List<String> info_messages {get;set;}
    
    }

}