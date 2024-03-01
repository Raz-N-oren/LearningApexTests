@IsTest
public with sharing class HTTPRequestExampleMock implements HttpCalloutMock{

    private Boolean success;
    public void setSuccess(Boolean success){
        this.success = success;
    }

    public HttpResponse respond(HttpRequest req){

        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');

        if(this.success){
            response.setBody('[{"name":"Bilbo Baggins"},{"name":"Frodo Baggins"}]');
            response.setStatusCode(200);
        }
        else{
            response.setBody('{"error":"The Dark Lord Won."}');
            response.setStatusCode(500);
        }

        return response;
    }
}