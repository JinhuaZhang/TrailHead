@isTest
private class LeadProcessorTest {
	@testSetup
    static void setup(){
    	List<Lead> lds = new List<Lead>();
        for(Integer i=0; i<200; i++){
            lds.add(new Lead(lastName='Lead'+i,Company='Company'+i));
        }
        insert lds;
    }
    
    @isTest static void testBatchClassPositive(){
        
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp,200);
        Test.stopTest();

        System.assertEquals(200, [SELECT count() from lead where LeadSource = 'Dreamforce'], 'Error: Incorrect number');
    }
}