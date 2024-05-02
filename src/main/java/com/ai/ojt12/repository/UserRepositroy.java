package com.ai.ojt12.repository;

import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Repository;
import com.ai.ojt12.dto.User;
import com.ai.ojt12.service.JpaUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.StoredProcedureQuery;
import jakarta.persistence.TypedQuery;
@Repository
public class UserRepositroy {
	
	public  int insertUser(User user) {
		int result=0;
		EntityManager em=null;
		try {
			em=JpaUtil.getEntityManagerFactory().createEntityManager();
			em.getTransaction().begin();
			em.persist(user);
			em.getTransaction().commit();
			result=1;
		}catch(Exception e){
			System.out.println(e.getMessage());
		
		}finally {
			em.close();
		}
		return result;
	}
	public List<User> findAllUser(){
		EntityManager em=null;
		List<User>users = null;
		try {
		
			em=JpaUtil.getEntityManagerFactory().createEntityManager();
			em.getTransaction().begin();
			 users = em.createQuery("Select u from User u",User.class).getResultList();
            // System.out.println(em.find(User.class,"USR001").getName());

		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			em.close();
		}
		return users;		
	}
	public User findUserByEmail(String email) {
		EntityManager em=JpaUtil.getEntityManagerFactory().createEntityManager();;
		User user = null;
		StoredProcedureQuery sp=em.createNamedStoredProcedureQuery("findUserByEmail");
		sp.setParameter("userEmail", email);
		try {
			
			user=(User) sp.getSingleResult();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			em.close();
		}
		
		return user;
		
	}
	  public void updateUser(User user) {
	        EntityManager em = null;
	        try {
	            em = JpaUtil.getEntityManagerFactory().createEntityManager();
	            em.getTransaction().begin();
	    		StoredProcedureQuery sp=em.createNamedStoredProcedureQuery("updateUser");  
	    		sp.setParameter("u_id", user.getId());
	    		sp.setParameter("u_name", user.getName());
	    		sp.setParameter("u_email", user.getEmail());
	    		sp.setParameter("u_password", user.getPassword());
	    		sp.setParameter("u_role", user.getRole());
	              
	              // Execute the stored procedure
	    		var isUpdated=sp.execute();
	    		
	    		System.out.println("update excute: "+ isUpdated);
	              
	              em.getTransaction().commit();	
	              em.getEntityManagerFactory().getCache().evictAll();
					/*
					 * em.detach(sp); em.refresh(sp);
					 * 
					 * System.out.println(em.find(User.class,user.getId()).getName());
					 */
	        } catch(Exception e) {
	            if (em != null && em.getTransaction().isActive()) {
	                em.getTransaction().rollback(); // Rollback transaction if an exception occurs
	                System.out.println("update rollback");
	            }
	            System.out.println("update"+e.getMessage());
	        } finally {
	            if (em != null && em.isOpen()) {
	                em.close(); // Close EntityManager in finally block
	            }
	        }
	    }
	  public void deleteUserById(String id) {
	        EntityManager em = null;
	        try {
	            em = JpaUtil.getEntityManagerFactory().createEntityManager();
	            em.getTransaction().begin();
	    		StoredProcedureQuery sp=em.createNamedStoredProcedureQuery("deleteUserById");  
	    		sp.setParameter("u_id",id);
	    		              
	    		var isDeleted=sp.execute();
	    		System.out.println("delete execute "+isDeleted);
	              
	              em.getTransaction().commit();	            
	        } catch(Exception e) {
	            if (em != null && em.getTransaction().isActive()) {
	                em.getTransaction().rollback(); // Rollback transaction if an exception occurs
	                System.out.println("delete ");
	            }
	            System.out.println("delete "+e.getMessage());
	        } finally {
	            if (em != null && em.isOpen()) {
	                em.close(); // Close EntityManager in finally block
	            }
	        }
	    }
	  public List<User> searchUser(String id, String name) {
	        List<User> users = new ArrayList<>();
			EntityManager em=JpaUtil.getEntityManagerFactory().createEntityManager();;

	        try {
	        	
	            StringBuilder jpqlBuilder = new StringBuilder("SELECT u FROM User u WHERE 1=1 ");

	            if (id != null && !id.isEmpty()) {
	                jpqlBuilder.append("AND LOWER(u.id) LIKE LOWER(:id) ");
	            }

	            if (name != null && !name.isEmpty()) {
	                jpqlBuilder.append("AND LOWER(u.name) LIKE LOWER(:name) ");
	            }

	            TypedQuery<User> query = em.createQuery(jpqlBuilder.toString(), User.class);

	            if (id != null && !id.isEmpty()) {
	                query.setParameter("id", "%" + id.toLowerCase() + "%");
	            }

	            if (name != null && !name.isEmpty()) {
	                query.setParameter("name", "%" + name.toLowerCase() + "%");
	            }

	            users = query.getResultList();
	        } catch (Exception e) {
	            System.out.println(e.getMessage());
	        }

	        return users;
	    }
	  
	public String selectUserId() {
	    String id = null;
	    String sql = "SELECT max(u.id) from User u";
		EntityManager em=null;

	    try {
			em = JpaUtil.getEntityManagerFactory().createEntityManager();
			
			
			String userId =  (String) em.createQuery(sql).getSingleResult();
	        
			if(userId!=null) {
				return userId;
			}else {
				return null;
			}
			
	        
	    } catch (Exception e) {
	        System.out.println("Select User id Error..." + e);
	    }finally {
			em.close();
		}
	    return id;
	}
	 //Generate Next user id
	 public String generateNextUserId() {
	        String lastUserId = this.selectUserId();
	        
	        // If no previous ID exists, start with STU0001
	        if (lastUserId == null || lastUserId.isEmpty()) {
	            return "USR001";
	        }

	        // Extract the numeric part, increment it, and format it back.
	        int lastIdNumericPart = Integer.parseInt(lastUserId.substring(3));
	        int nextIdNumericPart = lastIdNumericPart + 1;
	        String nextUserId = String.format("USR%03d", nextIdNumericPart);
	        
	        System.out.println(nextUserId);

	        return nextUserId;
	    }

	
	
}
