@isTest
public with sharing class LeadTriggerTest {
    @isTest
    static void LeadTriggerTest() {
        Lead lead = new Lead();
        lead.LastName = 'Teste lead Trigger';
        lead.Company = 'Lead company';

        insert lead;


    }
}
