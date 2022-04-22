/******************************************************************************
ClassName  :   StudentDAO 
@description DAO class created to fetech required data for Student Eligible calculations
**********************************************************************************/
public without sharing class StudentDAO {
    
   
    /**
    * @description Method to fetch student eligibility% from DB
    * @param studentsIdSet :  in context student roll id set
    * @return  Map<Id,Decimal> student vs eligibility % map
    */ 
    public  Map<Id,Decimal> getStudentsEligibilityMap(Set<Id> studentsIdSet){
       Map<Id,Decimal> studentsEligibilityPerMap;
        for (StudentEligibility__C stdEl : [SELECT Id, Eligibility__c
                                                        FROM StudentEligibility__C
                                                        WHERE student__c IN : studentsIdSet]){
          //prepare map
        }
        
        return studentsEligibilityPerMap;
    }
    

}