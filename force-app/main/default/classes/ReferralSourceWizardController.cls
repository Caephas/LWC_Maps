public class ReferralSourceWizardController {
    
    @AuraEnabled
    public static ReferralWizardDataModel createNewReferralSource(ReferralSourceModel dataInput){
        ReferralWizardDataModel referralWizardDataModel = new ReferralWizardDataModel();
        try{ 

            Referral_Source__c sourceRef = ReferralSourceModel.ToReferralSourceRecord(dataInput);
            insert sourceRef; 
            System.debug(sourceRef.id);
            referralWizardDataModel.isSuccess = true;
            referralWizardDataModel.message = 'Record created successfully';
            referralWizardDataModel.responseData = sourceRef.Id;
            
            return referralWizardDataModel;

        }catch(Exception e){
            referralWizardDataModel.isSuccess = false;
            referralWizardDataModel.responseData = null;
            referralWizardDataModel.message = e.getMessage();
            return referralWizardDataModel;
        }
    }
} 
