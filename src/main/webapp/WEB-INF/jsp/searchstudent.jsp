<%@ include file="header.jsp"%>
<%@ page import="com.ai.ojt12.dto.*,java.util.List" %>

    <div class="main_contents">
    <div id="sub_content">
       <form:form class="row g-3 mt-3 ms-2"
			action="/StudentRegistrationJPA/searchstudent" method="post" modelAttribute="student">
			<div class="col-auto">
				<label for="staticEmail2" class="visually-hidden">studentID</label>
				<form:input type="text" class="form-control" id="staticEmail2"
					placeholder="Student ID" path="id"/>
			</div>
			<div class="col-auto">
				<label for="inputPassword2" class="visually-hidden">studentName</label>
				<form:input type="text" class="form-control" id="inputPassword2"
					placeholder="Student Name" path="name"/>
			</div>
			<div class="col-auto">
				<label for="inputPassword2" class="visually-hidden">Course</label> <form:input
					type="text" class="form-control" id="inputPassword2"
					placeholder="Course" path="attend"/>
			</div>
			<div class="col-auto">
				<button type="submit" class="btn btn-success mb-3">Search</button>
			</div>
			<div class="col-auto">
				<button type="reset" class="btn btn-secondary mb-3">Reset</button>
			</div>
		</form:form>
 <c:choose>
            <c:when test="${not empty searchStudentResults}">        
	  <table class="table table-striped" id="stduentTable">
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
            <% List<Student> searchResults = (List<Student>) request.getAttribute("searchStudentResults");
			 int i = 0;

            for (Student student : searchResults) {

				%>
                       <tr>
						<th scope="row"><%=i+1 %></th>
							<%i++; %>
						<td><%=student.getId()%></td>

						<td><%=student.getName() %></td>

						<td><%=student.getAttend()%></td>
						<td>
							<form action="/StudentRegistrationServlet/studentdetail">
								<input type="hidden" name="id" value="<%=student.getId()%>">
								<button type="submit" class="btn btn-secondary mb-2">
									<i class="fa-solid fa-list"></i>
								</button>
							</form>
						</td>

						<td>
							<button type="submit" class="btn btn-secondary mb-2"
								onclick="openUpdateStudentModal('<%=student.getId()%>' , '<%=student.getName()%>' ,
                    '<%=student.getGender()%>','<%=student.getPhone() %>','<%=student.getEducation()%>','<%=student.getPhoto()%>','<%=student.getAttend()%>')">
								<i class="fa-solid fa-pen-to-square"></i>
							</button>
							<button type="submit" class="btn btn-secondary mb-2"
								onclick="openDeleteStudentModal('<%=student.getId()%>' , '<%=student.getName()%>')">
								<i class="fa-solid fa-trash-can"></i>
							</button>
						</td>

					</tr>
                
		<% i++;} %>

            </tbody>
        </table>
            </c:when>
 <c:otherwise>
                <p>No results found.</p>
            </c:otherwise>
        </c:choose>
        
            </div>
</div>
<%@ include file="footer.jsp"%>