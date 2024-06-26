trigger createRelatedContact on Account (after insert) {

  if (Trigger.isAfter && Trigger.isInsert) {
      List<Contact> newRelatedContacts = new List<Contact>();

    for (Account acc : Trigger.new){
        Contact newCon = new Contact (
            FirstName = 'John',
            LastName = 'Smith',
            AccountID = acc.Id
        );
        newRelatedContacts.add(newCon);
    }

    // Insert contacts

    if(!newRelatedContacts.isEmpty()){
        insert newRelatedContacts;
    }

  }

}
