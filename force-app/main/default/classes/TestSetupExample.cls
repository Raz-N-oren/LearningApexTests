@IsTest
public class TestSetupExample {
    @TestSetup
    static void makeData(){

        List<Account> accounts = new List<Account>();
        for(Integer i = 0; i < 200; i++){
            accounts.add(new Account(Name = 'Acme ' + i));
        }
        insert accounts;
    }

    @IsTest
     public static void testMakeData(){
        //Collect all available accounts from our database.
        List<Account> accounts = [SELECT Id, Name, Description FROM
        Account];

        //Assert total accounts count.
        System.assertEquals(200, accounts.size());
        //Check the name of each account.
        for(Integer i = 0; i < 200; i++){
            Boolean matchingDescriptionWasFound = false;
            for (Account account : accounts) {
                if(account.Description == 'This account name is Acme ' + i){
                    matchingDescriptionWasFound = true;
                break;
                }
            }
            System.assert(matchingDescriptionWasFound);
        }
        //Change the name of each account by adding " Hello!" to it.
        for(Account account : accounts){
            account.Name += ' Hello!';
        }
        //Update all the accounts with new names.
        update accounts;
        //Update the account list with updated records from the database.
        accounts = [SELECT Id, Name, Description FROM Account];
        //Check the updated name of each account.
        for(Integer i = 0; i < 200; i++){
            Boolean matchingDescriptionWasFound = false;
            for (Account account : accounts) {
                if(account.Description == 'This account name is Acme ' + i +
                    ' Hello!'){
                matchingDescriptionWasFound = true;
                break;
                }
            }
            System.assert(matchingDescriptionWasFound);
        }
    }

    @IsTest
    public static void testMakeDataForAccountsNames(){
        //Collect all available accounts from out database.
        List<Account> accounts = [SELECT Id, Name, Description FROM
        Account];
        //Check the name of each account.
        for(Integer i = 0; i < 200; i++){
            Boolean matchingDescriptionWasFound = false;
            for (Account account : accounts) {
                if(account.Description == 'This account name is Acme ' + i){
                    matchingDescriptionWasFound = true;
                    break;
                }
            }
            System.assert(matchingDescriptionWasFound);
        }
    }
}