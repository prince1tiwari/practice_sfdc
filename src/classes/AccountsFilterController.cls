public class AccountsFilterController {

    public Map<String,List<Account>> acctAlphaMap{get;set;}

    public String selectedAlpha { set; get{

            system.debug('getSelectedAlpha called');

            return selectedAlpha;

        }}

    public AccountsFilterController(){

        acctAlphaMap = new Map<String, List<Account>>();

        

        List<Account> allAccts = [Select Id,Name,BillingStreet,BillingCity,BillingPostalCode from Account];

        system.debug('allAccts--->'+allAccts);

        acctAlphaMap.put('All',allAccts);

        system.debug('acctAlphaMap--->'+acctAlphaMap);

        

        integer i=0;

        for(Account acct: allAccts){

            string firstAlpha = acct.name.substring(0,1).toUpperCase();

            system.debug('firstAlpha--->'+firstAlpha+', acct--->'+acct);

            List<Account> tmpAccts = acctAlphaMap.get(firstAlpha);

            system.debug('Record:'+(i+1)+', tmpAccts--->'+tmpAccts);

            i++;

            if(tmpAccts==null){

                tmpAccts = new List<Account>();

                acctAlphaMap.put(firstAlpha, tmpAccts);

                system.debug('acctAlphaMap--->'+acctAlphaMap.get(firstAlpha));

            }

            tmpAccts.add(acct);

        }

        system.debug(acctAlphaMap.keyset());

    }

    

    public Map<String,List<Account>> getAccts(){

        system.debug('getAccts called');

        return acctAlphaMap;

    }

    public List<SelectOption> getAlphaOptions(){

        List<SelectOption> options = new List<SelectOption>();

        List<String> alphas = new List<String>(acctAlphaMap.keyset());

        alphas.sort();

        options.add(new SelectOption('',''));

        for(String alpha: alphas){

            options.add(new SelectOption(alpha,alpha));            

        }

        system.debug('getAlphaOptions called');

        return options;

    }

}