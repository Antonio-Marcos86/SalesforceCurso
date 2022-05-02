public with sharing class AccountHelper {
    public AccountHelper() {

    }

    public static void fillAccountDescription(List<Account> accountList){
        for (Account account : accountList){
            if(String.isBlank(account.Phone)){
                String message = ' - Register the account phone.';
                account.Description = String.isBlank(account.Description) ? message : account.Description + message;
            }
        }
    }

    public static void formatPhone(Account account){
        String areaCode = account.phone.substring(0,2);
        String firstpart = account.phone.substring(2,7);
        String secondPart = account.phone.substring(7);

        Account.phone =  String.format('({0}) {1}-{2}' , new List<Object>{areaCode, firstpart, secondPart});

    }

    public static void testaTelefone(List<Account> contaN){
        for(Account conta : contaN){
             if(conta.Phone == null){
                conta.addError('Por favor informar o telefone');
             }else if(conta.Phone.length() < 11){
                conta.addError('Por favor informar número de telefone correto');
             }else{
                 formatPhone(conta);
             }
        }
    }

     public static List<Contact> createContacts(List<Account> accountList){
         List<Contact> contactList = new List<Contact>();

         for (Account account : accountList){
             Contact contact = new Contact(
                 LastName = account.Name + ' Contact',
                  AccountId = account.Id
                  );
            contactList.add(contact);
            }
        return contactList;
     }

    public static void checkAccountTypeToBlock(List<Account> accountList){
        Set<String> typestoLock = new Set<String>{'Technology Partner'};
        for(Account account : accountList){
            if(typestoLock.contains(account.Type)){
                account.addError(account.Type + ' accounts canoot be deleted.');
            }

        }
    }

    public static void testaExecute(){
        String nome = 'Antonio Marcos ';
        system.debug(nome);
    }

    testaExecute();
}