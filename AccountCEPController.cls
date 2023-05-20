public with sharing class AccountCEPController {
    @AuraEnabled(cacheable=true)

    public static String searchCEP(String cep) {
        try {
            //searchCEP testeando = new searchCEP();
            ConsultaCEPService request = ConsultaCEPService.getInstance();
            CEPDTO.CEPResponse responseIntegration = request.consultaCEP(cep);
            return JSON.serialize(responseIntegration);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        
    }
    @AuraEnabled()
    public static Integer searchAccount(String id, String city, String state, String uf, String logradouro, String cep){
        try {
            Account acc = AccountDAO.getAccount(id);
            acc.ShippingCity = city;
            acc.ShippingStreet = logradouro;
            acc.ShippingState = state;
            acc.ShippingPostalCode = cep;
            acc.ShippingCountry = 'Brasil';
            update acc;
            return 1;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        
    }
}
