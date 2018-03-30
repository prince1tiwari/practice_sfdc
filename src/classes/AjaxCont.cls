public class AjaxCont {
public String getFindcontactList() {
return null;
}


public String nameAccount { get; set; }

public String nameContact { get; set; }

public list<Contact> contacts { get; set; }

public void findcontactList() {
if( selectedAcc != null && selectedAcc.length() > 0 ) {
contacts = [select Id,Name,accountid from Contact where accountId =:selectedAcc];
//nameContact = con.Name;
//nameAccount = con.Account.Name;
}

}

public List<SelectOption> getAccounts() {
List<SelectOption> accOptions = new List<SelectOption>();
accOptions.add( new SelectOption('','-Select-'));
for( Account acc : [select Id,name from Account ] ) {
accOptions.add( new SelectOption(acc.Id,acc.name));
}
return accOptions;
}



public String selectedAcc { get; set; }
}