@IsTest
public class AccountDataFactory {

 public static Account getAccount(String name, Boolean doInsert){
    Account account = new Account(Name = name);
    if(doInsert){
        insert account;
    }
        return account;
    }

 public static List<Account> getAccounts(Integer numOfAccounts, Boolean doInsert){
    List<Account> accounts = new List<Account>();
    for (Integer i = 0; i < numOfAccounts; i++) {
        accounts.add(new Account(Name = 'Acme ' + i));
    }
    if(doInsert){
        insert accounts;
    }
        return accounts;
    }
}