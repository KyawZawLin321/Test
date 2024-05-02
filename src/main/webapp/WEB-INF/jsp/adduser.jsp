<%@ include file="header.jsp"%>

<div class="main_contents">
	<div id="sub_content">
		<form:form id="registerForm" action="/StudentRegistrationJPA/adduser" method="post"
			 modelAttribute="user">

			<h2 class="col-md-6 offset-md-2 mb-5 mt-4">User Registration</h2>
			<h3 style="color: red; padding-left: 250px; padding-bottom: 20px;">${error}</h3>
			<p style="color: red;">${error}</p>

			<div class="row mb-4">
				<div class="col-md-2"></div>
				<form:label path="name" for="name" class="col-md-2 col-form-label">Name</form:label>
				<div class="col-md-4">
					<form:input type="text" class="form-control" id="name" path="name" />
					<form:errors path="name" style="color:red;"></form:errors>
					<p id="errorName" style="color: red; size: 15px"></p>
				</div>
			</div>
			<div class="row mb-4">
				<div class="col-md-2"></div>
				<form:label path="email" for="email" class="col-md-2 col-form-label">Email</form:label>
				<div class="col-md-4">
					<form:input type="email" class="form-control" id="email"
						path="email" />
					<form:errors path="email" style="color:red;"></form:errors>
					<p id="errorEmail" style="color: red; size: 15px"></p>

				</div>
			</div>
			<div class="row mb-4">
				<div class="col-md-2"></div>
				<form:label path="password" for="password"
					class="col-md-2 col-form-label">Password</form:label>
				<div class="col-md-4">
					<form:password class="form-control" id="password" path="password" />
					<form:errors path="password" style="color:red;"></form:errors>
					<p id="errorPassword" style="color: red; size: 15px"></p>
					<p id="errorElement" style="color: red; size: 15px">
				</div>
			</div>
			<div class="row mb-4">
				<div class="col-md-2"></div>
				<form:label path="confirmPassword" for="confirmPassword"
					class="col-md-2 col-form-label">Confirm Password</form:label>
				<div class="col-md-4">
					<form:password class="form-control" id="confirmPassword"
						path="confirmPassword" />
					<form:errors path="confirmPassword" style="color:red;"></form:errors>
					<p id="errorConfirm" style="color: red; size: 15px"></p>

				</div>
			</div>
			<div class="row mb-4">
				<div class="col-md-2"></div>
				<form:label path="role" for="userRole"
					class="col-md-2 col-form-label">User Role</form:label>
				<div class="col-md-4">
					<form:select path="role" class="form-select" aria-label="Education"
						id="userRole">
						<form:option value="User">User</form:option>
					</form:select>
				</div>
			</div>
			<div class="row mb-4">
				<div class="col-md-4"></div>

				<div class="col-md-6">

					<p id="errorAll" style="color: red; size: 15px"></p>

					<button type="submit" class="btn btn-secondary col-md-2">Add</button>
					<!--     <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Registered Succesfully !</h5>
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
                        </div> -->
				</div>

			</div>
		</form:form>
	</div>
</div>
<!-- <script>
	  document.getElementById('registerForm').addEventListener('submit', function(event) {
	    var nameInput = document.getElementById('name').value;
	    var emailInput = document.getElementById('email').value;
	    var passwordInput = document.getElementById('password').value;
	    var confirmPasswordInput = document.getElementById('confirmPassword').value;
	    var errorName = document.getElementById('errorName');
	    var errorEmail = document.getElementById('errorEmail');
	    var errorPassword = document.getElementById('errorPassword');
	    var errorConfirm = document.getElementById('errorConfirm');
	    var errorMsg = document.getElementById('errorMsg');
	    var errorAll = document.getElementById('errorAll');

	    var errorElement = document.getElementById('error');
	    
	    if (!nameInput.trim() && !emailInput.trim() && !passwordInput.trim() && !confirmPasswordInput.trim()) {
			   errorAll.textContent = "All fields are required.";
			   event.preventDefault(); 
			   }else if(!nameInput.trim()){
				   errorName.textContent = "Please fill the name field.";
			        event.preventDefault();

		}	   
	    else if(!emailInput.trim()){
	    	errorEmail.textContent = "Please fill the email field.";
	        event.preventDefault();
		}else if(!passwordInput.trim()){
			errorPassword.textContent = "Please fill the password field.";
	        event.preventDefault();
		}else if(passwordInput !== confirmPasswordInput){
			errorConfirm.textContent = "Passwords do not match.";
		      event.preventDefault();
		}else if(passwordInput.length < 4 || passwordInput.length > 8) {
			errorElement.textContent = "Password must be between 4 and 8 characters.";
		      event.preventDefault();
		}else if(!nameInput.trim()){
	        errorName.textContent = "Please fill the name field.";
	        event.preventDefault();
		}else {
		    // Do something with the form data, like submitting it to a server
		    // For now, let's just log it
		    // Clear error message if validation passes
		    errorMsg.textContent = "";
		  }
	    
	  });
</script> -->
<%@ include file="footer.jsp"%>