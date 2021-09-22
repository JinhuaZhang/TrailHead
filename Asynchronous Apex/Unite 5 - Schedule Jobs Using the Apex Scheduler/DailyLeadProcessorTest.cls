@isTest
private class DailyLeadProcessorTest {
    
    @testSetup
    static void setup(){

        //Create 300 Leads
        List<Lead> leads = new List<Lead>();
        for(Integer i=0; i<300; i++){
            leads.add(new Lead(LastName='LastName'+i,Company='Company'));
        }
        insert leads;
    }

    @isTest
    private static void testScheduledJobPositive(){
        
        // CRON_EXP https://developer.salesforce.com/docs/atlas.en-us.232.0.apexcode.meta/apexcode/apex_scheduler.htm
        private static String CRON_EXP = '0 0 0 1 10 ? 2022';

        Test.startTest();
        String jobId = System.schedule('ScheduleApexTest', CRON_EXP, new DailyLeadProcessor());
        Test.stopTest();

        //Check the result
        List<Lead> leads = [SELECT Id FROM Lead WHERE LeadSource = 'Dreamforce'];
        System.assertEquals(200, leads.size(), 'ERROR: Incorrect leads');
    }
}
