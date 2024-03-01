@IsTest
public with sharing class RunAsTesting {
    @TestSetup
    static void makeData(){

        Incident inc = new Incident(Subject = 'Printer Malfunction');
        insert inc;
        createUserAtFuture();
        }

        @future
        private static void createUserAtFuture(){
            Profile profile = [SELECT Id FROM Profile WHERE Name = 'Standard User'];
            UserRole role = [SELECT Id FROM UserRole WHERE Name = 'COO'];
            User user = new User(
            Alias = 'parx',
            Email = 'partanexEmail@partanex.com',
            Emailencodingkey = 'UTF-8',
            Lastname = 'Lavi',
            Languagelocalekey = 'en_us',
            Localesidkey = 'en_us',
            profileId = profile.id,
            Userroleid = role.id,
            timezonesidkey = 'America/Los_angeles',
            Username = 'partanexUserName@partanex.com'
            );
            insert user;
        }

        @IsTest
        public static void testRunAs(){

            User standardUser = [SELECT Id FROM User WHERE Username =
            'partanexUserName@partanex.com' LIMIT 1];
            System.assertEquals(1, [SELECT Id FROM Incident].size());

            System.runAs(standardUser){
            System.assertEquals(0, [SELECT Id FROM Incident].size());
            }
        }
}