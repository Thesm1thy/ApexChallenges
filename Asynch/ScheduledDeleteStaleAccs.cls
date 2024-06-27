global class ScheduledDeleteStaleAccs implements Schedulable {
    
    global void execute(SchedulableContext sc) {
        Database.executeBatch(new asynchDeleteStaleAcc());
    }
}
