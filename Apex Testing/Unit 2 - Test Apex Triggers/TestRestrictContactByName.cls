@isTest
private class TestRestrictContactByName {
    
    @isTest
    static void TestRestriction(){
        
        List<Contact> contacts = new List<Contact>();
        for(Integer i = 0; i < 300; i++) {
            if(i<150){
                contacts.add(New Contact(LastName = 'test ' + i));
            }else{
                contacts.add(New Contact(LastName = 'INVALIDNAME'));
            }
        }

        Test.startTest();
        Database.SaveResult[] results = Database.insert(contacts, false);
        Test.stopTest();

        Integer count = 0;
        for(Database.SaveResult result : results){
            if(!result.isSuccess()){
                count = count + 1;
            }
        }

        System.assertEquals(150, count, 'ERROR: Trigger restriction is not applied to all new contacts');

    }
}
