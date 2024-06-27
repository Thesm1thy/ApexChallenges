public class asynchDeleteStaleAcc implements Database.batchable<sObject>, Database.Stateful{
    public Database.QueryLocator start(Database.BatchableContext bc) {
        String query = 'SELECT Id FROM Account WHERE Id NOT IN (SELECT AccountId FROM Opportunity WHERE CloseDate >= LAST_N_MONTHS:6 AND IsClosed = FALSE)';
        return Database.getQueryLocator(query);
    }
    
    public void execute(Database.BatchableContext bc, List<SObject> accs) {
        List<Account> accToDelete = (List<Account>)accs;
        try {
            delete accToDelete;
        } catch (DmlException e) {
            
        }
    }
    
    public void finish(Database.BatchableContext bc) {
    }
    

}
