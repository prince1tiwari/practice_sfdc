global class AccountSoapService{


global class accountcontactsite{

webservice list<Contact> contactdata {get ; set;}

webservice list<Site__c> sitedata {get; set;}

}

webservice static accountcontactsite getaccountcontactsite(String accountid){

accountcontactsite acctapp = new accountcontactsite();

acctapp.contactdata = [Select LastName, Id, FirstName, Email From Contact where Accountid = :accountid];

acctapp.sitedata = [Select Id, Name,  Phone__c, Office__c, City__c From Site__c s where Parent_account__c = :accountid];

return acctapp;
}
}