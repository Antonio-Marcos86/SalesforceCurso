@isTest
public class ClasseDemonstraEstruturaTest {
    @isTest
    static void testNomeDoMetodo(){
        Test.startTest();
        ClasseDemonstraEstrutura.nomeDoMetodo();
        System.assertEquals('false', 'false','retorno deve ser igual a false');
        Test.stopTest();
    }
    @isTest
    static void testgetOpportunity(){
        List<Opportunity> opportunityList = new List<Opportunity>([SELECT Id, Name, StageName FROM Opportunity WHERE StageName = 'Closed Won']);
        Test.startTest();
        ClasseDemonstraEstrutura.getOpportunity();
        System.assertEquals(opportunityList, opportunityList,'são iguais');
        Test.stopTest();
    }
    @isTest
    static void testmetodoSemRetorno(){
        Test.startTest();
        ClasseDemonstraEstrutura.metodoSemRetorno('Antonio');
    
        Test.stopTest();
    }
    @isTest
    static void testacelerar(){
        Test.startTest();
        ClasseDemonstraEstrutura.acelerar(15);  
        
        Test.stopTest();
    }
    @isTest
    static void testdmlAccountInsert(){
        Test.startTest();
        ClasseDemonstraEstrutura.dmlAccountInsert('Antonio');
    
        Test.stopTest();
    }
    
     @isTest
    static void testdmlAccountUpdate(){
        Account conta = new Account();
        conta.Name = 'Classe de teste';
        insert conta;
        Test.startTest();
        ClasseDemonstraEstrutura.dmlAccountUpdate('Minha conta 2', conta.Id);
    
        Test.stopTest();
    }
    
     @isTest
    static void testdmldmlAccountDelete(){
        
        Account conta = new Account(Name = 'Antonio');
            insert conta;
            Test.startTest();
		ClasseDemonstraEstrutura.dmlAccountDelete(conta.Name, conta.Id);
        
        Test.stopTest();
    }
    @istest
    static void testdeletarContas(){
        Test.startTest();
        ClasseDemonstraEstrutura.deletarContas();
    
        Test.stopTest();
    }
     @istest
    static void testtotaldesafio(){
        Test.startTest();
        ClasseDemonstraEstrutura.totaldesafio();
    
        Test.stopTest();
    }

     @istest
    static void testtotalOportunidadesAmount(){
        Test.startTest();
        ClasseDemonstraEstrutura.totalOportunidadesAmount();
    
        Test.stopTest();
    }
    
    @isTest
    static void testcriaDezContas(){
        Test.startTest();
            ClasseDemonstraEstrutura.criaDezContas();
        Test.stopTest();
    }
    
    @isTest
    static void demosntraMap(){
        Test.startTest();
        ClasseDemonstraEstrutura.demosntraMap();
    
        Test.stopTest();
    }
    
    @isTest
    static void testcriaLead(){
        Test.startTest();
        ClasseDemonstraEstrutura.criaLead('company', 'name');
    
        Test.stopTest();
    }
    
    
    
}