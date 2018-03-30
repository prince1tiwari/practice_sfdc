public with sharing class Derived1 {

    public Integer age {get; set;}

    public Id acctId {get; set;}
    

    Base1 objbase;

    

    public Derived1(Base1 pbase) { 

        age = 15;

        this.objbase = pbase;

        acctId=pbase.accountID;

    }

    public PageReference callDerived() {

        age = age + 10;

        objbase.phone = 2222222; 

        objbase.AllContactsForAccount=getAllContactsDerived();

        system.debug('objbase.AllContactsForAccount--->'+objbase.AllContactsForAccount);

        return null;

    }

  

    public List<SelectOption> getAllContactsDerived() {

List<SelectOption> lstContacts= new List<SelectOption>();
lstContacts.add( new SelectOption('','-Select-'));
for( Contact con : [Select Id, LastName from Contact where accountId=:acctId] ) {
lstContacts.add( new SelectOption(con.Id,con.Lastname));
}
return lstContacts;
}

public PageReference showcontactviewpage() {
 PageReference page2 = new PageReference('/apex/ContactViewPage?Id=' + selectedCon);
       page2.setRedirect(true); 
        return page2;  }
   
  public String selectedCon { get; set; } 

}