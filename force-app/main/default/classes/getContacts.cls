public class getContacts {
    /*testing*/
    @AuraEnabled
    public static List<Contact> getcontact(){
        return [Select id,name from Contact];
    }
}