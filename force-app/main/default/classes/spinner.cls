public class spinner {
    @AuraEnabled(cacheable=true)
    public static List<Carro__c> buscaMarca(String marca){
        List<Carro__c> carrosLista = new List<Carro__c>([SELECT Name,AnoModelo__C, Modelo__C, CarroNovo__C  FROM Carro__c WHERE Name = :marca]);
        system.debug(carrosLista);
        system.debug(carrosLista.get(0).Name);
        if(carrosLista.size() > 0){
            return carrosLista;
        }else{
            return null;
        }
       
      
    }
}
