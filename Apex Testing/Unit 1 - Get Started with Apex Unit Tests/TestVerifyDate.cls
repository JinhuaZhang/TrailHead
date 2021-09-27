@isTest
 private class TestVerifyDate {
    
    @isTest
    static void TestCheckDates(){

        Date date1 = System.today();
        Date dateWithin30Days = date1.addDays(10);
        Date dateOutside30Days = date1.addDays(31);
        Date dateEndOfMonth = date1.addMonths(1).toStartOfMonth().addDays(-1);

        Date resultWithin30Day = VerifyDate.CheckDates(date1, dateWithin30Days);
        System.assertEquals(dateWithin30Days, resultWithin30Day, 'ERROR: date2 is within 30 days of date1, should use date2');

        Date resultOutside30Day = VerifyDate.CheckDates(date1, dateOutside30Days);
        System.assertEquals(dateEndOfMonth,resultOutside30Day, 'ERROR: date2 is outside 30 days, should use the end of the month');
    }

    @isTest
    static void TestDateWithin30Days(){
        Date date1 = System.today();
        Date dateBeforeDate1 = date1.addDays(-10);
        Date dateWithin30Days = date1.addDays(10);
        Date dateOutside30Days = date1.addDays(30);
        
        Boolean resultBeforeDate1 = VerifyDate.DateWithin30Days(date1, dateBeforeDate1);
        System.assertEquals(false, resultBeforeDate1, 'ERROR: date2 is before date1, should return false');

        Boolean resultWithin30Days = VerifyDate.DateWithin30Days(date1, dateWithin30Days);
        System.assertEquals(true, resultWithin30Days, 'ERROR: date2 is within 30 days of date1, should return true');

        Boolean resultOutside30Days = VerifyDate.DateWithin30Days(date1, dateOutside30Days);
        System.assertEquals(false, resultOutside30Days, 'ERROR: date2 is outside 30 days of date1, should return false');
    }

    @isTest
    static void TestSetEndOfMonthDate(){
        Date date1 = System.today();
        Date dateEndOfMonth = date1.addMonths(1).toStartOfMonth().addDays(-1);
        
        Date result = VerifyDate.SetEndOfMonthDate(date1);
        System.assertEquals(dateEndOfMonth, result, 'ERROR: Should return the last day of the month');
    }
}
