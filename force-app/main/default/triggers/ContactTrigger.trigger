trigger ContactTrigger on Contact (after insert, after delete) {


    ContactTriggerHandler handler = new ContactTriggerHandler(
        Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap
    );

    switch on Trigger.operationType{
        When AFTER_DELETE {
            handler.afterDelete();
        }
    }

    // toda vez que inserimos um contato novo, enviar um email de aviso para o mesmo
    if(Trigger.isInsert && Trigger.isAfter){
        // enviar para contatos que tenham uma conta vinculada e tenham o email, enviar para o email da conta
        Set<id> idsContas = new Set<id>();
        for(Contact contato : Trigger.new ){
            idsContas.add(contato.AccountId);
        }

        Map<Id,Account> contaMap = new Map<Id,Account>([SELECT Id, Email__c FROM Account WHERE Id IN : idsContas]);

        List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();

        for(Contact contato : Trigger.new){
            String emailConta = null;

            emailConta = contaMap.containsKey(contato.AccountId)? String.valueOf(contaMap.get(contato.AccountId).Email__c) : null ;
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            String[] toAddress = new String[]{emailConta};
            
            if(String.IsNotBlank(emailConta)){
                email.saveAsActivity = false;
                email.setTargetObjectId(UserInfo.getUserId());
                email.setToAddresses(toAddress);
                email.setSubject('Novo Contato Adicionado');
                email.setPlainTextBody('Foi criado o contato com o seguinte nome ' + contato.FirstName + ' ' + contato.LastName);

                //  Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
                emailList.add(email);
            }

        }
        if(emailList.size() > 0){
         Messaging.sendEmail(emailList);

        }

    }

}