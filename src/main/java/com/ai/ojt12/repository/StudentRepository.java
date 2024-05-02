package com.ai.ojt12.repository;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.util.StreamUtils;

import com.ai.ojt12.dto.Course;
import com.ai.ojt12.dto.Student;
import com.ai.ojt12.dto.StudentHasCourse;
import com.ai.ojt12.service.JpaUtil;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.persistence.StoredProcedureQuery;
@Repository
public class StudentRepository {
	public Student findStudentByPhone(String phone) {
		EntityManager em=JpaUtil.getEntityManagerFactory().createEntityManager();;
		Student student = null;
		
		try {
			student =em.createQuery("SELECT s FROM Student s WHERE s.phone=:phone", Student.class)
					.setParameter("phone", phone).getSingleResult();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			em.close();
		}
		
		return student;
		
	}
	public Course findCourseById(String id) {
		EntityManager em=JpaUtil.getEntityManagerFactory().createEntityManager();;
		Course course = null;
		
		try {
			course =em.createQuery("SELECT c FROM Course c WHERE c.id=:id", Course.class)
					.setParameter("id", id).getSingleResult();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			em.close();
		}
		
		return course;
		
	}
	public StudentHasCourse findStudentCourseById(String id) {
		EntityManager em=JpaUtil.getEntityManagerFactory().createEntityManager();;
		StudentHasCourse studentCourse = null;
		
		try {
			studentCourse =em.createQuery("SELECT sc FROM StudentHasCourse sc WHERE sc.student_id=:student_id", StudentHasCourse.class)
					.setParameter("student_id", id).getSingleResult();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			em.close();
		}
		
		return studentCourse;
		
	}
	public int insertStudentAndCourse(StudentHasCourse studentCourse) {
		int i=0;
		EntityManager em=null;
		try {
			String[] courseIds = studentCourse.getCourse_id();

			for (String courseId : courseIds) {
				em=JpaUtil.getEntityManagerFactory().createEntityManager();
				em.getTransaction().begin();

			Course course=findCourseById(courseId);
			studentCourse.setCourse(course);
			studentCourse.setStudent(studentCourse.getStudent());
			em.persist(studentCourse);
			em.getTransaction().commit();
            em.close(); // Close EntityManager in finally block

			}

			i=1;
		}catch(Exception e) {
            if (em != null && em.getTransaction().isActive()) {
                em.getTransaction().rollback(); // Rollback transaction if an exception occurs
            }
            System.out.println("update"+e.getMessage());
        } finally {
            if (em != null && em.isOpen()) {
                em.close(); // Close EntityManager in finally block
            }
        }
		return i;
		
	}
	public int createStudent(Student student) {
		int i=0;
		EntityManager em=JpaUtil.getEntityManagerFactory().createEntityManager();
		try {
			em.getTransaction().begin();
			em.persist(student);
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
	public int deleteStudent(String id) {
		EntityManager em = null;
		int i = 0;
		try {
			em = JpaUtil.getEntityManagerFactory().createEntityManager();
			em.getTransaction().begin();
		Query query = em.createQuery("DELETE FROM Student s WHERE s.id=:id");
		query.setParameter("id", id);
		 i = query.executeUpdate();
			em.getTransaction().commit();

		i = 1;
		} finally {
			em.close();
		}
		return i;
	}
	public List<Student> findAllStudents() {
	        List<Student> students =new ArrayList<>();
        	EntityManager em=JpaUtil.getEntityManagerFactory().createEntityManager();

	        try {
				em.getTransaction().begin();

	            Query query = em.createQuery("SELECT s FROM Student s");
	            List<Student> resultList = query.getResultList();
	            for (Student student : resultList) {
	                String attends = findNamesByStudentId(student.getId());
	                student.setAttend(attends);
	                students.add(student);
	            }
	        } catch (Exception e) {
	            System.out.println(e.getMessage());
	        }
	        return students;
	    }
	 public Student findStudentById(String id) {
     	EntityManager em=JpaUtil.getEntityManagerFactory().createEntityManager();

	        try {
				em.getTransaction().begin();

	            Query query = em.createQuery("SELECT s FROM Student s WHERE s.id = :id");
	            query.setParameter("id", id);
	            Student student = (Student) query.getSingleResult();
	            String attends = findNamesByStudentId(id);
	            student.setAttend(attends);
	            return student;
	        } catch (Exception e) {
	        	System.out.println(e.getMessage());
	            return null;
	        }
	    }
	 public void updateStudent(Student student) {
	     	EntityManager em=JpaUtil.getEntityManagerFactory().createEntityManager();

	        try {
	        	em.getTransaction().begin();
	            
	            Student managedStudent = em.find(Student.class, student.getId());
	            if (managedStudent != null) {
	                managedStudent.setName(student.getName());
	                managedStudent.setDob(student.getDob());
	                managedStudent.setGender(student.getGender());
	                managedStudent.setPhone(student.getPhone());
	                managedStudent.setEducation(student.getEducation());
	                managedStudent.setPhoto(student.getPhoto());
	                em.getTransaction().commit();
	            } else {
	                System.out.println("Student with ID " + student.getId() + " not found.");
	            }
	        }catch(Exception e) {
				em.getTransaction().rollback();
				System.out.println(e.getMessage());
			}finally{
				em.close();
			}
	    }
	 public void deleteStudentCourse(String id) {
	        EntityManager em = null;
	        try {
	            em = JpaUtil.getEntityManagerFactory().createEntityManager();
	            em.getTransaction().begin();
	    		StoredProcedureQuery sp=em.createNamedStoredProcedureQuery("deleteStudentCourseById");  
	    		sp.setParameter("sc_student_id",id);
	    		              
	    		sp.execute();
	              
	              em.getTransaction().commit();	            
	        } catch(Exception e) {
	            if (em != null && em.getTransaction().isActive()) {
	                em.getTransaction().rollback(); // Rollback transaction if an exception occurs
	            }
	        } finally {
	            if (em != null && em.isOpen()) {
	                em.close(); // Close EntityManager in finally block
	            }
	        }
	    }
	  
    public String findNamesByStudentId(String studentId) {
        StringBuilder names = new StringBuilder();
		EntityManager em=null;

        try {
			em=JpaUtil.getEntityManagerFactory().createEntityManager();

            Query query = em.createQuery("SELECT c.name FROM StudentHasCourse sc JOIN sc.course c WHERE sc.student.id = :studentId");
            query.setParameter("studentId", studentId);
            List<String> resultList = query.getResultList();
            for (String name : resultList) {
                if (names.length() > 0) {
                    names.append(",");
                }
                names.append(name);
            }
        }catch(Exception e) {
			em.getTransaction().rollback();
			System.out.println(e.getMessage());
		}finally{
			em.close();
		}
        return names.toString();
    }

	
	public String selectStudentId() {
	    String id = null;
	    String sql = "SELECT max(s.id) from Student s";
		EntityManager em=null;

	    try {
			em = JpaUtil.getEntityManagerFactory().createEntityManager();
			String studentId =  (String) em.createQuery(sql).getSingleResult();
	        
			if(studentId!=null) {
				return studentId;
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
	 public String generateNextStudentId() {
	        String lastStudentId = this.selectStudentId();
	        
	        // If no previous ID exists, start with STU0001
	        if (lastStudentId == null || lastStudentId.isEmpty()) {
	            return "STU001";
	        }

	        // Extract the numeric part, increment it, and format it back.
	        int lastIdNumericPart = Integer.parseInt(lastStudentId.substring(3));
	        int nextIdNumericPart = lastIdNumericPart + 1;
	        String nextStudentId = String.format("STU%03d", nextIdNumericPart);
	        
	        System.out.println(nextStudentId);

	        return nextStudentId;
	    }
	 
	 public List<Student> searchStudents(String studentId, String studentName, String course) {
		    EntityManager em = JpaUtil.getEntityManagerFactory().createEntityManager();

		    List<Student> students = new ArrayList<>();


			    try {
			        StringBuilder jpqlBuilder = new StringBuilder();
			        jpqlBuilder.append("SELECT s FROM Student s "
			        		+ "Inner join s.StudentHasCourse sc on sc.student_id=s.id "
			        		+ "Join sc.Course c on sc.course_id=c.id where 1=1 ");

			        if (studentId != null && !studentId.isEmpty()) {
			            jpqlBuilder.append("AND LOWER(s.id) LIKE LOWER(:studentId) ");
			        }

			        if (studentName != null && !studentName.isEmpty()) {
			            jpqlBuilder.append("AND LOWER(s.name) LIKE LOWER(:studentName) ");
			        }

			        if (course != null && !course.isEmpty()) {
			            jpqlBuilder.append(" AND LOWER(c.name) LIKE LOWER(:course)) ");
			        }

			        Query query = em.createQuery(jpqlBuilder.toString());

		        if (studentId != null && !studentId.isEmpty()) {
		            query.setParameter("studentId", studentId);
		        }

		        if (studentName != null && !studentName.isEmpty()) {
		            query.setParameter("studentName", "%" + studentName.toLowerCase() + "%");
		        }

		        if (course != null && !course.isEmpty()) {
		            query.setParameter("course", "%" + course.toLowerCase() + "%");
		        }

		        List<?> resultList = query.getResultList();

		        for (Object result : resultList) {
		            if (result instanceof Student) {
		                students.add((Student) result);
		            }
		        }

		    } catch (Exception e) {
		        System.out.println(e.getMessage());
		    } finally {
		        em.close();
		    }

		    return students;
		}
}
