@RestResource(urlMapping='/ReturnAccounts/*')
global class WebServiceClass {
    @HttpPost
    global static ResponseWrapper getAccount(){
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        ResponseWrapper rw = new ResponseWrapper();
        String jsonString = req.requestBody.tostring();
        List<Account> accList = [Select id,name from Account where CreatedDate = today ];
        List<Contact> conList = [Select id,name from Contact where CreatedDate = today ];
        if(accList.size()>0 ){
          // resw.accLst= accList;
           res.statusCode = 200; 
           res.responseBody = Blob.valueOf(JSON.serialize(accList));
           rw.accLst=accList;
           rw.conLst=conList;
           return rw;
        }
        else{
           res.statusCode =400;
           res.responseBody =Blob.valueOf('No value of account present');
           return rw;
        }
          
    }
}