class IIITH_Student:
    __name=""
    __rollNo=""
    __category=""

    def __init__(self,name,rollNo,category):
        self.__name = name
        self.__rollNo = rollNo
        self.__category =category

    def setName(self,name):
        self.__name=name

    def getName(self):
        return self.__name

    def setrollNo(self,rollNo):
        self.__rollNo=rollNo

    def getrollNo(self):
        return self.__rollNo

    def setCategory(self,category):
        self.__category=category

    def getCategory(self):
        return self.__category

    def printDetails(self):
        print("The student Details are as follows:")
        print("The name of the studnet is: " + self.getName())
        print("The rollNo of the student is: " + self.getrollNo())
        print("The studenet pursues " + self.getCategory()+ " at IIITH")

class TA(IIITH_Student):

    __subject=""
    def __init__(self,name,rollNo,category,subject):
        IIITH_Student.__init__(self,name,rollNo,category)
        self.__subject=subject

    def setSubject(self,subject):
        self.__subject=subject

    def getSubject(self):
        return self.__subject
    def printDetails(self):
        IIITH_Student.printDetails(self)
        print(IIITH_Student.getName(self)+" is TA of " + self.getSubject())

class Normal_Student(IIITH_Student):
    def __init__(self,name,rollNo,category):
        IIITH_Student.__init__(self,name,rollNo,category)

    def printDetails(self):
        IIITH_Student.printDetails(self)

s1=TA("Ashutosh","2020201001","Mtech","SSD")
s1.printDetails()
print("")

s2=TA("Arvind","2020201002","MTech","SSD")
s2.printDetails()
print("")

s3=Normal_Student("Husen","2021201077","Mtech")
s3.printDetails()
