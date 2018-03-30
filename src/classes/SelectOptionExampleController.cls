public with sharing class SelectOptionExampleController {

    public PageReference loadBrandProducts() {

        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.INFO, 'You have selected: <b>'+strCountry+'</b>');             

        ApexPages.addMessage(  myMsg);    

        return null;

    }


  

    private String strCountry; 

    

    public List<SelectOption> getItems() {

        List<SelectOption> options = new List<SelectOption>();

        options.add(new SelectOption(   'None'  ,   '---Select Country---'  ));     

        options.add(new SelectOption(   'Afghanistan'   ,   'Afghanistan'   ));

        options.add(new SelectOption(   'Zambia'    ,   'Zambia'    ));

        options.add(new SelectOption(   'Zimbabwe'  ,   'Zimbabwe'  ));

        

        /*SelectOption so=new SelectOption(   '1Zimbabwe1'  ,   '1Zimbabwe1'  );

        so.selected='selected';

        options.add(so);

        */

        return options;

    }

    

    public String getCountries() {

        return strCountry;

    }

    public void setCountries(String ps_country) {

        this.strCountry = ps_country;

    }

}