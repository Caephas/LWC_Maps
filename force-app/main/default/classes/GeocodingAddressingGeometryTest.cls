@isTest
public with sharing class GeocodingAddressingGeometryTest {
    
    @isTest
    static void checkAddressGeometry(){
        
        GeocodingAddressGeometry testAddressGeometry = new GeocodingAddressGeometry();
        testAddressGeometry.location_type = 'Greenwich';
        
        
        GeocodingAddressGeometry.GeocodingAddressLocation locationTest = new GeocodingAddressGeometry.GeocodingAddressLocation();
        locationTest.lat = 123.00;
        locationTest.lng = 100.44;

        GeocodingAddressGeometry.GeocodingAddressViewPort testViewPort = new GeocodingAddressGeometry.GeocodingAddressViewPort();
        testViewPort.northeast = locationTest;
        testViewPort.southwest = locationTest;

        testAddressGeometry.viewport = testViewPort;
        
    }
}
