import { LightningElement, api, track, wire } from 'lwc';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import buscaMarca from '@salesforce/apex/spinner.buscaMarca';

export default class Spinner extends LightningElement {
    @api recordId;
    @track abrirModal = false
    @track MARCA;
    @track MODELO;
    @track ANO;
    @track NOVO;
    @track marcaDigitada;
    @track temCliente = false;
    @track showSpinner = true;
    
    @wire(buscaMarca,{marca : '&marcaDigitada'})
    carros;


    abrirModal()
    {
        this.abrirModal = true;
        
    }

    fecharModal()
    {
        this.abrirModal = false;
    }

    changeCpfCnpj(element)
    {
        this.marcaDigitada = element.target.value;
    }

    validarTranscricao(){
        this.temCliente = false;
        this.abrirModal = true;
        this.showSpinner = true;
    }// fecha metódo validarTranscricao

    validarCliente() { 
        buscaMarca({marca: this.marcaDigitada}).then(
            result=>{
                if(result != null){
                    this.MARCA = result[0].Name;
                    this.MODELO = result[0].Modelo__c;
                    this.ANO = result[0].AnoModelo__c;
                    this.NOVO = result[0].CarroNovo__c;

                    this.temCliente = true;
                    this.showSpinner = false;
                    }else{
                        alert('else');
                        this.temCliente = false;
                        const event = new ShowToastEvent({
                            title: 'Erro',
                            message: 'Veículo não encontrado',
                            variant: 'error',
                            mode: 'dismissable'
                        });
                        this.dispatchEvent(event);
                    }
                    
            });  
            
    }

    vincularProtocolo() {    
         
        const event = new ShowToastEvent({
            title: 'Sucesso',
            message: 'Protocolo gerado com sucesso!',
            variant: 'Success',
            mode: 'dismissable'
        });
        this.dispatchEvent(event);
           
        this.fecharModal();
    }
}