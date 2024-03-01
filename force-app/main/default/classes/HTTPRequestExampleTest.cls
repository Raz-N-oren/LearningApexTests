@isTest
private class HTTPRequestExampleTest {

    @isTest
    static void getFirstUserNameFromExternalAPITest() {

        HTTPRequestExampleMock myMockResponse = new HTTPRequestExampleMock();
        myMockResponse.setSuccess(true);

        Test.setMock(HttpCalloutMock.class, myMockResponse);
        Assert.areEqual('Bilbo Baggins', HTTPRequestExample.getFirstUserNameFromExternalAPI());
    }

    @isTest
    static void getFirstUserNameFromExternalAPITest_Error() {

        HTTPRequestExampleMock myMockResponse = new HTTPRequestExampleMock();
        myMockResponse.setSuccess(false);

        Test.setMock(HttpCalloutMock.class, myMockResponse);
        Assert.areEqual('The Dark Lord Won.', HTTPRequestExample.getFirstUserNameFromExternalAPI());
    }
}