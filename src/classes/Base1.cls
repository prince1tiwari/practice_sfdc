public with sharing class Base1 {

    public Account account { get; set; }

    public List<SelectOption> AllContactsForAccount { get; set; }
    

    public Id accountID {get; set;}

    public Integer phone {get; set;}

    public Base1() {

        accountID = ApexPages.CurrentPage().getParameters().get('id');

        account = [SELECT Id, Name from Account where Id=:accountID];

        phone = 12345;

    }     
    



}