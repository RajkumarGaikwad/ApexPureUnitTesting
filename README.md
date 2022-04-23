# ApexPureUnitTesting

This example helps you to understand the basic usage of FFLIB mocker framework.

Suppose that we have StudentEligibility__c object, where we have stored each student's some eligibility %.

In order to fetch each student's eligibility % we have written StudentEligibilityPerProvider, which is bulkfied and can work as helper to main functionality.

StudentEligibilityPerProvider has a method, which fetches all in context student' eligibility % and cache it, so that we can get eligibility % of each student using getEligibilityPercentage method.

```
public with sharing class StudentEligibilityPerProvider {
    //composed StudentDAO object so that we can easily construct a Mock Object representing a composed class for the sake of testing
    private StudentDAO studentdao; // 
    ...
}

public void initData(Set<Id> studentsIdSet) {
    // because of mocked studentdao object we can easly mock the call to this method
    studentsEligibilityPerMap = studentDao.getStudentsEligibilityMap(studentsIdSet);
}
```

If we truly follow <a href="https://medium.com/bgl-tech/what-are-the-solid-design-principles-c61feff33685" target="_blank">SOLID priciniples</a> In object-oriented design, it makes testing systems easier.Composition offers better test-ability of a class than Inheritance. If one class consists of another class, we can easily construct a Mock Object representing a composed class for the sake of testing.

If we follow the unit test class StudentEligibilityPerProviderTest, we can easily understand that - all the test data we are creating is in memory data which helps faster execution of unit tests.

In order to write pure unit tests, I would highly recommend to go through the <a href="https://www.javatpoint.com/mockito" target="_blank"> basics of mockito</a> - a java-based mocker framework, which will help you to understand the <a href="https://github.com/apex-enterprise-patterns/fflib-apex-mocks" target="_blank"> fflib apex mocks library</a>



