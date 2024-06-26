trigger preventAccDelete on Account (before delete) {
    // Set to hold acc Ids
    Set<Id> accountIds = new Set<Id>();

    for (Account acc : Trigger.old){
        accountIds.add(acc.Id);
    }

    //query for related contacts
    List<Contact> associatedContact = [SELECT Id, AccountId FROM Contact WHERE AccountId IN :accountIds];

    //accounts with associated contacts
    Set<Id> accountsWithContacts = new Set<Id>();

    for(Contact con :associatedContact){
        accountsWithContacts.add(con.AccountId);
    }

    //Throw error to prevent deletion
    for(Account acc : Trigger.old){
        if(accountsWithContacts.contains(acc.Id)){
            acc.addError('Cannot delete account because it has an associated contact.');
        }
    }


}
