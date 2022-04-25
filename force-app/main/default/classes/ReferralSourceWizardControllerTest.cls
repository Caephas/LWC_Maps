@isTest
public with sharing class ReferralSourceWizardControllerTest {
    @isTest
    static void testReferralsourceWizard(){
        ReferralSourceModel model = new ReferralSourceModel();
        // valid
        ReferralSourceWizardController.createNewReferralSource(model);
        // invalid
        ReferralSourceWizardController.createNewReferralSource(null);
        
    }
}
