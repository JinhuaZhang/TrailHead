public class AnimalLocator {
    
    public static String getAnimalNameById(Integer id) {

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + id);
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);

        // test the URL in browser with ID = 1 to get the JSON format
        // {"animal":{"id":1,"name":"chicken","eats":"chicken food","says":"cluck cluck"}}

        // Deserializes the JSON string into collections of primitive data types.
        Map<String, Object> result = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
        //Cast the value in the 'animal' key as an object
        Map<String, Object> animal = (Map<String, Object>) result.get('animal');

        String name = String.valueOf(animal.get('name'));
        System.debug('name is ' + name);
        return name;
    }
}
