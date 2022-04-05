trigger LeadTrigger on Lead (before insert, after insert , before update, after update) {
    // incluir uma tarefa e associar a um Lead
    // Trigger.new
    if(Trigger.isInsert && Trigger.isAfter){
        List<Task> taskList = new List<Task>();
        for(Lead cont: Trigger.new){
            Task taskObj = new Task();
            taskObj.Subject = 'Entrar em contato com o Lead';
            taskObj.ActivityDate = System.Today();
            taskObj.WhoId = cont.Id;
            taskList.add(taskObj);
        }
        if(taskList.size() > 0){
            insert taskList;
        }
    }
  
    
   

}