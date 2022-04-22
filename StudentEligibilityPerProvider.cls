/******************************************************************************
ClassName  :   StudentEligibilityPerProvider 

**********************************************************************************/
public with sharing class StudentEligibilityPerProvider {

    private StudentDAO studentdao;

    private Map<Id,Decimal> studentsEligibilityPerMap;

    public StudentEligibilityPerProvider(){
        this(new StudentDAO());
    }

    @testVisible
    private StudentEligibilityPerProvider(StudentDAO studentDao) {
        this.studentDao = studentDao;
    }

    /**
    * @description init student data required to get eligibility %
    * @param studentsIdSet :  in context student roll id set
    */
    public void init() {
        studentsEligibilityPerMap = studentDao.getStudentsEligibilityMap(Set<Id> studentsIdSet);
    }

    /**
    * @description get student eligibility %
    * @param Student : Student Record
    * @return decimal : eligibility %
    */
    public decimal getEligibilityPercentage(Student std) {
        if (studentsEligibilityPerMap.containsKey(std.rollId)) {
           return studentsEligibilityPerMap.get(std.rollId);
        }
        return 0;
    }
}