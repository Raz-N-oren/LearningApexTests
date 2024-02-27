public with sharing class AccountTriggerHandler {

    public static void run(List<Account> accounts){
        System.debug('AccountTriggerHandler.run is now running...');
        for(Account account : accounts){
            account.Description = 'This account name is ' + account.Name;
        }
    }

}