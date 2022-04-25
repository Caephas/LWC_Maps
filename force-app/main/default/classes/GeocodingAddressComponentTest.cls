@isTest
public class GeocodingAddressComponentTest {
   @isTest
   static void checkAddressCompoenent(){
    GeocodingAddressComponent testGeocoding = new GeocodingAddressComponent();

    testGeocoding.long_name = 'regan';
    testGeocoding.short_name = 'norwich';
    testGeocoding.types = new List<String>{'tree', 'gree'};

   }
}
