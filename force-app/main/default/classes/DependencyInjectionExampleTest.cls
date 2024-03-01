@isTest
private class DependencyInjectionExampleTest {
    @IsTest
    static void usingMetadataWithoutDependencyInjectionTest(){
        String result = DependencyInjectionExample.usingMetadataWithoutDependencyInjection();
        Assert.areEqual('Looney Toons', result);
    }

    @IsTest
    static void usingMetadataWithDependencyInjectionNotAcmeTest(){
        String result = DependencyInjectionExample.usingMetadataWithDependencyInjection(new
        AccountSuffix__mdt(Suffix__c = 'Bob'));
        Assert.areEqual('Partanex', result);
    }
}