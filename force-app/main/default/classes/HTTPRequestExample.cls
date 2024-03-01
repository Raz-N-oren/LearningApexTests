public with sharing class HTTPRequestExample {

    public static String getFirstUserNameFromExternalAPI(){
        String endpoint = 'https://jsonplaceholder.typicode.com/users';
        String method = 'GET';
        HttpRequest httpRequest = new HttpRequest();
        httpRequest.setEndpoint(endpoint);
        httpRequest.setMethod(method);
   
        Http http = new Http();
        HttpResponse httpResponse = http.send(httpRequest);
        System.debug(httpResponse.getBody());
        String result;
        if(httpResponse.getStatusCode() == 200){
            List<UserFromAPI> users = (List<UserFromAPI>)
            JSON.deserialize(httpResponse.getBody(), List<UserFromAPI>.class);
            result = users[0].getName();
        }
        else{
        Map<String, Object> error = (Map<String, Object>)
        JSON.deserializeUntyped(httpResponse.getBody());
        result = (String) error.get('error');
        }
   
        return result;
    }

    private class UserFromAPI{
        private String name;
        public String getName(){
            return this.name;
        }
    }
}