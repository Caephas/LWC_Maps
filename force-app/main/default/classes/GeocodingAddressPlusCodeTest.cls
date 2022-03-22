@isTest
public with sharing class GeocodingAddressPlusCodeTest {
    @isTest
    static void testAddressPlusCode(){
        GeocodingAddressPlusCode testAddressPlusCode = new GeocodingAddressPlusCode();
        testAddressPlusCode.compound_code = '10001';
        testAddressPlusCode.global_code = '15432';
    }
}
