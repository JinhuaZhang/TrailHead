@isTest
private class AccountProcessorTest {
    
    @testSetup
    static void setup(){

        //Create test accounts
        List<Account> accounts = new List<Account>();
        for(Integer i=0; i<200; i++){
            accounts.add(new Account(Name = 'Test Account ' + i));
        }
        insert accounts;

        //Create test contacts
        List<Contact> contacts = new List<Contact>();
        for(Account account : accounts){
            contacts.add(new Contact(FirstName = account.Name, LastName = 'Test', AccountId = account.Id));
        }
        insert contacts;
    }

    @isTest
    private static void countContactsTestPositive(){
        
        //Get account Ids as input
        List<Id> accountIds = new List<Id>();
        for(Account account : [SELECT Id, (SELECT Id FROM Contacts WHERE LastName = 'Test') FROM Account]){
            accountIds.add(account.Id);
        }

        Test.startTest();
        AccountProcessor.countContacts(accountIds);
        Test.stopTest();

        //Check 200 records are inserted
        System.assertEquals(200, accountIds.size(), 'ERROR: ' + accountIds.size());
        //Check each account has at least 1 contact
        for(Account account : [SELECT Id, Number_of_Contacts__c FROM Account]){
            System.assertEquals(1, account.Number_of_Contacts__c, 'ERROR: no contact');
        }
    }
}
