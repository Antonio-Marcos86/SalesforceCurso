@RestResource(urlMapping = '/AulaDeApex/Leads/')
global with sharing class LeadAPI {

    @HttpGet
    global static void getLeads(){
        RestResponse response = RestContext.response;
        List<Lead> leadList = new List<Lead>([SELECT id , Firstname, LastName FROM Lead]);

        response.responseBody = Blob.valueOf(JSON.serializePretty(leadList));
        response.statusCode = 200;
    }

    // @HttpPost
    // global static void postLeads(){
        
    // }
}
