public class PlaceIdPredictionResponse{
    
	public cls_html_attributions[] html_attributions;
	public cls_result result;
	public String status;	//OK
	class cls_html_attributions {
	}
	class cls_result {
		public String formatted_address;	//7200 Air Cap Dr, Valley Center, KS 67147, USA
	}
	public static PlaceIdPredictionResponse parse(String json){
		return (PlaceIdPredictionResponse) System.JSON.deserialize(json, PlaceIdPredictionResponse.class);
	}
}