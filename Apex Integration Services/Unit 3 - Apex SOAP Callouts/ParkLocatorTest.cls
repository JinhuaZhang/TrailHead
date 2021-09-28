@isTest
private class ParkLocatorTest {
    
    @isTest
    static void testParkService(){
        Test.setMock(WebServiceMock.class, new ParkServiceWebServiceMock());

        String country = 'China';
        List<String> result = ParkLocator.country(country);
        System.assertEquals(new List<String>{'Park1','Park2','Park3'}, result, 'ERROR: didn\'t get expected parks');
    }
}
