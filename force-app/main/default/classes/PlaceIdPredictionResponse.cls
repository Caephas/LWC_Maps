public class PlaceIdPredictionResponse{
	@auraEnabled
	public String status;	//OK
	@auraEnabled
	public string street {get;set;}
	@auraEnabled
	public string city {get;set;}
	@auraEnabled
	public string country {get;set;}
	@auraEnabled
	public string state {get;set;}
	@auraEnabled
	public string zip {get;set;}
	


	public static PlaceIdPredictionResponse ExtractInformationFromPlaceDetailResponse(GoogleMapsPredictionResponse.Place place){
		PlaceIdPredictionResponse responseToReturn = new PlaceIdPredictionResponse();
		if(place.address_components != null && place.address_components.size() >0){
			for(GoogleMapsPredictionResponse.AddressComponent addressComp : place.address_components){
				if(addressComp.types.contains('postal_code')){
					responseToReturn.zip = addressComp.long_name;
				}
				// else if(addressComp.types.contains('country')){
				// 	responseToReturn.country = addressComp.short_name;
				// }
				else if(addressComp.types.contains('administrative_area_level_1')){
					responseToReturn.state = addressComp.long_name;
				}
				else if(addressComp.types.contains('sublocality_level_1') || addressComp.types.contains('sublocality') ){
					responseToReturn.city = addressComp.long_name;
				}else{
					if(addressComp.types.contains('street_number')){
						responseToReturn.street = addressComp.long_name;
					}
					if(addressComp.types.contains('route')){
						responseToReturn.street = String.isNotBlank(responseToReturn.street) ? responseToReturn.street += ',' + addressComp.long_name : addressComp.long_name;
					}
			}


			}


		}

		return responseToReturn;
	}


	
}