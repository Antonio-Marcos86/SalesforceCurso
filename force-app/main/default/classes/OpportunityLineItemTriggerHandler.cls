public with sharing class OpportunityLineItemTriggerHandler {
     List<Account> oldRecords {get; set;} // Trigger.old
    List<Account> newRecords {get; set;} // Trigger.new
    Map<Id,Account> oldmap {get; set;} // Trigger.oldMap
    Map<Id,Account> newMap {get; set;} // Trigger.newMap

    public OpportunityLineItemTriggerHandler(List<OpportunityLineItem> oldRecords ,  List<OpportunityLineItem> newRecords, Map<Id,OpportunityLineItem> oldmap, Map<Id,OpportunityLineItem> newMap) {
        this.oldRecords = oldRecords;
        this.newRecords = newRecords;
        this.oldMap = oldMap;
        this.newMap = newMap;

    }
}
