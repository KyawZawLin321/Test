<%@ include file="header.jsp"%>
<%@ page import="com.ai.ojt12.dto.*,java.util.List" %>

             <div class="main_contents">
    <div id="sub_content">
    
        
    
<form:form action="/StudentRegistrationJPA/addstudent" method="post"  enctype="multipart/form-data"   class="was-validated" modelAttribute="student">

            <h2 class="col-md-6 offset-md-2 mb-5 mt-4">Student Registration</h2>
            
               <h3 style="color:red;">${phoneMsg}</h3>
            
            <div class="row mb-4">
                <div class="col-md-2"></div>
                <label for="name" class="col-md-2 col-form-label">Name</label>
                <div class="col-md-4">
                    <form:input type="text" class="form-control" id="name" path="name" required="required"/>
                </div>
            </div>
            <div class="row mb-4">
                <div class="col-md-2"></div>
                <label for="dob" class="col-md-2 col-form-label">DOB</label>
                <div class="col-md-4">
                    <form:input type="date" class="form-control" id="dob" path="dob" required="required"/>
                </div>
            </div>
            <fieldset class="row mb-4">
                <div class="col-md-2"></div>
                <legend class="col-form-label col-md-2 pt-0">Gender</legend>
                <div class="col-md-4">
                    <div class="form-check-inline">
                        <form:radiobutton class="form-check-input" path="gender" id="gridRadios1" value="Male"
                          checked="checked" />
                        <label class="form-check-label" for="gridRadios1">
                            Male
                        </label>
                    </div>
                    <div class="form-check-inline">
                        <form:radiobutton class="form-check-input"  path="gender" id="gridRadios2" value="Female"/>
                        <label class="form-check-label" for="gridRadios2">
                            Female
                        </label>
                    </div>
    
                </div>
            </fieldset>
    
            <div class="row mb-4">
                <div class="col-md-2"></div>
                <label for="phone" class="col-md-2 col-form-label">Phone</label>
                <div class="col-md-4">
                    <form:input type="text" class="form-control" id="phone" path="phone" required="required"/>
                </div>
            </div>
            <div class="row mb-4">
                <div class="col-md-2"></div>
                <label for="education" class="col-md-2 col-form-label">Education</label>
                <div class="col-md-4">
                    <form:select class="form-select" aria-label="Education" id="education" path="education">
                        <form:option value="Bachelor of Information Technology">Bachelor of Information Technology</form:option>
                        <form:option value="Diploma in IT">Diploma in IT</form:option>
                        <form:option value="Bachelor of Computer Science">Bachelor of Computer Science</form:option>
    
                    </form:select>
                </div>
            </div>
            <fieldset class="row mb-4">
                <div class="col-md-2"></div>
                <legend class="col-form-label col-md-2 pt-0">Attend</legend>
    			       
                <div class="col-md-4">
                   <% List<Course> courses = (List<Course>) request.getAttribute("courses");
			for (Course course : courses) { %>
                    <div class="form-check-inline col-md-2">
                        <input type="checkbox"  class="form-check-input"  name="attend" id="attend"  value="<%=course.getId()%>">
                        <label class="form-check-label" for="gridRadios1">
                            <%=course.getName() %>
                        </label>
                    </div>
                    <%} %>
                    
    
    
                </div>
    
                
                	
            </fieldset>
             <div class="row mb-4">
                <div class="col-md-2"></div>
                <label for="name" class="col-md-2 col-form-label">Photo</label>
                <div class="col-md-4">
                    <input type="file" class="form-control" id="file" name="file"  required>
                </div>
            </div>
            <div class="row mb-4">
                <div class="col-md-4"></div>
    
                <div class="col-md-4">
                    <button type="button" class="btn btn-danger ">
    
                        Reset
                    </button>
                    <button type="submit" class="btn btn-secondary col-md-2">
                        Add
                    </button>
                <!--     <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Student Registration</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <h5 style="color: rgb(127, 209, 131);">Registered Succesfully !</h5>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-success col-md-2" data-bs-dismiss="modal">Ok</button>
                               
                            </div>
                        </div>
                    </div>
            </div>-->
                </div>

    
            </div>
    
    
    
    
    
            </form:form>
    </div>
</div>



<%@ include file="footer.jsp"%>