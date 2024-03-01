public with sharing class TestVisibleExample {

    public static String getGreeting() {
        return printGreetingStart() + ' ' + printGreetingEnd();
    }
   
    @TestVisible
    private static String printGreetingStart(){
        return 'Hello';
    }
   
    @TestVisible
    private static String printGreetingEnd(){
        return 'World!';
    }
}