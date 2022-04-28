import { LightningElement, api, track, wire } from 'lwc';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
//import testeJson from '@salesforce/https://pragma-44e-dev-ed--c.visualforce.com/resource/1651160570000/testeJson';
//import { fireEvent } from 'c/pubsub';
//import { tratarErroInesperado } from 'c/tratamentoDeErro';

export default class Spinner extends LightningElement {
    @api recordId;
    @track abrirModal = false;
    @track CpfCnpjDigitado;
    @track cpf;
    @track temCliente = false;
    @track showSpinner = true;
    @track dadosCliente = {
        nomCliente: ''
    };
    

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
        this.CpfCnpjDigitado = element.target.value;
    }

    validarTranscricao()
    {
        // validarTranscricao({idTranscricao:this.recordId})
        //     .then(result => {
        //         if(result)
        //         {
        //             console.log('BotaoProtocoloTranscricao >> validarTranscricao >> result >> ' + result);
        //             this.abrirModal = true;
        //         }
        //     })
        //     .catch(error => {
        //         console.log('BotaoProtocoloTranscricao >> validarTranscricao >> error.body.message >> ' + error.body.message);
        //         this.fecharModal();

        //         const event = new ShowToastEvent({
        //             title: 'Caixa Seguradora',
        //             message: error.body.message,
        //             variant: 'Warning',
        //             mode: 'dismissable'
        //         });
        //         this.dispatchEvent(event);
        //     });

     
         this.connectedCallback();
         this.temCliente = false;
        
    }
    connectedCallback() {
        setTimeout(() => {
            
        }, 3000);
        this.abrirModal = true;
        this.showSpinner = true;
    }

    validarCliente() {
        dados = JSON.stringify(json/teste.JSON);
        alert(dados);
                    this.temCliente = true;
                    this.showSpinner = false;
       
          
    }

    vincularProtocolo() {
        console.log('vincularProtocolo >> this.CpfCnpjDigitado: ' + this.CpfCnpjDigitado);
        vincularProtocolo({ idTranscricao: this.recordId, idCliente: this.dadosCliente.idClienteLead })
        .then(result => {
            if (result) {
                console.log('vincularProtocolo: ' + JSON.stringify(result));

                const event = new ShowToastEvent({
                    title: 'Sucesso',
                    message: 'Protocolo gerado com sucesso!',
                    variant: 'Success',
                    mode: 'dismissable'
                });
                this.dispatchEvent(event);
            }
        })
        .catch(error => {
            tratarErroInesperado(error, this, error.body.message);
            //this.template.querySelector("[data-id=loadingSpinner]").classList.add("slds-hide");
        });
        
        this.fecharModal();
    }

}