import { LightningElement, wire, api } from 'lwc';
import controllerCEP from '@salesforce/apex/AccountCEPController.searchCEP';
import controllerAccount from '@salesforce/apex/AccountCEPController.searchAccount';
import { updateRecord } from 'lightning/uiRecordApi'
export default class AccountCEP extends LightningElement {
    @api recordId
    valueCEP;
    Address;
    AddressError;
    wiredAccountList = [];
    searchingForCEP(event){
        this.valueCEP = this.template.querySelector('lightning-input').value;
        this.Address = '';
        this.AddressError = '';
        controllerCEP({cep : this.valueCEP})
            .then((result) => {
                console.log(result);
                
                let data = JSON.parse(result);
                if(data.cep == null){
                    this.AddressError = data;
                }else{
                    this.Address = data;
                }
                
            })
            .catch((error) => {
                this.AddressError = error;
            });
    }

    saveAccount(event){
        controllerAccount({id : this.recordId, city: this.Address.localidade, state: this.Address.uf, logradouro: this.Address.logradouro, cep: this.Address.cep})
            .then((result) => {
                window.top.location.reload();
                //refreshApex(this.wiredAccountList);
            })
            .catch((error) => {
                console.log("erro2");
                console.log(error);
            });
    }

    clearAccount(event){
        window.top.location.reload();
    }
}