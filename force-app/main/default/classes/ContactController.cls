public class ContactController{
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts() {
        return [
            SELECT FirstName , LastName, Email
            FROM Contact
            WITH SECURITY_ENFORCED
        ];
    }
    
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {
        return [
            SELECT Name
            FROM Account
            WITH SECURITY_ENFORCED
        ];
    }
    
    public List<Contact> contactList {get;set;}
    public ContactController(){
        this.contactList = new List<Contact>();
    }
    @AuraEnabled(cacheable=true)
    public static list<Contact> getContactList(string searchKey){
        List<Contact> lst = new List<Contact>([SELECT Id, Name, Title, Phone, Email FROM Contact WHERE Accountid = :searchKey ]);
        return lst;
    }
}