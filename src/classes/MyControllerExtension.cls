public class MyControllerExtension {

private final Account acct;

Public MyControllerExtension(ApexPages.StandardController abc) {

this.acct = (Account)abc.getRecord();

}

public String getGreeting() {

return 'Hello ' + acct.name + ' (' + acct.id+ ')';

}}