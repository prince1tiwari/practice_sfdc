public class mySOSL {

    public string search{get;set;}

    public list<account> allAccs{get;set;}

    String[] sfdcObjects = new String[]{};

    public string selVal{get;set;}

    public PageReference dispValue(){

        

        system.debug('sfdcObjects--->'+sfdcObjects);        

        system.debug('sfdcObjects.size()--->'+sfdcObjects.size());

        /*for(string sfdcObjects){

            selVal=st+',';

        }*/

        

        for(integer i=0;i<=sfdcObjects.size()-1;i++)

        {

            system.debug('i--->'+i);

            selVal+=sfdcObjects[i]+',';

            system.debug('selVal--->'+selVal);

        }

        

        selVal=selVal.left(selVal.length()-1);

        

        return null;

    }

    public List<SelectOption> getItems() {

        List<SelectOption> options = new List<SelectOption>();

        options.add(new SelectOption('Lead','LEAD'));

        options.add(new SelectOption('Account (Id, Name, AccountNumber, OwnerId)','ACCOUNT'));

        options.add(new SelectOption('Contact(Id, Lastname)','CONTACT'));

        options.add(new SelectOption('Opportunity','OPPORTUNITY'));

        system.debug('options--->'+options);

        return options;

    }

    public String[] getsfdcObjects() {

        return sfdcObjects;

    }

    public void setsfdcObjects(String[] sfdcObjects) {

        this.sfdcObjects = sfdcObjects;

    }

    public pagereference DoSearch(){

    

        //dispValue();

        

        List<List<SObject>> searchList = [FIND :search+'*' IN ALL FIELDS RETURNING Account (Id, Name, AccountNumber, OwnerId), Contact(Id, Lastname), Opportunity, Lead];

        

        system.debug('selVal--->'+selVal);

        Account [] accounts = (List<Account>)searchList[0];

        Contact [] contacts = (List<Contact>)searchList[1];

        Opportunity [] opportunities = (List<Opportunity>)searchList[2];

        Lead [] leads = (List<Lead>)searchList[3];

            

        allAccs= accounts;   

            

        system.debug('acc:accounts--->'+accounts.size());

        system.debug('contacts--->'+contacts.size());

        string accNames='';    

        for(Account acc:accounts) 

        {

            accNames+=acc.name+',';

            //accNames=accNames+acc.name+',';

        }   

          

        system.debug('accNames--->'+accNames);

        

        

        string conNames='';    

        for(contact con:contacts) 

        {

            conNames+=con.Lastname+',';

        }   

          

        system.debug('conNames--->'+conNames);   

        

        /*string oppNames='';    

        for(opportunity opp:opportunities) 

        {

            oppNames+=opp.name+',';

        }   

          

        system.debug('oppNames--->'+oppNames);        


        string leadNames='';    

        for(lead ld:leads) 

        {

            leadNames+=ld.name+',';

        }   

          

        system.debug('leadNames--->'+leadNames); 

        */  

        return null;      

    }

    public mySOSL(){

        search='';   

        selVal='';

    }

}