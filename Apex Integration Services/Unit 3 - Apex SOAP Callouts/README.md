Generate an Apex class using WSDL2Apex for a SOAP web service, write unit tests that achieve 100% code coverage for the class using a mock response, and run your Apex tests.  

Generate a class using this using this [WSDL](https://th-apex-soap-service.herokuapp.com/assets/parks.xml?_ga=2.147545011.529718750.1632683419-1511497032.1621268416&_gac=1.18218059.1631713406.Cj0KCQjws4aKBhDPARIsAIWH0JXgyeafHk8zr-A0lfd4nLxiBiWk1Ok4B52JP3cm1k29dUmPlYuMonYaAsAxEALw_wcB) file:  
> Name: ParkService (Tip: After you click the Parse WSDL button, change the Apex Class Name from parksServices to ParkService)  
> Class must be in public scope  

Create a class:  
> Name: ParkLocator 
> Class must have a country method that uses the ParkService class  
> Method must return an array of available park names for a particular country passed to the web service (such as Germany, India, Japan, and United States)  

Create a test class:  
> Name: ParkLocatorTest  
> Test class uses a mock class called ParkServiceMock to mock the callout response  

Create unit tests:  
> Unit tests must cover all lines of code included in the ParkLocator class, resulting in 100% code coverage.  

Run your test class at least once (via Run All tests the Developer Console) before attempting to verify this challenge.