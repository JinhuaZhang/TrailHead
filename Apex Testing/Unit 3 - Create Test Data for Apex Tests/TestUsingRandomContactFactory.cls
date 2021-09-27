@isTest
private class TestUsingRandomContactFactory {

    @isTest
    static void TestUsingRandomContactFactory(){
        List<Contact> contacts = RandomContactFactory.generateRandomContacts(100, 'Zhang');
        System.assertEquals(100, contacts.size(), 'ERROR: Failed to generate target contacts');
    }
}
