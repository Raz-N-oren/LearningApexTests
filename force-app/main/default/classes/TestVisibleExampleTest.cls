@isTest
private class TestVisibleExampleTest {
 @isTest
 static void printGreetingTest() {
    Assert.areEqual(TestVisibleExample.getGreeting(), 'Hello World!');
 }
 @isTest
 static void printGreetingStartTest() {
    Assert.areEqual(TestVisibleExample.printGreetingStart(), 'Hello');
 }
 @isTest
 static void printGreetingEndTest() {
    Assert.areEqual(TestVisibleExample.printGreetingEnd(), 'World!');
 }
}