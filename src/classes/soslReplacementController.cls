public class soslReplacementController {

    public string search{get;set;}

    public list<account> allSearchedAccs{get;set;}

    public list<contact> allSearchedCons{get;set;}

    public list<opportunity> allSearchedOpps{get;set;}

    public pagereference doSearch(){

        allSearchedAccs=[select id, name from account where name like :'%'+search+'%'];

        allSearchedCons=[select id, lastname from contact where lastname like :'%'+search+'%'];

        allSearchedOpps=[select id, name from opportunity where name like :'%'+search+'%'];

        return null;

    }

    public soslReplacementController(){

        allSearchedAccs=new list<account>();

        allSearchedCons=new list<contact>();

        allSearchedOpps=new list<opportunity>();

    }
}