public without sharing class CEPDTO {
    private static final CEPDTO instancia = new CEPDTO();
    public static CEPDTO getInstance() {
        return instancia;
    }
    public class CEPDTOException extends Exception {	}

    public CEPDTO() {}

    public class CEPRequest{
        public String cep {get;set;}
        
        public CEPRequest(String cep){
            this.cep = IntegrationUtils.getInstance().removeNonNumbers(cep);
        }
    }
    
    public class CEPResponse{
        public String cep {get;set;}
        public String logradouro {get;set;}
        public String complemento {get;set;}
        public String bairro {get;set;}
        public String localidade {get;set;}
        public String uf {get;set;}
        //public String ibge {get;set;}
        //public String gia {get;set;}
        public String ddd {get;set;}
        //public String siafi {get;set;}

        public CEPResponse parse(String entrance){
            CEPResponse cepToReturn = new CEPResponse();
            try {
                cepToReturn = (CEPResponse) JSON.deserialize(entrance,CEPResponse.class);
            } catch (Exception e) {
                throw new CEPDTOException('Error on CEPResponse.parse - '+e.getLineNumber()+' - '+ e.getMessage() +' - ' +e.getCause());
            }
            return cepToReturn;
        }

        public List<CEPResponse> listParse(String entrance){
            List<CEPResponse> cepToReturn = new List<CEPResponse>();
            try {
                cepToReturn = (List<CEPResponse>) JSON.deserialize(entrance,List<CEPResponse>.class);
            } catch (Exception e) {
                throw new CEPDTOException('Error on CEPResponse.listParse - '+e.getLineNumber()+' - '+ e.getMessage() +' - ' +e.getCause());
            }
            return cepToReturn;
        }
    }
}
