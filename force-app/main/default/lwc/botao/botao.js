import { LightningElement,track, wire, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class Botao extends LightningElement {

    
    @track isModalOpen = false;

    openModal() {
        // to open modal set isModalOpen tarck value as true
        this.isModalOpen = true;
    }
    closeModal() {
        // to close modal set isModalOpen tarck value as false
        this.isModalOpen = false;
    }
    handleSucess(){

        this.closeModal();
        const event = new ShowToastEvent({
            title: 'Carros',
            message:
            'Novo carro criado!',
        });
        this.dispatchEvent(event);
    }
}