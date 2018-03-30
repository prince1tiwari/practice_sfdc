public class TrainingController {

   public PageReference step1() {
      //return Page.opptyStep1;
      return Page.NavigatingSalesForce;
   }

  public PageReference step2() {
      //return Page.opptyStep2;
    return Page.SalesCloud;
  }

  public PageReference step3() {
      //return Page.opptyStep3;
   return Page.Reportdashboard;
  }
  public PageReference step4() {
      //return Page.opptyStep3;
   return Page.SyncOutlook;
   }

   // This method cancels the wizard, and returns the user to the  
    
   // Opportunities tab 
    
   // This method performs the final save for all four objects, and 
    
   // then navigates the user to the detail page for the new 
    
   // opportunity. 
    
  // public PageReference save() {

      // Create the account. Before inserting, copy the contact's 
    
      // phone number into the account phone number field. 
    
    //  account.phone = contact.phone;
     // insert account;

      // Create the contact. Before inserting, use the id field 
    
      // that's created once the account is inserted to create 
    
      // the relationship between the contact and the account. 
    
     // contact.accountId = account.id;
     // insert contact;

      // Create the opportunity. Before inserting, create  
    
      // another relationship with the account. 
    
     // opportunity.accountId = account.id;
     // insert opportunity;

      // Create the junction contact role between the opportunity 
    
      // and the contact. 
    
     // role.opportunityId = opportunity.id;
     // role.contactId = contact.id;
     // insert role;

      // Finally, send the user to the detail page for  
    
      // the new opportunity. 
    


     // PageReference opptyPage = new ApexPages.StandardController(opportunity).view();
     // opptyPage.setRedirect(true);

     // return opptyPage;
   //}

}