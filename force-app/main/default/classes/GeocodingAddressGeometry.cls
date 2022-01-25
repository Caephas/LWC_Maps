public with sharing class GeocodingAddressGeometry {
    public GeocodingAddressLocation location {get;set;}
    public string location_type {get;set;}
    public GeocodingAddressViewPort viewport {get;set;}






    public class GeocodingAddressLocation{
        public double lng {get;set;}
        public double lat {get;set;}


    }

    public class GeocodingAddressViewPort{
        public GeocodingAddressLocation northeast {get;set;}
        public GeocodingAddressLocation southwest {get;set;}
    }

}
