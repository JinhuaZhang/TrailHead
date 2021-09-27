Create an Apex class that returns a list of contacts based on two incoming parameters: the number of contacts to generate and the last name. Do not insert these contact records into the database.  

Create an Apex class in the public scope  
> Name: RandomContactFactory  

Use a Public Static Method to consistently generate contacts with unique first names  
> Name: generateRandomContacts (without the @testMethod annotation)  
> Parameter 1: An integer that controls the number of contacts being generated  
> Parameter 2: A string containing the last name of the contacts  
> Return Type: List  


Note:  
> 1. TestUsingRandomContactFactory is to test if the factory works, it is completely optional  
> 2. As of Sep/2021, if @isTest annotation is added at the beginning of RandomContactFactory class, trailhead will fail checking the challenge. 