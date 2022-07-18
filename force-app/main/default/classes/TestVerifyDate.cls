@isTest
private class TestVerifyDate {
    @isTest static void testCheckDates() {
        Date testdate = VerifyDate.CheckDates(date.today(),date.today().addDays(1));
        
    }
    
     @isTest static void testCheckDates1() {
        Date testdate = VerifyDate.CheckDates(date.today(),date.today().addDays(-2));
        
    }
    
      
}