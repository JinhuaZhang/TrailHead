public class ParkLocator {
    
    public static List<String> country(String country){
        ParkService.ParksImplPort parkNames = new ParkService.ParksImplPort();
        return parkNames.byCountry(country);
    }
}
