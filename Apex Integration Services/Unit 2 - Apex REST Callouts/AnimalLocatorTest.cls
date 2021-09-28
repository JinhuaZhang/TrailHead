@isTest
private with sharing class AnimalLocatorTest {
    
    @isTest
    static void TestAnimalNameCall(){

        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String actual = AnimalLocator.getAnimalNameById(1);
        String expected = 'chicken';
        System.assertEquals(expected, actual, 'ERROR: Get a wrong name');

    }
}
