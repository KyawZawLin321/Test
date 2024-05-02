package com.ai.ojt12.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ai.ojt12.dto.Course;
import com.ai.ojt12.service.JpaUtil;

import jakarta.persistence.EntityManager;

@Repository
public class CourseRepository {
	
	public int createCourse(Course course) {
		int i=0;
		EntityManager em=JpaUtil.getEntityManagerFactory().createEntityManager();
		try {
			em.getTransaction().begin();
			em.persist(course);
			em.getTransaction().commit();
			i=1;
		}catch(Exception e) {
			em.getTransaction().rollback();
			System.out.println(e.getMessage());
		}finally{
			em.close();
		}
		return i;
		
	}
	public List<Course>findAll(){
		EntityManager em=JpaUtil.getEntityManagerFactory().createEntityManager();
		List<Course>courses=null;
		try {
			courses=em.createQuery("Select c from Course c",Course.class).getResultList();
		}catch(Exception e) {
			em.getTransaction().rollback();
			System.out.println(e.getMessage());
		}finally{
			em.close();
		}
		
		return courses;

	}
	public String selectCourseId() {
	    String id = null;
	    String sql = "SELECT max(c.id) from Course c";
		EntityManager em=null;

	    try {
			em = JpaUtil.getEntityManagerFactory().createEntityManager();
			
			
			String courseId =  (String) em.createQuery(sql).getSingleResult();
	        
			if(courseId!=null) {
				return courseId;
			}else {
				return null;
			}
			
	        
	    } catch (Exception e) {
	        System.out.println("Select Course id Error..." + e);
	    }finally {
			em.close();
		}
	    return id;
	}
	 //Generate Next user id
	 public String generateNextUserId() {
	        String lastCourserId = this.selectCourseId();
	        
	        // If no previous ID exists, start with STU0001
	        if (lastCourserId == null || lastCourserId.isEmpty()) {
	            return "COU001";
	        }

	        // Extract the numeric part, increment it, and format it back.
	        int lastIdNumericPart = Integer.parseInt(lastCourserId.substring(3));
	        int nextIdNumericPart = lastIdNumericPart + 1;
	        String nextCourseId = String.format("COU%03d", nextIdNumericPart);
	        
	        System.out.println(nextCourseId);

	        return nextCourseId;
	    }
}
