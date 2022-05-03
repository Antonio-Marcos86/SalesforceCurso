global class Busca {
   
    @AuraEnabled(cacheable=true)
    global static List<Contact> buscaMarca(String cpf){
        List<Contact> contatoLista = new List<Contact>([SELECT Name,Id,CPF_CNPJ__c, Phone  FROM Contact WHERE CPF_CNPJ__c = :cpf]);
        system.debug(contatoLista);
        system.debug(contatoLista.get(0).Name);
        if(contatoLista.size() > 0){
            return contatoLista;
        }else{
            return null;
        }  
    }
    
}
