public with sharing class wrapperClassController2 {

    private list<contact> lstCon;

    public wrapperClassController2(){

        string selectedConIDs = ApexPages.CurrentPage().GetParameters().get('conIds');

        system.debug('selectedConIDs--->'+selectedConIDs);

list<string> strs=selectedConIDs.split(',');

        system.debug('strs--->'+strs);

        

        set<string> setStr=new set<string>();

        

        if(!strs.IsEmpty() && strs.size()>0){

            for(string st:strs){

                setStr.add(st);

            }

        }

        system.debug('setStr--->'+setStr);

        

        //write a SOQL query to run through the selected contact ids

        lstCon=[Select id, lastname, description, email from contact where id in :setStr];

        system.debug('lstCon--->'+lstCon);

    }

    

    public list<contact> getAllCons(){

        return lstCon;

    }

}