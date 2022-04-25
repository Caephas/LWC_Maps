@isTest
public with sharing class GeocodingAddressResultTest {
    @isTest
    static void testGeocodingAddressResult(){
        GeocodingAddressResult testGeocodingAddressResult = new GeocodingAddressResult();
        testGeocodingAddressResult.formatted_address = 'Greenwich';
        testGeocodingAddressResult.place_id = '7002';
        testGeocodingAddressResult.types = new List<String>{'tree', 'brave'};

        GeocodingAddressPlusCode testAddressPlusCode = new GeocodingAddressPlusCode();
        testGeocodingAddressResult.plus_code = testAddressPlusCode;

        GeocodingAddressGeometry testAddressGeometry = new GeocodingAddressGeometry();
        testGeocodingAddressResult.geometry = testAddressGeometry;

        testGeocodingAddressResult.address_components = new List<GeocodingAddressComponent>();

    } 
}
