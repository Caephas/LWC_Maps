@isTest
public with sharing class GoogleMapsPredictionResponseTest {
    @isTest
    static void testGoogleMapsResponse(){
        GoogleMapsPredictionResponse testPredictionResponse = new GoogleMapsPredictionResponse();
        GoogleMapsPredictionResponse.PlacesAutocompleteResponse placesAutocompleteResponse = new GoogleMapsPredictionResponse.PlacesAutocompleteResponse();
    //    ENUM
        // GoogleMapsPredictionResponse.PlacesAutocompleteStatus placesAutocompleteStatus = new GoogleMapsPredictionResponse.PlacesAutocompleteStatus();
        GoogleMapsPredictionResponse.PlaceAutocompleteTerm placeAutoCompleteTerm = new GoogleMapsPredictionResponse.PlaceAutocompleteTerm();
        GoogleMapsPredictionResponse.PlaceAutocompleteStructuredFormat placeAutocompleteStructuredFormat = new GoogleMapsPredictionResponse.PlaceAutocompleteStructuredFormat();
        GoogleMapsPredictionResponse.PlaceAutocompletePrediction placeAutocompletePrediction = new GoogleMapsPredictionResponse.PlaceAutocompletePrediction();
        GoogleMapsPredictionResponse.PlaceAutocompleteMatchedSubstring placeAutocompleteMatchedSubstring = new GoogleMapsPredictionResponse.PlaceAutocompleteMatchedSubstring();
        GoogleMapsPredictionResponse.AddressComponent addressComponent = new GoogleMapsPredictionResponse.AddressComponent();
        GoogleMapsPredictionResponse.PlaceReview placeReview = new GoogleMapsPredictionResponse.PlaceReview();
        GoogleMapsPredictionResponse.PlusCode plusCode = new GoogleMapsPredictionResponse.PlusCode();
        GoogleMapsPredictionResponse.PlaceOpeningHours placeOpeningHours = new GoogleMapsPredictionResponse.PlaceOpeningHours();
        GoogleMapsPredictionResponse.PlaceOpeningHoursPeriod placeOpeningHoursPeriod = new GoogleMapsPredictionResponse.PlaceOpeningHoursPeriod();
        GoogleMapsPredictionResponse.PlaceOpeningHoursPeriodDetail PlaceOpeningHoursPeriodDetail = new GoogleMapsPredictionResponse.PlaceOpeningHoursPeriodDetail();
        GoogleMapsPredictionResponse.Geometry geometry = new GoogleMapsPredictionResponse.Geometry();
        GoogleMapsPredictionResponse.LatLngLiteral latLngLiteral = new GoogleMapsPredictionResponse.LatLngLiteral();
        GoogleMapsPredictionResponse.Bounds bounds = new GoogleMapsPredictionResponse.Bounds();
        GoogleMapsPredictionResponse.Place place = new GoogleMapsPredictionResponse.Place();
        GoogleMapsPredictionResponse.PlacePhoto placePhoto = new GoogleMapsPredictionResponse.PlacePhoto();
        GoogleMapsPredictionResponse.PlaceDetailsResponse placeDetailsResponse = new GoogleMapsPredictionResponse.PlaceDetailsResponse();


       
       
        // placesAutocompleteResponse
        placesAutocompleteResponse.error_message = 'Error message';
        placesAutocompleteResponse.info_messages = new List<String>{'check wartnings', 'check input'};
        

        // PlaceAutoCOmplete Term
        placeAutoCompleteTerm.offset = 100;
        placeAutoCompleteTerm.value = 'Greenwich';

        // PlaceAutocompleteMatchedSubstring
        placeAutocompleteMatchedSubstring.length = 100;
        placeAutocompleteMatchedSubstring.offset = 100;

        // placeAutocompletestructuredformat
        placeAutocompleteStructuredFormat.main_text = 'Greenwich';
        placeAutocompleteStructuredFormat.secondary_text = 'Greenwich';

        // placeAutocompletePrediction
        placeAutocompletePrediction.description = 'A new home';
        placeAutocompletePrediction.place_id = 'Greenwich';
        placeAutocompletePrediction.types = new List<String>{'tree', 'breathe'};
        placeAutocompletePrediction.matched_substrings = new List<GoogleMapsPredictionResponse.PlaceAutocompleteMatchedSubstring>();
        placeAutocompletePrediction.structured_formatting = new GoogleMapsPredictionResponse.PlaceAutocompleteStructuredFormat();
        placeAutocompletePrediction.terms = new List<GoogleMapsPredictionResponse.PlaceAutoCompleteTerm>();

        // placeAutocompleteMatchedSubstring
        placeAutocompleteMatchedSubstring.length = 100;
        placeAutocompleteMatchedSubstring.offset = 100;

        //Address component
        addressComponent.long_name = 'regan';
        addressComponent.short_name = 'norwich';
        addressComponent.types = new List<String>{'tree', 'types'};

        //place Review 

        placeReview.author_name = 'Greenwich';
        placeReview.author_url = 'Greenwich';
        placeReview.language = 'English';
        placeReview.placeReviewTime = 10;
        placeReview.profile_photo_url = 'test';
        placeReview.rating = 10;
        placeReview.relative_time_description = 'Greenwich';
        placeReview.text = 'text';

        //plus code
        plusCode.compound_code = 'Greenwich';
        plusCode.global_code = '10001';

        //Place opening hours
        placeOpeningHours.open_now = true;
        placeOpeningHours.periods = new List<GoogleMapsPredictionResponse.PlaceOpeningHoursPeriod>();
        placeOpeningHours.weekday_text = new List<String>{'tree', 'breathe'};

        //place opening hours period
        placeOpeningHoursPeriod.open = new GoogleMapsPredictionResponse.PlaceOpeningHoursPeriodDetail();
        PlaceOpeningHoursPeriod.close = new GoogleMapsPredictionResponse.PlaceOpeningHoursPeriodDetail();

        //PlaceOpeningHoursPeriodDetail
        PlaceOpeningHoursPeriodDetail.day = 21;
        PlaceOpeningHoursPeriodDetail.periodDetailTime = 'Greenwich';
        
        //Geometry
        geometry.location = new GoogleMapsPredictionResponse.LatLngLiteral();
        geometry.viewport = new GoogleMapsPredictionResponse.Bounds();

        //latngliteral
        latLngLiteral.lat = 123;
        latLngLiteral.lng = 1000;

        //bounds
        bounds.northeast = new GoogleMapsPredictionResponse.LatLngLiteral();
        bounds.southwest = new GoogleMapsPredictionResponse.LatLngLiteral();

        //Place
        place.address_components = new List<GoogleMapsPredictionResponse.AddressComponent>();
        place.adr_address = 'Greenwich';
        place.business_status = 'Business status';
        place.formatted_address = 'Greenwich';
        place.formatted_phone_number = '10000001';
        place.geometry = new GoogleMapsPredictionResponse.Geometry();
        place.icon = 'icon';
        place.icon_background_color = 'iconBGColor';
        place.icon_mask_base_uri = 'con mask base uri';
        place.international_phone_number = '+12-3555';
        place.name = 'Abel';
        place.opening_hours = new GoogleMapsPredictionResponse.PlaceOpeningHours();
        place.permanently_closed = false;
        place.photos = new List<GoogleMapsPredictionResponse.PlacePhoto>();
        place.place_id = 'One world street';
        place.placeReview = new List<GoogleMapsPredictionResponse.PlaceReview>();
        place.plus_code = new GoogleMapsPredictionResponse.PlusCode();
        place.price_level = 100;
        place.rating = 5;
        place.reference = 'Refereed by';
        place.scope = 'Greenwich';
        place.types = new List<String>{'tree', 'read'};
        place.url = 'www.oxworld.com';
        place.user_ratings_total = 5;
        place.utc_offset = 3;
        place.vicinity = 'New york';
        place.website = 'www.google.com';
    
        //Place photo 
        placePhoto.height = 12;
        placePhoto.html_attributions = new List<String>{'address'};
        placePhoto.photo_reference = 'alt';
        placePhoto.width = 34;
        
        //place detail response
        placeDetailsResponse.html_attributions = new List<String>{'addresses', 'breathe'};
        placeDetailsResponse.info_messages = new List<String>{'ok message', 'error_messages'};
        placeDetailsResponse.result = new GoogleMapsPredictionResponse.Place();
      //  placeDetailsResponse.status = new GoogleMapsPredictionResponse.PlaceDetailsStatus();
    }
}
 