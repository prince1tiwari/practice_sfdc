public class DynamicObjectSearchController {

   

    public List<SelectOption> objects {get; set;}

    public List<SelectOption> fields {get; set;}

    public String selObject {get; set;}

    public String selField {get; set;}

    public String fieldValue {get; set;}

    public String recordIdValue {get; set;}

    

    public DynamicObjectSearchController() {

        objects = new List<SelectOption>();

        objects.add(new SelectOption('account', 'account'));

        objects.add(new SelectOption('contact', 'contact'));

    }

    

    public void putSelField() {

        // do not do any thing here....

        System.Debug('SelField value:: ' + selField);

    }

    

    public void fetchFields() {

        Map<String, Schema.SObjectField> fMap =

            Schema.getGlobalDescribe().get(selObject.toLowerCase()).getDescribe().Fields.getMap();

        fields = new List<SelectOption>();

        for(String fieldName : fMap.keySet()) {

            fields.add(new SelectOption(fieldName, fieldName));

        }

    }

    

    public void getRecord() {

        System.debug('SELFIELD __________________ '+selField);

        String sql = 'select id from ' +  selObject + ' where ' + selField + ' = \'' + fieldValue + '\'';

        System.debug('SQL __________________ '+sql);

        SObject sobj = Database.Query(sql);

        recordIdValue = sobj.id;

    }

}