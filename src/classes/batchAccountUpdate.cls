global class batchAccountUpdate implements Database.Batchable<sObject> {

    global Database.QueryLocator start(Database.BatchableContext BC) {

        String query = 'SELECT Id,Name FROM Account';

        return Database.getQueryLocator(query);

    }

   

    global void execute(Database.BatchableContext BC, List<Account> scope) {

         for(Account a : scope)

         {

             a.Name = a.Name + 'Test2';            

         }

         update scope;

    }   

    

 global void finish(Database.BatchableContext BC){
   // Get the ID of the AsyncApexJob representing this batch job

   // from Database.BatchableContext.

   // Query the AsyncApexJob object to retrieve the current job's information.
   AsyncApexJob a = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed,
      TotalJobItems, CreatedBy.Email
      FROM AsyncApexJob WHERE Id =
      :BC.getJobId()];
   // Send an email to the Apex job's submitter notifying of job completion.
   Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
   String[] toAddresses = new String[] {a.CreatedBy.Email};
   mail.setToAddresses(toAddresses);
   mail.setSubject('Apex Sharing Recalculation ' + a.Status);
   mail.setPlainTextBody
   ('The batch Apex job processed ' + a.TotalJobItems +
   ' batches with '+ a.NumberOfErrors + ' failures.');
   Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
}
}