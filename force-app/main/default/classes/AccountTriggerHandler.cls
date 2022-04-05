public with sharing class AccountTriggerHandler {

    List<Account> oldRecords {get; set;} // Trigger.old
    List<Account> newRecords {get; set;} // Trigger.new
    Map<Id,Account> oldmap {get; set;} // Trigger.oldMap
    Map<Id,Account> newMap {get; set;} // Trigger.newMap

    public AccountTriggerHandler(List<Account> oldRecords ,  List<Account> newRecords, Map<Id,Account> oldmap, Map<Id,Account> newMap) {
        this.oldRecords = oldRecords;
        this.newRecords = newRecords;
        this.oldMap = oldMap;
        this.newMap = newMap;

    }

    // before insert
    public void beforeInsert(){
        AccountHelper.fillAccountDescription(this.newRecords);

    }

    // after insert
    public void afterInsert(){
        // List<Contact> contactList = AccountHelper.createContacts(this.newRecords);
        // insert contactList;

    }

    // Before delete context
    public void beforeDelete(){
        AccountHelper.checkAccountTypeToBlock(this.oldRecords);
    }
}
