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
        for(Contact contato : Trigger.new){
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            string[]  toAddress = new String[]{'a.marcos1986@hotmail.com', 'a.marcos201986@gmail.com'};

        }
    }

}