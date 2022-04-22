@isTest
private class StudentEligibilityPerProviderTest {
    @isTest
    private static void test_initData() {
        //in memory student data creation
        Student__c student1 = new Student__c();
        student1.Id = fflib_IDGenerator.generate(Student__c.SObjectType);
        Student__c student2 = new Student__c();
        student2.Id = fflib_IDGenerator.generate(Student__c.SObjectType);
      
        Set<Id> studentsIdSet = new Set<id>();

        Map<Id,Decimal> studentsEligibilityPerMap = new Map<Id,Decimal> studentsEligibilityPerMap();
        studentsEligibilityPerMap.put(student1.Id, 100);
        studentsEligibilityPerMap.put(student2.Id, 0);
      
        //mocker
        fflib_ApexMocks mocks = new fflib_ApexMocks();
        StudentDAO mockStudentDao = (StudentDAO) mocks.mock(StudentDAO.class);
        mocks.startStubbing();
        mocks.when(mockStudentDao.getStudentsEligibilityMap(studentsIdSet)).thenReturn(studentsEligibilityPerMap);
        mocks.stopStubbing();

        Test.startTest();
        //call class under test
        StudentEligibilityPerProvider stdEligibilityPerProvider = new StudentEligibilityPerProvider(mockStudentDao);
        stdEligibilityPerProvider.initData(studentsIdSet);
         //assert
         System.assert(stdEligibilityPerProvider.studentsEligibilityPerMap != null &&
         !stdEligibilityPerProvider.studentsEligibilityPerMap.isEmpty(), 'stdEligibilityPerProvider is not populated' );
        Test.stopTest();
        // Then verify getStudentsEligibilityMap get called only once
        ((StudentDAO) mocks.verify(mockStudentDao, 1)).getStudentsEligibilityMap(studentsIdSett);

    }

    @isTest
    private static void test_getEligibilityPercentage() {
      //TBD

    }

  
}