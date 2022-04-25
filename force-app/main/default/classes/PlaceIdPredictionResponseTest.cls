@isTest
public class PlaceIdPredictionResponseTest {

    @isTest
        static void placeIdPredictionResponse(){
        GoogleMapsPredictionResponse.AddressComponent addressComponent = new GoogleMapsPredictionResponse.AddressComponent();
        addressComponent.long_name = 'New Jersey';
        addressComponent.short_name = 'New Jersey';
        addressComponent.types = new List<String>{'administrative_area_level_1'};

        GoogleMapsPredictionResponse.AddressComponent addressComponent2 = new GoogleMapsPredictionResponse.AddressComponent();
        addressComponent2.long_name = 'California';
        addressComponent2.short_name = 'California';
        addressComponent2.types = new List<String>{'street_number'};

        GoogleMapsPredictionResponse.AddressComponent addressComponent3 = new GoogleMapsPredictionResponse.AddressComponent();
        addressComponent3.long_name = 'New york';
        addressComponent3.short_name = 'New york';
        addressComponent3.types = new List<String>{'street_number'};

        
        GoogleMapsPredictionResponse.Place placeTestPredictionResponse = new GoogleMapsPredictionResponse.Place();
        placeTestPredictionResponse.address_components = new List<GoogleMapsPredictionResponse.AddressComponent>{addressComponent,addressComponent2,addressComponent3};
        

        PlaceIdPredictionResponse.ExtractInformationFromPlaceDetailResponse(placeTestPredictionResponse);
        PlaceIdPredictionResponse responseToReturn = new PlaceIdPredictionResponse();
        responseToReturn.city = 'California';
        responseToReturn.country = 'USA';
        responseToReturn.state = 'New Jersey';
        responseToReturn.status = 'OK';
        responseToReturn.street = 'Ibro way';
        responseToReturn.zip = '100001';
    }
}
