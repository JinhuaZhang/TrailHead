public class AddPrimaryContact implements Queueable {
	
    private Contact contact;
    private String state;
    
    public AddPrimaryContact(Contact inputContact, String inputState) {
        this.contact = inputContact;
        this.state = inputState;
    }
    
    public void execute(QueueableContext context) {
        
        //Create an empty list to hold the new Contacts
        List<Contact> contacts = new List<Contact>();
        
        //Retrieve 200 account records
        List<Account> accounts = [SELECT Id FROM Account WHERE BillingState = :state LIMIT 200];
        //Retrieve 200 records and add Contact to each record
        for(Account acc : accounts){
            
            //Clone the contact and associated to the account
            Contact contactClone = contact.clone();
            contactClone.AccountId = acc.Id;
            contacts.add(contactClone);
        }
        
        insert contacts;
    }
}