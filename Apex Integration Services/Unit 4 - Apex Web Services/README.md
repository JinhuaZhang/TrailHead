Create an Apex REST class that is accessible at /Accounts/<Account_ID>/contacts. The service will return the account's ID and Name plus the ID and Name of all contacts associated with the account. Write unit tests that achieve 100% code coverage for the class and run your Apex tests.  

Create an Apex class  
> Name: AccountManager  
> Class must have a method called getAccount  
> Method must be annotated with @HttpGet and return an Account object  
> Method must return the ID and Name for the requested record and all associated contacts with their ID and Name  

Create unit tests  
> Unit tests must be in a separate Apex class called AccountManagerTest  
> Unit tests must cover all lines of code included in the AccountManager class, resulting in 100% code coverage  