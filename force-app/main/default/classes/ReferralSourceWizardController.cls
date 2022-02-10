public class ReferralSourceWizardController {
    
    @AuraEnabled
    public static Boolean createNewReferralSource(ReferralSourceModel dataInput){
        try{
            insert ReferralSourceModel.ToReferralSourceRecord(dataInput);
            return true;
        }catch(Exception e){
            return false;
        }
    }
   
}
