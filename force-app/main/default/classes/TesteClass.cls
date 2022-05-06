public with sharing class TesteClass {

    @AuraEnabled
    public static Boolean validarTranscricao(Id idTranscricao)
    {
        System.debug('ProtocoloTranscricaoVMLight >> validarTranscricao >> '+ idTranscricao);
        try
        {
            ProtocoloTranscricaoCtrl protocoloTranscricaoCtrl = new ProtocoloTranscricaoCtrl();
            return protocoloTranscricaoCtrl.validarTranscricao(idTranscricao);
        } catch (Exception e)
        {
            System.debug('ProtocoloTranscricaoVMLight >> validarTranscricao >> e.getMessage ' + e.getMessage());
            System.debug('ProtocoloTranscricaoVMLight >> validarTranscricao >> e.getStackTraceString() > '+e.getStackTraceString());
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static ProtocoloTranscricaoCtrl.DadosRetorno vincularProtocoloPorCpfCnpj(String numCpfCnpj)
    {
        try
        {
            ProtocoloTranscricaoCtrl protocoloTranscricaoCtrl = new ProtocoloTranscricaoCtrl();
            ProtocoloTranscricaoCtrl.DadosRetorno dadosRetorno = new ProtocoloTranscricaoCtrl.DadosRetorno();
            dadosRetorno = protocoloTranscricaoCtrl.consultaCliente(numCpfCnpj);

            return dadosRetorno;
        }catch(Exception e)
        {
            System.debug('ProtocoloTranscricaoVMLight >> vincularProtocoloPorCpfCnpj >> Exception >> ' + e.getMessage());
            System.debug('ProtocoloTranscricaoVMLight >> vincularProtocoloPorCpfCnpj >> StackTraceString >> ' + e.getStackTraceString());
            throw new AuraException(e.getMessage());
        }
    } 

    @AuraEnabled
    public static ProtocoloTranscricaoCtrl.DadosRetorno vincularProtocolo(String idTranscricao, String idCliente, ProtocoloTranscricaoCtrl.DadosLead dadosLead)
    {
        try
        {
            ProtocoloTranscricaoCtrl protocoloTranscricaoCtrl = new ProtocoloTranscricaoCtrl();
            ProtocoloTranscricaoCtrl.DadosRetorno dadosRetorno = new ProtocoloTranscricaoCtrl.DadosRetorno();
            dadosRetorno = protocoloTranscricaoCtrl.vincularProtocolo(idTranscricao, idCliente, dadosLead);
            return dadosRetorno;
        }catch(Exception e)
        {
            System.debug('ProtocoloTranscricaoVMLight >> vincularProtocolo >> Exception >> ' + e.getMessage());
            System.debug('ProtocoloTranscricaoVMLight >> vincularProtocolo >> StackTraceString >> ' + e.getStackTraceString());
            throw new AuraException(e.getMessage());
        }
    } 

}

//     @isTest
// private class ProtocoloTranscricaoCtrlTeste
// {
   
//     @isTest 
    
//     static void validarTranscricaoNaoConcluidoTest(){
//        Boolean retorno = null;
//         LiveChatVisitor visitante = New LiveChatVisitor();
//         Insert visitante;
//         LiveChatTranscript transcricao = New LiveChatTranscript();
//         transcricao.Status = 'InProgress';
//         transcricao.LiveChatVisitorId = visitante.Id;
//         Insert transcricao;
               
//       Test.startTest();
        
//        retorno = ProtocoloTranscricaoCtrl.validarTranscricao(transcricao.Id);
//         Test.stopTest();
        
        
        
//     }
//       @isTest 
    
//     static void validarTranscricaoInvalidaTest(){
//        Boolean retorno = null;
       
//         LiveChatVisitor visitante = New LiveChatVisitor();
//         Insert visitante;
//         LiveChatTranscript transcricao = New LiveChatTranscript();
//         transcricao.Status = 'InProgress';
//         transcricao.LiveChatVisitorId = visitante.Id;
       
       
               
//       Test.startTest();
        
//        retorno = ProtocoloTranscricaoCtrl.validarTranscricao(transcricao.Id);
//         Test.stopTest();
        
        
        
//    } 
//     }
// }