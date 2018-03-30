public with sharing class AccountController {
    private Id accountId = null;
    private Account AccountObj = null;
    public AccountController() {
        accountId = ApexPages.currentPage().getParameters().get('id');
        accountObj = (accountId == null) ? new Account() : [SELECT name, accountnumber, industry, billingstreet FROM account WHERE Id = :accountId];
    }
     public Account getAccountObj() {
        if (accountObj != null) {
            return accountObj;
        }
        return null;
    } 
    public PageReference save() {
        try {
            upsert(accountObj);
        } 
        catch(System.DMLException e) {
            ApexPages.addMessages(e);
            return null;
        }
        PageReference page = new PageReference('/apex/ContactViewPage?Id=' + accountId);
        page.setRedirect(true);
        return page; 
    }
    public PageReference cancel() {
        PageReference page = new PageReference('/apex/AccountViewPage?id=' + accountId);
        page.setRedirect(true);
        return page; 
    }
}