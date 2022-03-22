@isTest
private class MapCalloutTest {
    @isTest
    static void testGoogleMapCalloutPositive(){
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('googleMapsPredictionResponse');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        Test.setMock(HttpCalloutMock.class, mock);
        LwcControllerAutoCompleteResponse lwcControllerResponse = MapCallout.getAutoComplete('1 world trade');
        MapCallout.getPlaceIdDetails('1 world trade');
    }
    @isTest
    static void testLocationCallout(){
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('googleMapGetLocation');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        Test.setMock(HttpCalloutMock.class, mock);
        String lwcControllerResponse = MapCallout.GetLocationForAddress('Paris Square Amman Jordan');
    }
    @isTest
    static void testCalloutNegatives(){

        List<integer> modes = new List<integer> {1,2,3,4,5};
        for(integer mode : modes){
            Test.setMock(HttpCalloutMock.class, new GoogleMapsCalloutMok().setMode(mode));
            LwcControllerAutoCompleteResponse lwcControllerResponse = MapCallout.getAutoComplete('1 world trade');
            MapCallout.getPlaceIdDetails('1 world trade');
        }

    

    }
}