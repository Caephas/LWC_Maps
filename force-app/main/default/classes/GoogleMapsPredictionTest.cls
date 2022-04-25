@isTest
public class GoogleMapsPredictionTest {
    @isTest
    static void testPredictionResponse(){
        GoogleMapsPredictions googleMapsPredictions = new GoogleMapsPredictions();
        googleMapsPredictions.predictions = 'Greenwich';
        googleMapsPredictions.matched_substrings = new List<String>{'tree','read'};
    }
}
 