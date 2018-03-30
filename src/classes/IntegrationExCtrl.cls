public class IntegrationExCtrl {

    String strSOQL ='';

        

    public IntegrationExCtrl() {

        allStockQuotes = new List<Stock__c>();

    }    

    

    public PageReference processData() {

        stockSymbolProcessVal = parse(stockSymbolRetVal);

        string strFinalStockData=strSOQL+'Last_accessed__c='+system.now();

        system.debug('strFinalStockData--->'+strFinalStockData);

        string[] strArrFinalStockData=strFinalStockData.split(',');

        system.debug('strArrFinalStockData--->'+strArrFinalStockData);

        stock__c st=new stock__c();

        for(integer cnt=0;cnt<=strArrFinalStockData.size()-1;cnt++){

            string[] strArrFinalStockData1=strArrFinalStockData[cnt].split('=');

            //for(integer cnt1=0;cnt1<=strArrFinalStockData1.length()-1;cnt1++){

                system.debug('strArrFinalStockData1--->'+strArrFinalStockData1);

                if(strArrFinalStockData1[0]=='Symbol__c')

                    st.Symbol__c=strArrFinalStockData1[1];

                if(strArrFinalStockData1[0]=='Last__c')

                    st.Last__c =strArrFinalStockData1[1];

                if(strArrFinalStockData1[0]=='Date__c')

                    st.Date__c =strArrFinalStockData1[1];

                if(strArrFinalStockData1[0]=='Time__c')

                    st.Time__c =strArrFinalStockData1[1];

                if(strArrFinalStockData1[0]=='Change__c')

                    st.Change__c =strArrFinalStockData1[1];

                if(strArrFinalStockData1[0]=='Open__c')

                    st.Open__c =strArrFinalStockData1[1];

                if(strArrFinalStockData1[0]=='High__c')

                    st.High__c =strArrFinalStockData1[1];

                if(strArrFinalStockData1[0]=='Low__c')

                    st.Low__c =strArrFinalStockData1[1];

                if(strArrFinalStockData1[0]=='Volume__c')

                    st.Volume__c =strArrFinalStockData1[1];

                if(strArrFinalStockData1[0]=='MktCap__c')

                    st.MktCap__c =strArrFinalStockData1[1];

                if(strArrFinalStockData1[0]=='PreviousClose__c')

                    st.PreviousClose__c =strArrFinalStockData1[1];

                if(strArrFinalStockData1[0]=='PercentageChange__c')

                    st.PercentageChange__c =strArrFinalStockData1[1];                                                                                                                                                                                                                            

                if(strArrFinalStockData1[0]=='AnnRange__c')

                    st.AnnRange__c =strArrFinalStockData1[1];

                if(strArrFinalStockData1[0]=='Earns__c')

                    st.Earns__c =strArrFinalStockData1[1];

                if(strArrFinalStockData1[0]=='P-E__c')

                    st.P_E__c =strArrFinalStockData1[1];

                if(strArrFinalStockData1[0]=='Name__c')

                    st.Name =strArrFinalStockData1[1];

                if(strArrFinalStockData1[0]=='Last_accessed__c')

                    st.Last_accessed__c = datetime.valueof(strArrFinalStockData1[1]);

            //}

        }

        system.debug('st--->'+st);

        allStockQuotes.add(st);

        upsert allStockQuotes;

        

        return null;

    }

    

    private String parse(String toParse) {

      DOM.Document doc = new DOM.Document();      

      try {

        doc.load(toParse);    

        DOM.XMLNode root = doc.getRootElement();

        //return walkThrough(root);

        string strTestSOQL = walkThrough(root);

        system.debug('strTestSOQL--->'+strTestSOQL);

        return strTestSOQL;

      } catch (System.XMLException e) {  // invalid XML

        return e.getMessage();

      }

    }

    private String walkThrough(DOM.XMLNode node) {

      String result = '\n';

      if (node.getNodeType() == DOM.XMLNodeType.COMMENT) {

        return 'Comment (' +  node.getText() + ')';

      }

      if (node.getNodeType() == DOM.XMLNodeType.TEXT) {

        return 'Text (' + node.getText() + ')';

      }

      if (node.getNodeType() == DOM.XMLNodeType.ELEMENT) {

        result += 'Element: ' + node.getName();

        if (node.getText().trim() != '') {

          result += ', text=' + node.getText().trim();

         

        }

        if (node.getAttributeCount() > 0) { 

          for (Integer i = 0; i< node.getAttributeCount(); i++ ) {

            result += ', attribute #' + i + ':' + node.getAttributeKeyAt(i) + '=' + node.getAttributeValue(node.getAttributeKeyAt(i), node.getAttributeKeyNsAt(i));

          }  

        }

                

        for (Dom.XMLNode child: node.getChildElements()) {

          result += walkThrough(child);

            //system.debug('Node Name--->'+child.getName()+', Node Text--->'+child.getText().trim()); 

            if(child.getName()!='Stock')

                strSOQL += child.getName()+'__c='+child.getText().trim()+',';    

        }

        //strSOQL = strSOQL+'Last_accessed__c='+system.now();

        system.debug('strSOQL====>'+strSOQL);      

        return result;

      }

      return '';  //should never reach here 

    }

    public PageReference fetchData() {

    

        wwwWebservicexNet.StockQuoteSoap proxyClass = new wwwWebservicexNet.StockQuoteSoap();

        proxyClass.timeout_x = 20000 ; // timeout in milliseconds

        stockSymbolRetVal  = proxyClass.GetQuote(stockSymbol);

        System.debug(stockSymbolRetVal);

        return null;

    }

    public String stockSymbol {get; set;}

    public String stockSymbolRetVal {get; set;}

    public String stockSymbolProcessVal {get; set;}

    public List<Stock__c> allStockQuotes {get; set;}

    public Integer allStockQuotesCnt {get{return allStockQuotes.size();}}
}