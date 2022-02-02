public with sharing class SearchRecordLwcController {

    @AuraEnabled(cacheable = true)
    public static List<RecordSearchResponse> DoSearch(string soslquery){
        System.debug(soslquery);
        List <RecordSearchResponse> recordRes = New List<RecordSearchResponse>();
        try {
            List<List<Sobject>> response = search.query(soslquery);
            System.debug(response);
            if(response != null && response.size() >0){
                System.debug(response[0].size());
                List<Sobject> records = response[0];
                if(records != null && records.size() >0){ 
                    for(Sobject rec : records){
                        RecordSearchResponse res = new RecordSearchResponse();
                        res.RecordId = (String)rec.get('Id');
                        res.RecordName = (String)rec.get('Name');
                        recordRes.add(res);
                    }
                }
            }

            return recordRes;


        } catch (Exception e) {
            System.debug(e.getMessage());
            System.debug(e.getStackTraceString());
        }
        return null;
    }
}