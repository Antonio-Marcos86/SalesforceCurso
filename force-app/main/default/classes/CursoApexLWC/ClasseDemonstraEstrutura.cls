// nome da classe
public with sharing class ClasseDemonstraEstrutura {

 // metódo da classe (pode ter vários metódos)
  public static boolean nomeDoMetodo(){
    // variáveis do tipo primitivos
    boolean bTrue = true;
    boolean bFalse = false;
    String exemploString = 'texto';
    integer exemploInteiro = 1;
    Decimal exemploDecimal = 1.56;
    Double exemploDouble = 1.598985;

    // variáveis usando objetos
    Account account = new Account();
    Contact contato = new Contact();

    // chamando os campos após declarar a variável
    account.Name = 'Antonio';

    // coleções
    List<String> exemploLista = new List<String>(); // seta uma lista vazia
    system.debug('exemploLista vazia => ' + exemploLista);
    List<String> exemploListaComDadosPreDefinidos = new List<String>();
    system.debug('exemploLista com dados pré  definidos => ' + exemploLista);

    // add dados na lista
    exemploLista.add('Adicionando dado 1');
    exemploLista.add('Adicionando dado 2');
    exemploLista.add('Adicionando dado 3');
    exemploLista.add('Adicionando dado 4');
    exemploLista.add('Adicionando dado 5');
    system.debug('exemploLista vazia => ' + exemploLista);
    // removendo dados na lista
    exemploLista.remove(2);
    system.debug('exemploLista vazia => ' + exemploLista);
    // buscar por posição
    exemploLista.get(1);
    system.debug('exemploLista por posição => ' + exemploLista.get(1));
    // tamanho da lista 
    exemploLista.size();
    system.debug('exemploLista por posição => ' + exemploLista.size());

    //SET 
    Set<String> exemploSet = new Set<string>();
    system.debug('Exemplo de set vazio ' + exemploSet);
    // adicionando dados
    exemploSet.add('Antonio');
    exemploSet.add('Ana Paula');
    exemploSet.add('Lara');
    exemploSet.add('Emilly');
    system.debug('Exemplo de set ' + exemploSet);

    List<Opportunity> opportunityList = new List<Opportunity>([SELECT Id,Name FROM Opportunity]);
    system.debug('OpportunityList ' + opportunityList );


    return bFalse;
  
  }

  // estrutura do SOQL
  // SELECT campos FROM nome do objeto WHERE condição de busca
  public static List<Opportunity> getOpportunity(){
    List<Opportunity> opportunityList = new List<Opportunity>([SELECT Id, Name, StageName FROM Opportunity WHERE StageName = 'Closed Won']); 
    system.debug(opportunityList);
    return opportunityList;
  }

  public static void metodoSemRetorno(String nome){
    system.debug('Olá ' + nome);

  }

  public static Integer acelerar( Integer velocidade){
      Integer acelerar = velocidade + 10;
      return acelerar;

  }

  // execução DML

  public static Account dmlAccountInsert(String name){
    Account conta = new Account();
    conta.Name = name;

    // inserindo dados 
    insert conta;

    return conta;
  }

    public static Account dmlAccountUpdate(String name, String IdConta){
      List<Account> contaLista = new List<Account>([SELECT Id , Name FROM Account WHERE Id= :IdConta]);// buscar informações
      Account conta = contaLista.get(0);
      conta.Name = name;

    // atualizando dados 
    update conta;

    return conta;
  }

   public static void dmlAccountDelete(String name, String IdConta){
      List<Account> contaLista = [SELECT Id , Name FROM Account WHERE Id= :IdConta];// buscar informações
      // deletar conta
     delete contaLista;
  }
  public static void criaLead(String company, String name){
    Lead lead = new lead();
  lead.Company = company;
  lead.LastName = name;

    insert lead;

    system.debug([SELECT Id FROM lead Where Name = :name ]);

  }

  // Desafio : Buscar e retornar o valor das oportunidade que a fases não seja 'Closed Won' e 'Closed Lost'
  public static Integer totaldesafio(){

    List<Opportunity> opportunityList = [SELECT Name From Opportunity WHERE StageName !='Closed Won' AND StageName!= 'Closed Lost'];
    system.debug('Total => ' + opportunityList.size());
    return opportunityList.size();

  }

  public static Decimal totalOportunidadesAmount(){
    Decimal total = 0;
   // for(Opportunity opp : [SELECT Amount FROM Opportunity WHERE StageName != 'Closed Won' AND StageName!= 'Closed Lost']){
    for(Opportunity opp : [SELECT Amount FROM Opportunity WHERE StageName = 'Qualification']){
        total += opp.Amount;
    }
    system.debug('total Amount => ' + total);
    return total;
  }

  // DESAFIO: Criar 10 Contas com o Nome 'Conta 1', 'Conta 2' e não retornar nada

   public static void criaDezContas(){
   // isto está errado pois está acessando muitas vezes o banco com muitos DMLs
    for(Integer cont = 1 ; cont < 11 ;cont++){
        Account conta = New Account();
        conta.Name = 'Conta ' + cont;
        insert conta;
        system.debug(conta);
    }

    List<Account> contaLista = new List<Account>();
    for(integer cont = 1 ; cont< 11; cont++ ){
      Account conta = new Account();
      conta.Name = 'Conta Lista ' + cont;
      contaLista.add(conta);
    }
    system.debug(contaLista);
    insert contaLista;
  }

  // MAPS
  // Map<chave, tipo> nomeMap = instância
  public static void demosntraMap(){
    Map<Id, Opportunity> oppMap = new Map<Id,Opportunity>([SELECT Id,Name FROM Opportunity]);
    system.debug(oppMap);

    if(oppMap.containsKey('0068c00000pxYuyAAE')){
        system.debug('Contem o id');
    }else{
        system.debug('Não contem o Id');
    }

    Map<String, Account> contaMap = new Map<String,Account>();

    for(Account conta : [SELECT Id,Name FROM Account]){
      contaMap.put('Conta ',conta);
    }

  }

  public static void deletarContas(){
      Map<String, Account> contaMap = new Map<String,Account>();

     List<Account> contaList = [SELECT Id,Name FROM Account];
     for(Account conta : contaList){
       for( Integer i = 0 ; i<11 ; i++){
         String nome = 'A conta ' + i;
         String nomeLista = 'Conta Lista ' + i;
        if(Conta.Name.equals(nome) || Conta.Name.equals(nomeLista)){
          contaMap.put(conta.Name, conta);    
        }
       }
     }

     List<Account> contaDeleteList = new List<Account>(contaMap.values());
     //contaDeleteList.add(contaMap.values());

   
     system.debug(contaList);
     system.debug(contaMap);
     system.debug(contaDeleteList);

    if(contaDeleteList.size() > 0){
      delete contaDeleteList;
    }

   
  }

}//fim da classe