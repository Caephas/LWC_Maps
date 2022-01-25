public with sharing class GeocodingAddressResult {
    public list<GeocodingAddressComponent> address_components {get;set;}
    public string formatted_address {get;set;}
    public GeocodingAddressGeometry geometry {get;set;}
    public string place_id {get;set;}
    public GeocodingAddressPlusCode plus_code {get;set;}
    public list<string> types {get;set;}
}
