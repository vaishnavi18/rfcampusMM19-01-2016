package com.iitms.rfcampuscommon;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

/**
 * ]
 * @author Sachinmt
 *
 */
@Repository
public class StudentDaoImpl implements StudentDao {

    
    @Override
    public List<Student> retrieveAllRegisteredUsers() {
        ArrayList<Student> studentList = new ArrayList<Student>();
        
        studentList.add(new Student("S001", "Abhijeet", "MCA", "B"));
        studentList.add(new Student("S002", "Mukesh", "PGDCA", "A"));
        studentList.add(new Student("S003", "Roop Singh Rathor", "BCA", "B"));
        studentList.add(new Student("S004", "Kishor Kumar", "MCA", "A"));
        studentList.add(new Student("S005", "Moh. Rafi", "MBA", "B"));
        studentList.add(new Student("S006", "Rakhi Sawant", "DCA", "C"));
        studentList.add(new Student("S007", "Kvita Krishnamurthy", "BCA", "B"));
        studentList.add(new Student("S008", "Kumar Sanu", "MCA", "B"));
        studentList.add(new Student("S009", "Sonu Nigam", "PGDCA", "A"));
        studentList.add(new Student("S0010", "Sunidhi Chauhan", "BBA", "B"));
        
        
        return studentList;
    }

}
