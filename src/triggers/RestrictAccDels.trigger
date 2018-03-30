trigger RestrictAccDels on Account (before delete, before update, before insert) {
    if (Trigger.isDelete && Trigger.isBefore) {
    //In a before delete trigger, the trigger accesses the records that will be deleted with the Trigger.old list.
        for (Account a : Trigger.old) {
            if (a.name != 'okToDelete') {
                system.debug('Record: '+a.name+' failed to delete');
                a.addError('You can\'t delete this record!');
                continue;
            }
            system.debug('Successfully Deleted Record: '+a.name);
        }
    }
    if (Trigger.isInsert) {
        List<Contact> contacts = new List<Contact>();
        for (Account a : Trigger.new)  {
            if(a.name == 'makeContact')  {
                system.debug('Creating a contact recored for the account '+a.name);
                contacts.add(new Contact (lastname = a.name, accountId = a.id));        
                //contacts.add(new Contact (lastname = a.name));        
            }
        }
        insert contacts;
        system.debug('contacts--->'+contacts);
    }
    

    if (Trigger.isInsert || Trigger.isUpdate) {
        for (Account a : Trigger.new)  {
            User use = [Select Id,Username, fabcolor__c from user where id = :a.OwnerId];
            a.favcolor__c = use.fabcolor__c;
            system.debug('Color--->'+ use.fabcolor__c);
            continue;
            }
           
}
    
}