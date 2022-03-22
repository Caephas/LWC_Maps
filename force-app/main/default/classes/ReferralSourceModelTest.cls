@isTest
public with sharing class ReferralSourceModelTest {
    @isTest
    static void referralSource(){
        ReferralSourceModel referralSourceModel = new ReferralSourceModel();
        referralSourceModel.city = 'Okota';
        referralSourceModel.country = 'United States of America';
        referralSourceModel.name = 'Abel';
        referralSourceModel.province = 'Lagos';
        referralSourceModel.street = 'Ibro way';
    }
}
