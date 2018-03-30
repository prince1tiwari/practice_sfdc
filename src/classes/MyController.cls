public class MyController {
private final Account acc;
public MyController() {
    Id aid = ApexPages.currentPage().getParameters().get('id');
acc = [select id, name, site from Account where id =  :aid
];
}
public Account getAcc() {
    return acc;
}
public PageReference save() {
update acc;
return null;
}
}