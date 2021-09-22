@isTest
public class AddPrimaryContactTest {

    @testSetup
    static void setup(){
        List<Account> accounts = new List<Account>();
        for(Integer i=0; i<100; i++) {
            if(i<50) {
                accounts.add(New Account(Name = 'Test Account ' + i, BillingState = 'NY'));
            }else {
                accounts.add(New Account(Name = 'Test Account ' + i, BillingState = 'CA'));
            }
        }
        insert accounts;
        
        Contact contact = new Contact(FirstName='Jinhua', LastName='Zhang');
        insert contact;
    }
    
    @isTest static void testAddingPositive() {
        //Perform the test
        Test.startTest();
        Contact contact = [SELECT Id, FirstName, LastName FROM Contact WHERE LastName='Zhang'][0];
        Id jobId = System.enqueueJob(new AddPrimaryContact(contact,'CA'));
        Test.stopTest();
        
        //Check the result
        System.assertEquals(50,[SELECT count() FROM Contact WHERE Contact.Account.BillingState = 'CA'] ,'ERROR: Incorrect number of contacts');       
    }    
}