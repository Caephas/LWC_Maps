@isTest
public class ReferralWizardDataModelTest {
   @isTest
   static void referralWizardDataModelTest(){
       ReferralWizardDataModel referralWizardDataModel = new ReferralWizardDataModel();
       Referral_Source__c source = new Referral_Source__c();
       referralWizardDataModel.isSuccess = true;
       referralWizardDataModel.message = 'Error message';
       referralWizardDataModel.responseData = source.id ;
   }
}
