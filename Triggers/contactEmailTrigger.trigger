trigger contactEmailTrigger on Contact (before insert, before update) {
    
    if (Trigger.isBefore && Trigger.isInsert || Trigger.isUpdate) {
      for (Contact con : Trigger.new) {
       
        if(String.isBlank(con.Email)){
            con.Email = 'MyEmail@jsmith.com';
        }
      }
    }
}
