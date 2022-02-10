// Referral source entry wizard model


public class ReferralSourceModel {
    
    @AuraEnabled
    public String street{get;set;}
    @AuraEnabled
    public String city{get;set;}
    @AuraEnabled
    public String province{get;set;}
    @AuraEnabled
    public String name{get;set;}
    @AuraEnabled
    public String country{get;set;}
    @AuraEnabled
    public String ownership{get;set;}


    public  static Referral_Source__c ToReferralSourceRecord(ReferralSourceModel source){
    
        return new Referral_Source__c(
                                        Name=source.name , 
                                        Ownership__c = source.ownership, 
                                        City__c = source.city, 
                                        Street__c = source.street,
                                        Country__c = source.country,
                                        Province_State__c = source.province);
    }


    public ReferralSourceModel FromReferralSourceRecord(){
        throw new UnimplementedException('method not implented');
    }



    public class UnimplementedException extends Exception {}

}
