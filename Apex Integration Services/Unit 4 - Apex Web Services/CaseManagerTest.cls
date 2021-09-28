@isTest
private class CaseManagerTest {

    static final String myInstance = 'mySalesforceInstancePrefix';
    
    @isTest
    static void testGetCaseById(){
        
        //Create a testCase with Helper method
        Id recordId = createTestRecord();
        
        //Set up a test request
        RestRequest request = new RestRequest();
        request.requestURI = 'https://' + myInstance + '.my.saleforce.com/services/apexrest/Cases/' + recordId;
        request.httpMethod = 'GET';
        RestContext.request = request;

        //Call the method to get the case by given Id
        Case thisCase = CaseManager.getCaseById();
        //Verify result
        System.assert(thisCase != null);
        System.assertEquals('Test Record', thisCase.Subject, 'ERROR: the returned case does not match the test case');
    }

    @isTest
    static void testCreateCase(){

        //Call the method to create a new case
        ID thisCaseId = CaseManager.createCase('Test Case Subject', 'New', 'Phone', 'High');

        //verify result
        System.assert(thisCaseId != null);
        //Query database and see if there is a new case created
        case thisCase = [SELECT Id, Subject FROM Case WHERE Id = :thisCaseId];
        System.assertEquals('Test Case Subject', thisCase.Subject, 'ERROR: Didn\'t find new created case');
    }

    @isTest
    static void testDeleteCase(){
        
        //Create a testCase with Helper method
        Id recordId = createTestRecord();

        //Set up a test request
        RestRequest request = new RestRequest();
        request.requestURI = 'https://' + myInstance + '.my.saleforce.com/services/apexrest/Cases/' + recordId;
        request.httpMethod = 'DELETE';
        RestContext.request = request;

        //Call the method to test deletion
        CaseManager.deleteCase();
        //Verify record is deleted
        List<Case> cases = [SELECT Id FROM Case WHERE Id = :recordId];
        System.assertEquals(0, cases.size(), 'ERROR: Case is not deleted');
    }

    @isTest
    static void testUpsertCase(){

        //Call the method to create a new case
        ID thisCaseId = CaseManager.createCase('Test Case Subject', 'New', 'Phone', 'High');
        
        //Verify the new case is created successfully
        System.assert(thisCaseId != null);
        Case thisCase = [SELECT Id, Subject FROM Case where Id = :thisCaseId];
        System.assert(thisCase != null);
        System.assertEquals('Test Case Subject', thisCase.Subject, 'ERROR: Didn\'t find new created case');

        //Update the new case
        ID thisCaseIdAfterUpdate = CaseManager.upsertCase(thisCaseId, 'Test Case Subject', 'Working', 'Phone', 'High');

        //Verify the new case is updated
        System.assertEquals(thisCaseId, thisCaseIdAfterUpdate);
        Case updatedCase = [SELECT Id, Status FROM Case WHERE Id = :thisCaseIdAfterUpdate];
        System.assert(updatedCase != null);
        System.assertEquals('Working', updatedCase.Status, 'ERROR: Case is not updated');

    }

    @isTest
    static void testUpdateCaseFields(){

        //Create a testCase with Helper method
        Id recordId = createTestRecord();

        //Set up a test request
        RestRequest request = new RestRequest();
        request.requestURI = 'https://' + myInstance + '.my.saleforce.com/services/apexrest/Cases/' + recordId;
        request.httpMethod = 'PATCH';
        request.addHeader('Content-Type', 'application/json');
        request.requestBody = Blob.valueOf('{"Status" : "Working"}');
        RestContext.request = request;

        //Update the status of the new created record
        ID thisCaseId = CaseManager.updateCaseFields();

        //Veirfy the record is updated
        System.assert(thisCaseId != Null);
        Case thisCase = [SELECT Id, Status FROM Case WHERE Id = :thisCaseId];
        System.assert(thisCase != null);
        System.assertEquals('Working', thisCase.Status);

    }

    //Helper method
    static Id createTestRecord(){
        Case testCase = new Case(Subject = 'Test Record', Status = 'New', Origin = 'Phone', Priority = 'Medium');
        insert testCase;
        return testCase.Id;
    }
}
