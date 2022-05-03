import { LightningElement, api, track, wire } from 'lwc';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import { createRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import buscaMarca from '@salesforce/apex/Busca.buscaMarca';
// import vinculaTarefa from '@salesforce/apex/Busca.vinculaTarefa';

export default class Spinner extends LightningElement {
    @api recordId;
    @track abrirModal = false
    @track NOME;
    @track CPF;
    @track Id;
    @track TELEFONE;
    @track cpfCnpjDigitado;
    @track temCliente = false;
    @track showSpinner = false;
    

    abrirModal()
    {
        this.abrirModal = true;        
    }

    fecharModal()
    {
        this.abrirModal = false;
    }

    validarTranscricao(){
        this.temCliente = false;
        this.abrirModal = true;
    }// fecha metódo validarTranscricao

    validarCliente() { 
       
         buscaMarca({cpf: this.cpfCnpjDigitado}).then(
             result=>{
                 alert(JSON.stringify(result) );
                 if(result != null){
                    this.NOME = result[0].Name;
                    this.CPF = result[0].CPF_CNPJ__c;
                    this.TELEFONE = result[0].Phone;
                    this.Id= result[0].Id;
                     this.temCliente = true;
                     setTimeout(() => {
                        this.ready = true;
                    }, 3000);
                     this.showSpinner = false;
                     
                }
                    
            }).catch(error=>{
                this.temCliente = false;
                this.showSpinner = false;
                const event = new ShowToastEvent({
                    title: 'Erro',
                    message: 'Contato não encontrado',
                    variant: 'error',
                    mode: 'dismissable'
                    });
                    this.dispatchEvent(event);
            });  
            
    }
    vincularProtocolo() {    
        // vinculaTarefa().then(
        //     result=>{
        //         if(result = true){
        //             const event = new ShowToastEvent({
        //                 title: 'Sucesso',
        //                 message: 'Protocolo gerado com sucesso!',
        //                 variant: 'Success',
        //                 mode: 'dismissable'
        //             });
        //             this.dispatchEvent(event);
                    
        //        }else{
        //            const event = new ShowToastEvent({
        //                title: 'Erro',
        //                message: 'Veículo não encontrado',
        //                variant: 'error',
        //                mode: 'dismissable'
        //            });
        //            this.dispatchEvent(event);
        //        }
                   
        //    });  
        this.createAccount();
        this.fecharModal();
     }
   

    handleMaskCPF(event) {
        this.cpfCnpjDigitado = event.target.value
        if(event.target.value.length <=14){ // CPF
            const x = event.target.value
            .replace(/\D+/g, '')
            .match(/(\d{0,3})(\d{0,3})(\d{0,3})(\d{0,2})/);
            event.target.value =
            `${x[1]}` + (x[2] ? `.${x[2]}` : ``) + (x[3] ? `.${x[3]}` : ``) + (x[4] ? `-${x[4]}` : ``);
        }else{ //CNPJ
            const x = event.target.value
            .replace(/\D/g, '')
            .match(/(\d{0,2})(\d{0,3})(\d{0,3})(\d{0,4})(\d{0,2})/);
            event.target.value =
            !x[2] ? x[1] : x[1] + '.' + x[2] + '.' + x[3] + '/' + x[4] + (x[5] ? '-' + x[5] : '');
        }
  
        
    }

    mudar(){
        this.cpfCnpjDigitado = this.cpfCnpjDigitado.replace(/\D+/g, '');
        this.showSpinner = true;
    }
       
    // Insert record.
    createAccount(){
        // Creating mapping of fields of Account with values
        var fields = {'ContactId' : this.Id, 'Status' : 'New', 'Priority' : 'Medium'};
        // Record details to pass to create method with api name of Object.
        var objRecordInput = {'apiName' : 'Case', fields};
        // LDS method to create record.
        createRecord(objRecordInput).then(response => {
            const event = new ShowToastEvent({
                title: 'Sucesso',
                message: 'Caso com '+ response.id +' gerado com sucesso!',
                variant: 'Success',
                mode: 'dismissable'
                });
            this.dispatchEvent(event);
        }).catch(error => {
            alert('Error: ' +JSON.stringify(error));
        });
    }
    
}