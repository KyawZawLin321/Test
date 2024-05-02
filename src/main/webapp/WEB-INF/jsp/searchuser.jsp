<%@ include file="header.jsp"%>
<%@ page import="com.ai.ojt12.dto.*,java.util.List" %>

    <div class="main_contents">
    <div id="sub_content">
        <form:form class="row g-3 mt-3 ms-2" action="/StudentRegistrationJPA/searchuser" modelAttribute="user">
            <div class="col-auto">
                <label for="staticEmail2" class="visually-hidden">User Id</label>
                <form:input type="text" class="form-control" id="staticEmail2" placeholder="User ID" path="id"/>
            </div>
            <div class="col-auto">
                <label for="inputPassword2" class="visually-hidden">User Name</label>
                <form:input type="text" class="form-control" id="inputPassword2" placeholder="User Name" path="name"/>
            </div>
    
            <div class="col-auto">
                <button type="submit" class="btn btn-primary mb-3">Search</button>
            </div>
            <div class="col-auto">
                <a href="/adduserdisplay"><button type="button" class="btn btn-secondary " onclick="location.href = 'USR001.html';">
                    Add
                </button></a>
    
            </div>
            <div class="col-auto">
                <button type="reset" class="btn btn-danger mb-3">Reset</button>
            </div>
        </form:form>
 <c:choose>
            <c:when test="${not empty searchResults}">        
	  <table class="table table-striped" id="stduentTable">
            <thead>
            
                <tr>
                    
                    <th scope="col">User ID</th>
                    <th scope="col">User Name</th>
                    <th scope="col">Actions</th>
                    
                </tr>
                
            </thead>
            <tbody>
            <% List<User> users = (List<User>) request.getAttribute("searchResults");
			for (User user1 : users) { %>

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
                </tr>
                
		<% } %>

            </tbody>
        </table>
            </c:when>
 <c:otherwise>
                <p>No results found.</p>
            </c:otherwise>
        </c:choose>
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
					<form action="/StudentRegistrationServlet/deleteuser" method="post">
						<div class="modal-footer">
							<input type="button" class="modalBtn btn btn-outline-primary"
								data-bs-dismiss="modal" value="No"> <input type="hidden"
								id="deleteId" name="id"> <input type="submit"
								class="modalBtn btn btn-danger col-2" value="Yes">
						</div>
					</form>
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
					<form action="/StudentRegistrationServlet/updateuser" method="post"
						class="was-validated">
						<div class="mb-3">
							<div class="mb-3">
								<label class="form-label text-success">Name </label> <input
									type="text" class="form-control" name="username"
									id="updateName" placeholder="Enter Username" required>
							</div>
							<div class="mb-3">
								<label class="form-label text-success">Email address</label> <input
									type="email" class="form-control" name="email" id="updateEmail"
									placeholder="Enter Email" required>
							</div>
							<div class="mb-3">
								<label class="form-label text-success">Password </label> <input
									type="password" class="form-control" name="password"
									id="updatePassword" placeholder="Enter password" required>
							</div>
							<div class="mb-3">
								<label class="form-label text-success">Comfirm Password
								</label> <input type="password" class="form-control"
									name="comfirmPassword" id=""
									placeholder="Enter comfirm password" required>
							</div>

							<div class="mb-3">
								<label for="role" class="form-label text-success">Role </label>
								<select name="role" class="form-select " id="updateRole"
									required>
									<option value="Admin">Admin</option>
									<option value="User">User</option>
								</select>
							</div>


						</div>


						<hr>
						<div class="btnGp row mb-3">
							<input type="hidden" name="id" id="updateId" /> <input
								type="button" data-bs-dismiss="modal"
								class="modalBtn btn btn-outline-danger col me-2 ms-3"
								value="Cancel"> <input type="submit"
								class="modalBtn btn btn-success col me-3" value="Update">
						</div>
					</form>
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