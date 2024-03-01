@IsTest
public with sharing class AccountTriggerHandlerTest {
    @IsTest
    static void runTest(){
        //Set
        Account acmeAccount = new Account(Name = 'Acme');
        List<Account> accounts = new List<Account>();
        accounts.add(acmeAccount);

        //Act
        AccountTriggerHandler.run(accounts);

        //Assert
        System.assert(accounts[0].Description == 'This account name is Acme');
    }

    @IsTest
    public static void runOnInsert(){
   
        //Set
        List<Account> accounts = new List<Account>{new Account(Name =
        'Acme')};
   
        //Act
        insert accounts;

        //Assert
        Account acmeAccountFromDatabase = [SELECT Description FROM Account
        WHERE Name = 'Acme' LIMIT 1];
        System.assertEquals('This account name is Acme',
        acmeAccountFromDatabase.Description);
    }

    @IsTest
    public static void runOnUpdate(){
   
        //Set
        List<Account> accounts = new List<Account>{new Account(Name =
        'Acme')};
   
        //Act
        insert accounts;
        accounts[0].Name = 'Acme 1.0';
        update accounts;

        //Assert
        Account acmeAccountFromDatabase = [SELECT Description FROM Account
        WHERE Name = 'Acme 1.0' LIMIT 1];
        System.assertEquals('This account name is Acme 1.0',
        acmeAccountFromDatabase.Description);
    }

    @IsTest
    public static void runTestWith200Accounts(){

    //Set
    List<Account> accounts = new List<Account>();
    for(Integer i = 0; i < 200; i++){
        accounts.add(new Account(Name = 'Acme ' + i));
    }

    //Act
    AccountTriggerHandler.run(accounts);

    //Assert
    System.assertEquals(200, accounts.size());

    Map<String, Account> accountsByName = new Map<String, Account>();
    for (Account account : accounts) {
        accountsByName.put(account.Description, account);
    }
    for (Integer i = 0; i < 200; i++) {
       System.assert(accountsByName.containsKey('This account name is Acme ' + i));
    }
    }

    @IsTest
    public static void runTestWithAccountsFromStaticResource(){
        //Set
        List<Account> accounts = Test.loadData(Account.getSObjectType(),
        'SampleAccounts');

        //Act
        AccountTriggerHandler.run(accounts);
        //Assert
        System.assertEquals(13, accounts.size());

        for(Account account : accounts){
            System.assertEquals('This account name is ' + account.Name,
        account.Description);
        }
    }

    @IsTest
    public static void runTestWithAccountsFromDataFactory(){
        //Set
        List<Account> accounts = AccountDataFactory.getAccounts(20, false);
   
        //Act
        AccountTriggerHandler.run(accounts);
        //Assert
        System.assertEquals(20, accounts.size());
   
        for(Account account : accounts){
            System.assertEquals('This account name is ' + account.Name, account.Description);
        }
    }

}