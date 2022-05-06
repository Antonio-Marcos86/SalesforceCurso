@isTest
public class ClasseDemonstraEstruturaTest {
    @isTest
    static void testNomeDoMetodo(){
        Test.startTest();
        ClasseDemonstraEstrutura.nomeDoMetodo();
        System.assertEquals();
        Test.stopTest();
    }
    @isTest
    static void testgetOpportunity(){
        Test.startTest();
        ClasseDemonstraEstrutura.getOpportunity();
        System.assertEquals();
        Test.stopTest();
    }
    @isTest
    static void testmetodoSemRetorno(){
        Test.startTest();
        ClasseDemonstraEstrutura.metodoSemRetorno('Antonio');
        System.assertEquals();
        Test.stopTest();
    }
    @isTest
    static void testacelerar(){
        Test.startTest();
        ClasseDemonstraEstrutura.acelerar(15);  
         System.assertEquals();
        Test.stopTest();
    }
    @isTest
    static void testdmlAccountInsert(){
        Test.startTest();
        ClasseDemonstraEstrutura.dmlAccountInsert('Antonio');
        System.assertEquals();
        Test.stopTest();
    }
    
     @isTest
    static void testdmlAccountUpdate(){
        Account conta = new Account();
        conta.Name = 'Classe de teste';
        insert conta;
        Test.startTest();
        ClasseDemonstraEstrutura.dmlAccountUpdate('Minha conta 2', conta.Id);
        System.assertEquals();
        Test.stopTest();
    }
    
     @isTest
    static void testdmldmlAccountDelete(){
        
        Account conta = new Account(Name = 'Antonio');
            insert conta;
            Test.startTest();
		ClasseDemonstraEstrutura.dmlAccountDelete(conta.Name, conta.Id);
            System.assertEquals();
        Test.stopTest();
    }
    @istest
    static void testdeletarContas(){
        Test.startTest();
        ClasseDemonstraEstrutura.deletarContas();
        System.assertEquals();
        Test.stopTest();
    }
     @istest
    static void testtotaldesafio(){
        Test.startTest();
        ClasseDemonstraEstrutura.totaldesafio();
        System.assertEquals();
        Test.stopTest();
    }

     @istest
    static void testtotalOportunidadesAmount(){
        Test.startTest();
        ClasseDemonstraEstrutura.totalOportunidadesAmount();
        System.assertEquals();
        Test.stopTest();
    }
    
    @isTest
    static void testcriaDezContas(){
        Test.startTest();
            ClasseDemonstraEstrutura.criaDezContas();
            System.assert();
        Test.stopTest();
    }
    
    @isTest
    static void demosntraMap(){
        Test.startTest();
        ClasseDemonstraEstrutura.demosntraMap();
        System.assertEquals();
        Test.stopTest();
    }
    
    @isTest
    static void testcriaLead(){
        Test.startTest();
        ClasseDemonstraEstrutura.criaLead('company', 'name');
        System.assertEquals();
        Test.stopTest();
    }
    
    
    
}