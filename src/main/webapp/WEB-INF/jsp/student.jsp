<%@ include file="header.jsp"%>
<%@ page import="com.ai.ojt12.dto.*,java.util.List"%>


<div class="main_contents">
	<div id="sub_content">
		
		<h3 style="color: green;">${Update}</h3>
		<h3 style="color: green;">${Delete}</h3>
		<h3 style="color: green;">${StuMsg}</h3>


		<div>
<a href="studentReport?export=excel">excel</a>
<a href="studentReport?export=pdf">pdf</a>
        <div class="table-responsive">

			<table class="table table-striped ms-3 mt-3" id="stduentTable">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">Student ID</th>
						<th scope="col">Name</th>
						<th scope="col">Course Name</th>
						<th scope="col">Details</th>
						<th scope="col">Actions</th>

					</tr>
				</thead>
				<tbody>
					<% List<Student> students = (List<Student>) request.getAttribute("students");
					 int i = 0;
				for (Student student : students) { 
		
			%>
					<tr>
						<th scope="row"><%= i+1 %></th>
						<td><%=student.getId()%></td>

						<td><%=student.getName() %></td>

						<td><%=student.getAttend()%></td>
						<td><form:form action="/StudentRegistrationJPA/studentdetail"
								method="get" modelAttribute="student">
								<form:hidden path="id" value="<%=student.getId()%>" />
								<button type="submit" class="btn btn-secondary mb-2">
									<i class="fa-solid fa-list"></i>
								</button>
							</form:form></td>

						<td>
							<button type="submit" class="btn btn-secondary mb-2"
								onclick="openUpdateStudentModal('<%=student.getId()%>' , '<%=student.getName()%>' ,
                    '<%=student.getGender()%>','<%=student.getPhone() %>','<%=student.getEducation()%>','<%=student.getAttend()%>')">
								<i class="fa-solid fa-pen-to-square"></i>

							</button>
							<button type="submit" class="btn btn-secondary mb-2"
								onclick="openDeleteStudentModal('<%=student.getId()%>' , '<%=student.getName()%>')">
								<i class="fa-solid fa-trash-can"></i>
							</button>
						</td>

					</tr>
					<%i++;} %>
				</tbody>
			</table>
			</div>
		</div>
	</div>
</div>
<!-- update model -->
<!--  -->
<div class="modal fade" id="updateModel">

	<div class="modal-dialog">
		<div class="modal-content p-3">
			<div class="modal-header">
				<h1 align="center" class="modal-title fs-5 fw-3"
					id="staticBackdropLabel">Update Student</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<form:form action="/StudentRegistrationJPA/studentupdate" enctype="multipart/form-data" method="post"
				class="was-validated" modelAttribute="student">
				<div class="mb-3">
					<label class="form-label text-success">Name </label>
					<form:input type="text" class="form-control" path="name"
						id="updateName" placeholder="Enter Username" required="required" />
				</div>
				<div class="mb-3">
					<label class="form-label text-success">DOB</label>
					<form:input type="date" class="form-control" path="dob"
						id="updateDob" required="required" />
				</div>
				<div class="mb-3">
					<label for="exampleFormControlInput1" class="form-label">Gender
					</label> <label> <form:radiobutton id="maleRadio" path="gender"
							value="Male" /> Male
					</label> <label> <form:radiobutton path="gender" id="femaleRadio"
							value="Female" /> Female
					</label>
				</div>
				<div class="mb-3">
					<label class="form-label text-success">Phone </label>
					<form:input type="text" class="form-control" path="phone"
						id="updatePhone" placeholder="Enter Username" required="required" />
				</div>

				<div class="mb-3">
					<label for="role" class="form-label text-success">Education
					</label>
					<form:select path="education" class="form-select "
						id="updateEducation" required="required">
						<form:option value="Bachelor of Information Technology">Bachelor
								of Information Technology</form:option>
						<form:option value="Diploma in IT">Diploma in IT</form:option>
						<form:option value="Bachelor of Computer Science">Bachelor of
								Computer Science</form:option>
					</form:select>
				</div>
				<div class="mb-3">
					<label for="attend" class="form-label text-success">Attend
					</label> <br>
					<% List<Course> courses = (List<Course>) request.getAttribute("courses");
	    
			for (Course course : courses) { 
		
            %>
					<div class="form-check-inline col-md-2">

						<input class="form-check-input" type="checkbox" name="attend"
							id="updateAttend" value="<%=course.getId()%>"> <label
							class="form-check-label" for="gridRadios1"> <%=course.getName() %>
						</label>
					</div>
					<%} %>



				</div>
				<div class="mb-3">
					<label for="name" class="col-md-2 col-form-label">Photo</label> <input
						type="file" class="form-control" id="file" name="file" required>

				</div>



				<hr>
				<div class="btnGp row mb-3">
					<form:hidden path="id" id="updateId" />
					<input type="button" data-bs-dismiss="modal"
						class="modalBtn btn btn-outline-danger col me-2 ms-3"
						value="Cancel"> <input type="submit"
						class="modalBtn btn btn-success col me-3" value="Update">
				</div>
			</form:form>
		</div>
	</div>
</div>

<!-- update model -->
<!-- delete model -->
<div class="modal fade" id="deleteStudentModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">User Deletion</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">

				<h5 style="color: rgb(127, 209, 131);">Are you sure want to
					delete !</h5>
				<h3 class="text-warning d-block" id="deleteName">!</h3>
			</div>
			<form:form action="/StudentRegistrationJPA/studentdelete" method="post"
				modelAttribute="student">
				<div class="modal-footer">
					<input type="button" class="modalBtn btn btn-outline-primary"
						data-bs-dismiss="modal" value="No">
					<form:hidden id="deleteId" path="id" />
					<input type="submit" class="modalBtn btn btn-danger col-2"
						value="Yes">
				</div>
			</form:form>
		</div>
	</div>
</div>
<!-- delete model -->
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
	
<script>
$(document).ready( function () {
    $('#stduentTable').DataTable();
} );
function openUpdateStudentModal(id, name, gender ,phone,education,attend) {
	$('#updateId').val(id);
	$('#updateName').val(name);
	$('#updatePhone').val(phone);
	$('#updateEducation').val(education);
	  var attends = attend.split(",");

	    // Iterate over each course ID
	    attends.forEach(function(courseId) {
	        console.log(courseId);

	        // Check if the course ID matches any of the attended courses
	        <% List<Course> courses = (List<Course>) request.getAttribute("courses");
	        for (Course course : courses) { %>
	            if ("<%= course.getName() %>" === courseId) {
	                $('#updateAttend[value="<%= course.getId() %>"]').prop('checked', true);
	            }
	        <% } %>
	    });
	if (gender === 'Male') {
        $('#maleRadio').prop('checked', true);
    } else if (gender === 'Female') {
        $('#femaleRadio').prop('checked', true);
    }
	
	$('#updateModel').modal('show');
};
function openDeleteStudentModal(id,name) {
	$('#deleteId').val(id);
	$('#deleteName').text(name);
	$('#deleteStudentModal').modal('show');

};

</script>


<%@ include file="footer.jsp"%>