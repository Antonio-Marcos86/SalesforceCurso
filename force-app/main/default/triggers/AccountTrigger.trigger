trigger AccountTrigger on Account (before insert, after insert, before delete, before update) {
  
    AccountTriggerHandler handler = New AccountTriggerHandler(
        Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap
    );

    switch on Trigger.operationType {
        When BEFORE_INSERT{
            handler.beforeInsert();
        }
        When AFTER_INSERT {
            handler.afterInsert();
        }
        When BEFORE_DELETE{
            handler.beforeDelete();
        }
    }

    // DESAFIO toda vez que criar uma nova conta, com o campo = Private , deve criar uma tarefa para o proprietário da conta,
    // verificar os dados cadastrais da mesma

    if(Trigger.isInsert && Trigger.isAfter){
        String proprietario = 'Private';
        List<Task> taskList = new List<Task>();

        for(Account conta: Trigger.new){
            if(conta.Ownership == proprietario){
                Task taskObj = new Task();
                taskObj.Subject = 'Verificar os dados da conta';
                taskObj.ActivityDate = System.Today();
                taskObj.WhatId = conta.Id;
                taskList.add(taskObj);
            }
            
        }
        if(taskList.size() > 0){
            insert taskList;
        }

    }

    if(Trigger.IsUpdate && Trigger.IsBefore){
        for(Account conta: Trigger.new){
            conta.Phone = '5555-5555';
        }

    }

    
  
       

}