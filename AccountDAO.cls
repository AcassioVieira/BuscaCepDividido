public with sharing class AccountDAO {
    
    public static Account getAccount(String accountId){
        return [SELECT Id
                        ,Name
                        ,AccountNumber
                        ,OwnerId
                        ,Site
                        ,AccountSource
                        ,AnnualRevenue
                        ,BillingAddress
                        ,CreatedById
                        ,DandbCompanyId
                        ,DunsNumber
                        ,Description
                        ,NumberOfEmployees
                        ,Type
                        ,Phone
                        ,(SELECT id, name FROM Contacts)
                FROM Account
                WHERE Id =: accountId ];
    }
    
}
