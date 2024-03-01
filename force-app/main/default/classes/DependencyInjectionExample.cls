public with sharing class DependencyInjectionExample {
    public static String usingMetadataWithoutDependencyInjection(){
   
        AccountSuffix__mdt accountNameSuffix = [SELECT Suffix__c FROM AccountSuffix__mdt LIMIT 1];
   
        return accountNameSuffix.Suffix__c == 'Acme' ? 'Looney Toons' : 'Partanex';
    }

    public static String usingMetadataWithDependencyInjection(AccountSuffix__mdt accountNameSuffix){

        return accountNameSuffix.Suffix__c == 'Acme' ? 'Looney Toons' : 'Partanex';
    }
}