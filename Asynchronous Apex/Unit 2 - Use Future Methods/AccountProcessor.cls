public class AccountProcessor {
    
    @future
    public static void countContacts(List<Id> accIds){

        List<Account> accounts = [SELECT Id, (SELECT Id FROM Contacts) FROM Account WHERE Id IN :accIds];
        for(Account account : accounts){
            account.Number_of_Contacts__c = account.Contacts.size();
        }
        update accounts;
    }
}
