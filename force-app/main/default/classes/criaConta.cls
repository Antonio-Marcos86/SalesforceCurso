public class criaConta {
    public static void cria(){
    List<Account> conta = new List<Account>();
    for(Integer i = 1 ; i<11 ; i++){
        String nome = 'A conta ' + i;
        Account con = new Account();
        con.Name = nome;
        conta.add(con);
    }
    
    insert conta;
    system.debug(conta);
	}


}