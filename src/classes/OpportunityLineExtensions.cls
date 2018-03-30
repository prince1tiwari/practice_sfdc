public class OpportunityLineExtensions {


  String oppPageId;
    string pagId;

        
    public list<Opportunity_Line_Item__c> oppLineItem{get;set;}
    public list<Opportunity_Line_Item__c> deleteOppLineList{get;set;} 
    
    public OpportunityLineExtensions(ApexPages.StandardController controller) {
pagId = ApexPages.currentPage().getURL();    //gets Url  of a current page from where the record is created
        system.debug('pagId=='+pagId);  
                    //checks URL is stored or not
        oppPageId  = pagId.substring(pagId.indexof('lkid=')+5,pagId.indexof('lkid=')+20);   //returns string given in substring and restores Opportunity Id
        system.debug('FromCon oppPageId ==='+oppPageId );
        
        this.oppLineItem= new list<Opportunity_Line_Item__c >();    //adds the list  of Opportunity Line Item custom object
        
        AddRow();   //AddRow() method below is called  in the constructor
    }

  public  PageReference AddRow(){    //method called while clicking Add Row custom button on Vf page
        
        oppLineItem.add(new Opportunity_Line_Item__c(Opportunity__c = oppPageId ));    //adds new row of fields on the current page of 'Opportunity Line Item'
        system.debug('oppPageId ==='+oppPageId );
        return null;    //page reference method need to have return value
    }
    
        public void removeOppLineItem(){
        Integer indexVal = Integer.valueof(system.currentpagereference().getparameters().get('index'));
        
        if(oppLineItem[indexVal - 1].Id != null)
        deleteOppLineList.add(oppLineItem[indexVal - 1]);
        //Remove the OppLineItem from the table    
        oppLineItem.remove(indexVal - 1);            
    }  
   
    public PageReference Save(){    //Save method used while clicking save Command Button
    
        if(!oppLineItem.isEmpty()){    //checks that Opportunity Line item is not empty
            insert oppLineItem;        //insert the list while saving to  the current page
            system.debug('*****oppLineItem ' + oppLineItem);          
        }
       return new PageReference('/' + oppPageId  );    //redirects the page to opportunity Id
    }

}