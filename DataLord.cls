public class DataLord {
    
    public DataLord() {
        
    }
    //SOQL Challenges
    //challenge 1
    public Integer NumAccounts() {
        return [select count() from account];
        
        
    }
    
    
     //challenge 2
    public Integer NumHot() {
        return [select count() from account where Rating = 'Hot'];
        
    }
    
    //challenge 3
    public Integer NumComplex() {
        return [select count() from account where Name like '%&%'];
        
    }
    
    //challenge 4
    public List<Account> BigFive() {
        return [SELECT Name, AnnualRevenue FROM Account ORDER BY AnnualRevenue DESC limit 5 offset 8];
        
    }
    
    //challenge 5
    public List<Opportunity> LastBigOpportunity() {
        return [SELECT Name FROM Opportunity where Amount > 100000 and CloseDate > n_months_ago: 2 and closeDate < today];
    }
    
    
    //challenge 6
    public List<Account> MajorPlayers() {
        return [SELECT Account.Name, (SELECT Contact.Name FROM Account.Contacts) FROM Account WHERE Rating = 'Hot'];
    }
    
    
    //challenge 7
    public List<Account> MostPopularAccount() {
        List<Account> relatedCons = [SELECT Account.Name, (SELECT Contact.Name FROM Account.Contacts) FROM Account];
        
        List<Account> mostPopularAccount = null;
        Integer maxContactCount = 0;

        // Loop through each Account and count the Contacts
        for (Account acc : relatedCons) {
            Integer contactCount = acc.Contacts.size();
            if (contactCount > maxContactCount) {
                maxContactCount = contactCount;
                mostPopularAccount.add(acc);
            }
        }
        return mostPopularAccount;
    }
    
    
    
    
    
    //SOSL Challenges
    //challenge 1
    public List<List<SObject>> ConsandLeads() {
        return [find 'tom' returning Contact(Name), Lead(Name)];
    }
    
    
    //Challenge 2
    public List<List<SObject>> getAccounts() {
        return [find 'a* or o*' in all fields returning Account(Name)];
    }
    
    
    
    //DML Challenges
    //challenge 1
    
    
    
    
}
