public class wrapperClassController {

   public List<cContact> contactList {get; set;}

      class cContact {

         public Contact con {get; set;}

         public Boolean selected {get; set;}

  

         

         public cContact(Contact c) {

             con = c;

             selected = false;

         }

     }

      

       

      

      public List<cContact> getContacts() {

          if(contactList == null) {

              contactList = new List<cContact>();

              for(Contact c : [select Id, Name, Email, Phone,description from Contact limit 10]) {

                  

                  contactList.add(new cContact(c));

              }

          }

          return contactList;

      }

   

   

      public PageReference processSelected() {

        

           List<cContact> selectedContacts = new List<cContact>();

          List<Contact> conDets=new list<contact>();

          for(cContact cCon : getContacts()) {

              if(cCon.selected == true) {

                  selectedContacts.add(cCon);

                  conDets.add(cCon.con);

              }

              system.debug('these are the selected contacts......');

              system.debug(selectedcontacts);

          }

          update conDets;

          

          string selectedContactIds='';

          if(!selectedcontacts.IsEmpty() && selectedcontacts.size()>=1){

              for(cContact con:selectedcontacts){

                  selectedContactIds+=con.con.Id+',';

              }

          }

          system.debug('selectedContactIds--->'+selectedContactIds);

          selectedContactIds=selectedContactIds.substring(0,(selectedContactIds.length()-1));

          system.debug('selectedContactIds--->'+selectedContactIds);

          

          //return null;

           

          PageReference pageRef= new PageReference('/apex/selectedcontacts?conIds='+selectedContactIds);

          pageRef.setRedirect(true);        

          return pageRef;

      }

      

  }