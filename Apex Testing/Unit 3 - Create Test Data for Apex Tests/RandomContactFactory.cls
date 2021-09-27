@isTest
public class RandomContactFactory {
    
    public static List<Contact> generateRandomContacts(Integer count, String lastName) {
        
        List<Contact> contacts = new List<Contact>();
        
        for(Integer i = 0; i < count; i++){
            Contact contact = New Contact(FirstName = 'Test ' + i, LastName = lastName); 
            contacts.add(contact);
        }
        
        return contacts;            
    }
}
