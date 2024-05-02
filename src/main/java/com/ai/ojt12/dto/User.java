package com.ai.ojt12.dto;


import javax.validation.constraints.NotEmpty;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.NamedStoredProcedureQuery;
import jakarta.persistence.ParameterMode;
import jakarta.persistence.StoredProcedureParameter;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;

@Entity

 @NamedStoredProcedureQuery(name = "findUserByEmail", procedureName =
 "GetUserByEmail", parameters =
 {@StoredProcedureParameter(name="userEmail",mode=ParameterMode.IN,type=String
  .class)},resultClasses = {User.class})
 
  @NamedStoredProcedureQuery(name = "updateUser", procedureName = "updateUser",
 parameters =
  {@StoredProcedureParameter(name="u_id",mode=ParameterMode.IN,type=String.
  class),
 
  @StoredProcedureParameter(name = "u_name", mode = ParameterMode.IN, type =
  String.class),
  
  @StoredProcedureParameter(name = "u_email", mode = ParameterMode.IN, type =
  String.class),
 
  @StoredProcedureParameter(name = "u_password", mode = ParameterMode.IN, type
  = String.class),
  
  @StoredProcedureParameter(name = "u_role", mode = ParameterMode.IN, type =
  String.class) }, resultClasses = {User.class})
  
  @NamedStoredProcedureQuery(name = "deleteUserById", procedureName =
  "deleteUser", parameters =
 {@StoredProcedureParameter(name="u_id",mode=ParameterMode.IN,type=String.
  class)}, resultClasses = {User.class})
 

@Table(name = "user")
public class User {
	@Id
	@Column(name = "id")
	private String id;
	
//	@NotEmpty
	@Column(name = "name")

	private String name;
	
	@NotEmpty
	@Column(name = "email")

	private String email;
	
	@NotEmpty
	@Column(name = "password")

	private String password;
	
	
	@Column(name = "role")

	private String role;
	
	@Transient
//	@NotEmpty
	private String confirmPassword;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	
	
	
}
