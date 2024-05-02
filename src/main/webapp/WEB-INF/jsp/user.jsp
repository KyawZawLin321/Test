<%@ include file="header.jsp"%>
<%@ page import="com.ai.ojt12.dto.*,java.util.List"%>

<div class="main_contents">
	<div id="sub_content">
		<form:form class="row g-3 mt-3 ms-2"
			action="/StudentRegistrationJPA/searchuser" method="post" modelAttribute="user">
			<div class="col-auto">
				<label for="staticEmail2" class="visually-hidden">User Id</label> <form:input
					type="text" class="form-control" id="staticEmail2"
					placeholder="User ID" path="id" />
			</div>
			<div class="col-auto">
				<label for="inputPassword2" class="visually-hidden">User
					Name</label> <form:input type="text" class="form-control" id="inputPassword2"
					placeholder="User Name" path="name" />
			</div>

			<div class="col-auto">
				<button type="submit" class="btn btn-primary mb-3" >Search</button>
			</div>
			<div class="col-auto">
				<a href="/user/adduserdisplay"><button
						type="button" class="btn btn-secondary "
						onclick="location.href = 'USR001.html';" >Add</button></a>

			</div>
			<div class="col-auto">
				<button type="reset" class="btn btn-danger mb-3" >Reset</button>
			</div>
		</form:form>

		<h3 style="color: green">${msg}</h3>
				<h3 style="color: red">${errorMsg}</h3>
				<a href="generateReport?export=excel">excel</a>
<a href="generateReport?export=pdf">pdf</a>
		<table class="table table-striped" id="stduentTable">
			<thead>
				<tr>

					<th scope="col">User ID</th>
					<th scope="col">User Name</th>
					<th scope="col">Actions</th>

				</tr>

			</thead>
			<tbody>
				<% List<User> users = (List<User>) request.getAttribute("users");
			for (User user1 : users) { 
			%>
				<tr>


					<td><%=user1.getId()%></td>
					<td><%=user1.getName()%></td>

					<td>
						<button type="button" class="btn btn-secondary mb-2"
							onclick="openUpdateModal('<%=user1.getId()%>' , '<%=user1.getName()%>' ,
                     '<%=user1.getEmail()%>' , '<%=user1.getPassword()%>','<%=user1.getRole()%>')">
							<i class="fa-solid fa-pen-to-square"></i>

						</button>
						<button type="submit" class="btn btn-secondary mb-2"
							onclick="openDeleteModal('<%=user1.getId()%>' , '<%=user1.getName()%>')">
							<i class="fa-solid fa-trash-can"></i>
						</button>
					</td>



					<% } %>
				
			</tbody>
		</table>
		<!-- delete model -->
		<div class="modal fade" id="deleteModal" tabindex="-1"
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
					<form:form action="/StudentRegistrationJPA/deleteuser" method="post" modelAttribute="user">
						<div class="modal-footer">
							<input type="button" class="modalBtn btn btn-outline-primary"
								data-bs-dismiss="modal" value="No"><form:hidden id="deleteId" path="id"/>  <input type="submit"
								class="modalBtn btn btn-danger col-2" value="Yes">
						</div>
					</form:form>
				</div>
			</div>
		</div>
		<!-- delete model -->
		<!-- update model -->
		<div class="modal fade" id="updateModel">

			<div class="modal-dialog">
				<div class="modal-content p-3">
					<div class="modal-header">
						<h1 align="center" class="modal-title fs-5 fw-3"
							id="staticBackdropLabel">Update User</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<form:form action="/StudentRegistrationJPA/updateuser" method="post"
						class="was-validated" modelAttribute="user">
						<div class="mb-3">
						
						<p style="color:red;" id="error">${errorMsg}</p>
							<div class="mb-3">
								<label class="form-label text-success">Name </label> <form:input
									type="text" class="form-control" path="name"
									id="updateName" placeholder="Enter Username" required="required"/>
							</div>
							<div class="mb-3">
								<label class="form-label text-success">Email address</label> <form:input
									type="email" class="form-control" path="email" id="updateEmail"
									placeholder="Enter Email" required="required"/>
							</div>
							<div class="mb-3">
								<label class="form-label text-success">Password </label> <form:password
									 class="form-control" path="password"
									id="updatePassword" placeholder="Enter password" required="required" />
							</div>
							<div class="mb-3">
								<label class="form-label text-success">Confirm Password
								</label> <form:password  class="form-control"
									path="confirmPassword" id=""
									placeholder="Enter comfirm password" required="required"/>
							</div>

							


						</div>


						<hr>
						<div class="btnGp row mb-3">
							<form:hidden  path="id" id="updateId" /> <input
								type="button" data-bs-dismiss="modal"
								class="modalBtn btn btn-outline-danger col me-2 ms-3"
								value="Cancel"> <input type="submit"
								class="modalBtn btn btn-success col me-3" value="Update">
						</div>
					</form:form>
				</div>
			</div>
		</div>

		<!-- update model -->


	</div>
</div>

<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<script>
function openUpdateModal(id, name, email ,password,role) {
	$('#updateId').val(id);
	$('#updateName').val(name);
	$('#updateEmail').val(email);
	$('#updatePassword').val(password);
	$('#updateRole').val(role);

	$('#updateModel').modal('show');
};
function openDeleteModal(id,name) {
	$('#deleteId').val(id);
	$('#deleteName').text(name);
	$('#deleteModal').modal('show');
};
	

</script>

<%@ include file="footer.jsp"%>