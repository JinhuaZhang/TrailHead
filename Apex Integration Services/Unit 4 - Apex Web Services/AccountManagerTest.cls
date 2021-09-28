@isTest
private class AccountManagerTest {
    
    static final String myInstance = 'mySalesforceInstancePrefix';

    @isTest
    static void testGetAccount() {

        //Create a new account and add to database
        Account account = new Account(Name = 'Test Account');
        insert(account);
        //Create some new contacts and add them to the acount
        List<Contact> contacts = new List<Contact>();
        for(Integer i = 0; i < 300; i++){
            contacts.add(new Contact(AccountId = account.Id, LastName = 'Test Contact' + i));
        }
        insert(contacts);

        //Set up a test request
        RestRequest request = new RestRequest();
        request.requestURI = 'https://' + myInstance + '.my.saleforce.com/services/apexrest/Accounts/' + account.Id + '/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;

        //Call the method to test the result
        Account acc = AccountManager.getAccount();
        System.assert(acc != null);
        System.assertEquals('Test Account', account.Name, 'ERROR: Didn\'t find new account');
        List<Contact> cts = [SELECT Id, LastName FROM Contact WHERE AccountId = :acc.Id];
        System.assert(cts != null);
        System.assertEquals(300, cts.size(), 'ERROR: Didn\'t find new contacts');
    }
}
