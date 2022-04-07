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
}