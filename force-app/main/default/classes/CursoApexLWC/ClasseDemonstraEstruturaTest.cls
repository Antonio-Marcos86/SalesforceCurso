@isTest
public class ClasseDemonstraEstruturaTest {
    @isTest
    static void testNomeDoMetodo(){
        ClasseDemonstraEstrutura.nomeDoMetodo();
    }
    @isTest
    static void testgetOpportunity(){
        ClasseDemonstraEstrutura.getOpportunity();
    }
    @isTest
    static void testmetodoSemRetorno(){
        ClasseDemonstraEstrutura.metodoSemRetorno('Antonio');
    }
    @isTest
    static void testacelerar(){
        ClasseDemonstraEstrutura.acelerar(15);
    }
    @isTest
    static void testdmlAccountInsert(){
        ClasseDemonstraEstrutura.dmlAccountInsert('Antonio');
    }
    
     @isTest
    static void testdmlAccountUpdate(){
        Account conta = new Account();
        conta.Name = 'Classe de teste';
        insert conta;
        ClasseDemonstraEstrutura.dmlAccountUpdate('Minha conta 2', conta.Id);
    }
    
     @isTest
    static void testdmldmlAccountDelete(){
		ClasseDemonstraEstrutura.dmlAccountDelete('Antonio', '0038c00002kdIHXAA2');
 
    }
    @istest
    static void testdeletarContas(){
        ClasseDemonstraEstrutura.deletarContas();
    }
     @istest
    static void testtotaldesafio(){
        ClasseDemonstraEstrutura.totaldesafio();
    }
     @istest
    static void testtotalOportunidadesAmount(){
        ClasseDemonstraEstrutura.totalOportunidadesAmount();
    }
    
    @isTest
    static void testcriaDezContas(){
        ClasseDemonstraEstrutura.criaDezContas();
    }
    
    @isTest
    static void demosntraMap(){
        ClasseDemonstraEstrutura.demosntraMap();
    }
    
    @isTest
    static void testcriaLead(){
        ClasseDemonstraEstrutura.criaLead('company', 'name');
    }
    
    
    
}