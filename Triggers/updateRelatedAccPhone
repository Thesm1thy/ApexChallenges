trigger updateAssociatedAccountPhone on contact (after update) {


   if (Trigger.isAfter && Trigger.isUpdate) {

     //Map to hold account ids
    Map<Id, String> accUpdatedPhones = new Map<Id,String>();

    for (Contact con : Trigger.new){
        // Check if the number has been changed
        if (con.Phone != Trigger.oldMap.get(con.Id).Phone) {
            accUpdatedPhones.put(con.AccountId, con.Phone);
        }
    }

    List<Account> accToUpdate = new List<Account>();

    //query to find the accounts that need to be updated
    for(Account acc : [SELECT Id, Phone FROM Account WHERE Id IN :accUpdatedPhones.keySet()]){
        acc.Phone = accUpdatedPhones.get(a.Id);
        accToUpdate.add(a);
    }

    if(!accToUpdate.isEmpty()){
        update accToUpdate;
    }
  }


}
