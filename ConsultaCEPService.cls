public class ConsultaCEPService {

    private static final ConsultaCEPService instancia = new ConsultaCEPService();
    public static ConsultaCEPService getInstance() {
        return instancia;
    }
    public class ConsultaCEPServiceException extends Exception {	}

    public ConsultaCEPService() {}

    public CEPDTO.CEPResponse consultaCEP(String cep){
        CEPDTO.CEPRequest request = new CEPDTO.CEPRequest(cep);
        CEPDTO.CEPResponse response = new CEPDTO.CEPResponse();
        IntegrationService iService = IntegrationService.getInstance();
        HttpResponse resp = iService.executeHttpRequest('https://viacep.com.br/ws/'+request.cep+'/json', 'GET', null, null, 120000);
        String body = resp.getBody();
        response = response.parse(body);
        System.debug('response da consulta');
        System.debug(response);
        return response;
    }
}
