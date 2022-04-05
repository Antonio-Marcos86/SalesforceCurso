trigger AccountTrigger on Account (before insert, after insert, before delete) {
  
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

}