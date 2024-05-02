<%@ include file="header.jsp"%>

<div class="main_contents">
	<div id="sub_content">
		<form:form action="/auth/confirmopt" method="post"
			class="was-validated" modelAttribute="user">
	
			<h2 class="col-md-6 offset-md-2 mb-5 mt-4">OTP</h2>
			
			<div class="row mb-4">
				<div class="col-md-2"></div>
				<label for="name" class="col-md-2 col-form-label">Enter code</label>
				<div class="col-md-4">
					<form:input type="text" class="form-control" id="optCode" path="optCode"
						required="required"/>
				</div>
			</div>


			<div class="row mb-4">
				<div class="col-md-4"></div>

				<div class="col-md-6">


					<button type="submit" class="btn btn-secondary col-md-2"
						data-bs-toggle="modal" data-bs-target="#exampleModal">Continue</button>
						<div class=" text-center">
				<label for="exampleFormControlInput1" class="form-label">Didn't
					get code?</label> <a href="/user/forgotpassword">Re-Enter Email Address</a>
			</div>
				<!--  	<div class="modal fade" id="exampleModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Course
										Registration</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<h5 style="color: rgb(127, 209, 131);" id="modalMessage">
										
									</h5>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-success col-md-2"
										data-bs-dismiss="modal">Ok</button>

								</div>
							</div>
						</div>
					</div> -->
				</div>

			</div>
		</form:form>
	</div>
</div>


<%@ include file="footer.jsp"%>