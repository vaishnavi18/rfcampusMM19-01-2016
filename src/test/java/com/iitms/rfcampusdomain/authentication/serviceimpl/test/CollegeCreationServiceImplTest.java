package com.iitms.rfcampusdomain.authentication.serviceimpl.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.iitms.rfcampusdomain.authentication.service.CollegeCreationService;

import junit.framework.TestCase;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:**/testContext.xml" })
public class CollegeCreationServiceImplTest extends TestCase {
    
  @Autowired
    CollegeCreationService collegeCreationService;
    //CollegeMasterEntity collegeMasterEntity;   
   
    
    @Test
    public void testGetCollegeList() {
        System.out.println("testGetCollegeList >>> ..");
       /* List<CollegeMasterEntity> list = collegeCreationService.getCollegeList();
        boolean b = list.isEmpty();
        assertEquals(false,b);*/
    }

   /* @Test
    public void testAddCollege() {
        assertTrue(true);
    }

    @Test
    public void testUpdateCollege() {
        assertTrue(true);
    }

    @Test
    public void testIsCollegeExist() {
        assertTrue(true);
    }

    @Test
    public void testGetCollegeInformation() {
        assertTrue(true);
    }

    @Test
    public void testGetCollegeBySociety() {
        assertTrue(true);
    }*/

}
