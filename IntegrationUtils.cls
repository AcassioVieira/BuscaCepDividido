public class IntegrationUtils {
    private static final IntegrationUtils instancia = new IntegrationUtils();
    public static IntegrationUtils getInstance() {
        return instancia;
    }
    public class IntegrationUtilsException extends Exception {	}

    public IntegrationUtils() {}

    public String removeNonNumbers(String entrance){
        return String.isBlank(entrance) ? entrance : entrance.replaceAll('\\D','');
    }
    
}
