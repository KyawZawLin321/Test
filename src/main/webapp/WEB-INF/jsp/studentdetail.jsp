<%@ include file="header.jsp"%>
<%@ page import="com.ai.ojt12.dto.*,java.util.List" %>
         <div class="main_contents">
        
                
    <div id="sub_content">
  				 <button class="btn btn-sm rounded btn-success"
				style="margin-left:1000px; width:200px;margin-top: 20px;"		
				onclick="printReceipt()">Print</button>
        <form id="print">
            <h2 class="col-md-6 offset-md-2 mb-5 mt-4" >Student Details</h2>
            <div class="row mb-4">
                <div class="col-md-2"></div>
                <label for="studentID" class="col-md-2 col-form-label">Student ID</label>
                <div class="col-md-4">
                    <input type="text" class="form-control" value="${student.id} " id="studentID" disabled>
                </div>
            </div>
            <div class="row mb-4">
                <div class="col-md-2"></div>
                <label for="name" class="col-md-2 col-form-label">Photo</label>
              <img src="${student.photo}" alt="image"> 
            </div>
            <div class="row mb-4">
                <div class="col-md-2"></div>
                <label for="name" class="col-md-2 col-form-label">Name</label>
                <div class="col-md-4">
                    <input type="text" class="form-control" id="name" value="${student.name}" disabled>
                </div>
            </div>
            <div class="row mb-4">
                <div class="col-md-2"></div>
                <label for="dob" class="col-md-2 col-form-label">DOB</label>
                <div class="col-md-4">
                    <input type="text" class="form-control" id="dob" value="${student.dob}" disabled>
                </div>
            </div>
            <fieldset class="row mb-4">
                <div class="col-md-2"></div>
                <legend class="col-form-label col-md-2 pt-0">Gender</legend>
                <div class="col-md-4">
                    <div class="form-check-inline">
                        <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1"
                            ${student.gender == 'Male' ? 'checked ' : ''} disabled>
                        <label class="form-check-label" for="gridRadios1">
                            Male
                        </label>
                    </div>
                    <div class="form-check-inline">
                        <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="option2" ${student.gender == 'Female' ? 'checked' : ''}disabled>
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
                    <input type="text" class="form-control" id="phone" value="${student.phone}" disabled>
                </div>
            </div>
            <div class="row mb-4">
                <div class="col-md-2"></div>
                <label for="education" class="col-md-2 col-form-label">Education</label>
                <div class="col-md-4">
                    <select class="form-select" aria-label="Education" id="education" disabled>
                        <option value="${student.education}" >${student.education}</option>
                    
    
                    </select>
                </div>
            </div>
            <fieldset class="row mb-4">
                <div class="col-md-2"></div>
                <legend class="col-form-label col-md-2 pt-0">Attend</legend>
     
                <div class="col-md-4">
                 <c:forEach var="attend" items="${student.attend}" varStatus="loop">
                    <div class="form-check-inline col-md-2">
                        <input class="form-check-input" type="checkbox" name="gridRadios" id="gridRadios1" value="option1" checked disabled>
                        <label class="form-check-label" for="gridRadios1">
                                    ${attend}

                        </label>
                    </div>
                        </c:forEach>
                    
    
     
                </div>
					
                
            </fieldset>
            
    
    
            </form>
    </div>
   
</div>
<script>
function printReceipt() {
    var printContent = document.getElementById("sub_content").outerHTML; // Get the content of the 'sub_content' div
    var originalContent = document.body.innerHTML;

    // Replace the body content with the content of the 'sub_content' div
    document.body.innerHTML = printContent;

    // Print the content
    window.print();

    // Restore the original content
    document.body.innerHTML = originalContent;
}
</script>

<%@ include file="footer.jsp"%>