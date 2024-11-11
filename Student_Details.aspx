<%@ Page Title="" Language="VB" MasterPageFile="~/website.master" AutoEventWireup="false" CodeFile="Student_Details.aspx.vb" Inherits="Student_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <!-- Tagify CSS & JS CDN -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/tagify/4.9.5/tagify.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tagify/4.9.5/tagify.min.js"></script>
    <title>Student Profile Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .required-label::after {
            content: " *";
            color: red;
            font-weight: bold;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container mt-4">
        <div class="card">
            <div class="card-header bg-info text-white d-flex justify-content-between align-items-center">
                <h5 class="mb-0 text-white">Profile</h5>
                <div>
                    <button class="btn btn-light btn-sm">Save</button>
                    <span class="ms-3">MODE: EDIT</span>
                </div>
            </div>
            <div class="card-body">
                <h6 class="mb-4 bg-primary p-2 text-white rounded-2">Personal Information</h6>
                
                
                    <div class="row">
                        <!-- Left Column -->
                        <div class="col-md-8">
                            

                            <div class="row mb-3">
                                <label class="col-sm-3 col-form-label required-label">Full Name</label>
                                <div class="col-sm-3">
                                    <asp:TextBox ID="f_name" runat="server" class="form-control" placeholder="First Name"></asp:TextBox>
                                    
                                </div>
                                <div class="col-sm-3">
                                     <asp:TextBox ID="m_name" runat="server" class="form-control" placeholder="Middle Name"></asp:TextBox>
                                    
                                </div>
                                <div class="col-sm-3">
                                    <asp:TextBox ID="l_name" runat="server" class="form-control" placeholder="Last Name"></asp:TextBox>
                                    
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label class="col-sm-3 col-form-label required-label">Display Name</label>
                                <div class="col-sm-9">
                                     <asp:TextBox ID="full_name" runat="server" class="form-control" placeholder="Full Name"></asp:TextBox>
                                    
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label class="col-sm-3 col-form-label required-label">Contact Number</label>
                                <div class="col-sm-9">
                                     <asp:TextBox ID="c_number" runat="server" class="form-control" placeholder="Conact Number"></asp:TextBox>
                                    
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label class="col-sm-3 col-form-label required-label">Email Address</label>
                                <div class="col-sm-9">
                                   <asp:TextBox ID="s_email" runat="server" class="form-control" placeholder="Charusat Email"></asp:TextBox>
                                    
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label class="col-sm-3 col-form-label required-label">Birth Date</label>
                                <div class="col-sm-9">
                                    <input type="date" class="form-control" placeholder="select date">
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label class="col-sm-3 col-form-label required-label">Gender</label>
                                <div class="col-sm-9">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender" checked>
                                        <label class="form-check-label">Male</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender">
                                        <label class="form-check-label">Female</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender">
                                        <label class="form-check-label">Other</label>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!-- Right Column (Photo) -->
                        <div class="col-md-4 text-center">
                            <!-- Placeholder for the image preview -->
                            <img id="imgPreview" src="/api/placeholder/150/200" alt="Student Photo" class="img-thumbnail mb-2" style="width: 150px; height: 200px;">
                            
                            <!-- Hidden File Upload Input -->
                            <input type="file" id="fileInput" accept="image/*" style="display: none;" onchange="showImagePreview(event)">
                            
                            <!-- Button to trigger file upload -->
                            <div>
                                <button type="button" class="btn btn-info btn-sm" onclick="document.getElementById('fileInput').click();">...</button>
                                <button type="button" class="btn btn-info btn-sm" onclick="clearImagePreview()">Clear</button>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="row">
    <div class="row mb-3">
                                <label class="col-sm-2 col-form-label required-label">Address</label>
                                <div class="col-sm-2">
                                    <asp:TextBox ID="city_name" runat="server" class="form-control" placeholder="City Name"></asp:TextBox>
                                    
                                </div>
                                <div class="col-sm-2">
                                     <asp:TextBox ID="district_name" runat="server" class="form-control" placeholder="Disctrict Name"></asp:TextBox>
                                    
                                </div>
                                <div class="col-sm-2">
                                    <asp:TextBox ID="state_name" runat="server" class="form-control" placeholder="State Name"></asp:TextBox>
                                    
                                </div>
        <div class="col-sm-2">
                                    <asp:TextBox ID="country_name" runat="server" class="form-control" placeholder="Country Name"></asp:TextBox>
                                    
                                </div>
        <div class="col-sm-2">
                                    <asp:TextBox ID="zip_code" runat="server" class="form-control" placeholder="Zip Code"></asp:TextBox>
                                    
                                </div>
                            </div>

                            </div>
                            
                                <div class="row">

                            <div class="col-md-4">
                                <div class="mb-3">
                                     <label class="form-label required-label">LinkedIN Profile</label>
                                    <asp:TextBox ID="linkedin" runat="server" CssClass="form-control" placeholder="Enter LinkedIn Profile"></asp:TextBox>
                                </div>
                            </div>
                                <div class="col-md-4">
                                <div class="mb-3">
                                     <label class="form-label required-label">GitHub Profile</label>
                                    <asp:TextBox ID="github" runat="server" CssClass="form-control" placeholder="Enter GitHub Profile"></asp:TextBox>
                                </div>
                            </div>
                                    <div class="col-md-4">
                                <div class="mb-3">
                                     <label class="form-label">Portfolio Link</label>
                                    <asp:TextBox ID="portfolio" runat="server" CssClass="form-control" placeholder="Enter GitHub Profile"></asp:TextBox>
                                </div>
                            </div>
                                </div>
                            
                        </div>
                    </div>
                  <h6 class="mb-4 bg-primary p-2 text-white rounded-2">Acadmic Details</h6>
                    <!-- Additional Fields -->
                <div class="row">

                <div class="col-12">
                    <div class="row">

                        <div class="col-md-4">
                            <div class="mb-3">
                                <label class="form-label required-label">Student Id Number</label>
                                <asp:TextBox ID="enrollment_number" runat="server" CssClass="form-control" placeholder="Charusat Id Number"></asp:TextBox>
                            </div>
                            </div>
                        <div class="col-md-4">
                            <div class="mb-3">
    <label class="form-label required-label">College Name</label>
                                <asp:DropDownList ID="college_name" runat="server" CssClass="form-select mb-3"></asp:DropDownList>
                                
                            </div>
                            </div>
                         <div class="col-md-4">
                            <div class="mb-3">
    <label class="form-label required-label">Branch Name</label>
                                <asp:DropDownList ID="branch_name" runat="server" CssClass="form-select mb-3"></asp:DropDownList>
                                
                            </div>
                            </div>
                            <div class="col-md-4">
                            <div class="mb-3">
    <label class="form-label required-label">Degree Name</label>
                                <asp:DropDownList ID="degree" runat="server" CssClass="form-select mb-3"></asp:DropDownList>
                                
                            </div>
                            </div>
                         <div class="col-md-4">
                            <div class="mb-3">
    <label class="form-label required-label">Year Of Graduation</label>
                                <asp:DropDownList ID="graduation" runat="server" CssClass="form-select mb-3"></asp:DropDownList>
                                
                            </div>
                            </div>
                         <div class="col-md-4">
                            <div class="mb-3">
    <label class="form-label required-label">CGPA</label>
                                <asp:TextBox ID="cgpa" runat="server" CssClass="form-control mb-3" placeholder="Cumulative Grade Point Average"></asp:TextBox>
                                
                            </div>
                            </div>
                         <div class="col-md-4">
                            <div class="mb-3">
    <label class="form-label required-label">Backlogs</label>
                                <asp:TextBox ID="backlogs" runat="server" CssClass="form-control mb-3" placeholder="Any Backlogs Of Previous Year's"></asp:TextBox>
                                
                            </div>
                            </div>
                        <div class="col-md-4">
                            <div class="mb-3">
    <label class="form-label required-label">CGPA In Percentage</label>
                                <asp:TextBox ID="cgpa_per" runat="server" CssClass="form-control mb-3" placeholder="Cumulative Grade Point Average in Percentage"></asp:TextBox>
                                
                            </div>
                            </div>
                        <div class="col-md-4">
                            <div class="mb-3">
    <label class="form-label required-label">10th Grade School Name</label>
                                <asp:TextBox ID="school_name1" runat="server" CssClass="form-control mb-3" placeholder="Name Of The School In 10th Grade"></asp:TextBox>
                                
                            </div>
                            </div>
                        <div class="col-md-4">
                            <div class="mb-3">
    <label class="form-label required-label">10th Grade Board</label>
                                <asp:TextBox ID="school_board1" runat="server" CssClass="form-control mb-3" placeholder="CBSE, ICSE, State Board, etc"></asp:TextBox>
                                
                            </div>
                            </div>
                        <div class="col-md-4">
                            <div class="mb-3">
    <label class="form-label required-label">10th Grade Percentage</label>
                                <asp:TextBox ID="school_percentage1" runat="server" CssClass="form-control mb-3" placeholder="Percentage Obtain In 10th"></asp:TextBox>
                                
                            </div>
                            </div>
                        <!-- Selection between 12th Grade or Diploma -->
<div class="col-md-4">
    <div class="mb-3">
        <label class="form-label required-label">Post-10th Education</label>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="post10thEducation" id="option12th" value="12th" onclick="toggleEducationInputs()">
            <label class="form-check-label" for="option12th">12th</label>
        </div>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="post10thEducation" id="optionDiploma" value="Diploma" onclick="toggleEducationInputs()">
            <label class="form-check-label" for="optionDiploma">Diploma</label>
        </div>
    </div>
</div>

<!-- 12th Grade Percentage Field (hidden by default) -->
<div class="col-md-4" id="12thGradePercentageDiv" style="display: none;">
    <div class="mb-3">
        <label class="form-label required-label">12th Grade Percentage</label>
        <asp:TextBox ID="percentage_12th" runat="server" CssClass="form-control mb-3" placeholder="Percentage Obtained in 12th Grade"></asp:TextBox>
    </div>
</div>

<!-- Diploma CGPA in Percentage Field (hidden by default) -->
<div class="col-md-4" id="diplomaCGPADiv" style="display: none;">
    <div class="mb-3">
        <label class="form-label required-label">Diploma CGPA in Percentage</label>
        <asp:TextBox ID="diploma_cgpa_percentage" runat="server" CssClass="form-control mb-3" placeholder="Diploma CGPA in Percentage"></asp:TextBox>
    </div>
</div>
                </div>
                </div>
                </div>
                
                  <h6 class="mb-4 bg-primary p-2 text-white rounded-2">Skills</h6>
                <div class="row">
                    <div class="col-12">
                        <div class="row">
                            <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label required-label">Skills</label>
                                <asp:TextBox ID="skill" runat="server" CssClass="tagify-skills" placeholder="HTML, CSS, JAVA..."></asp:TextBox>
                            </div>
                            </div>
                            <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label required-label">Soft Skills</label>
                                <asp:TextBox ID="soft_skill" runat="server" CssClass="tagify-skills1" placeholder="Leadership, Listner"></asp:TextBox>
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                  <h6 class="mb-4 bg-primary p-2 text-white rounded-2">Certification's</h6>
                <div class="row">
    <div class="col-12">
        <div class="row">

        <div class="mb-3">
            <label class="form-label required-label">Certifications</label>
            <div id="certificationsContainer">
                <!-- Initial Certification Input -->
                <div class="row mb-2 certification-entry">
                    <div class="col-md-5">
                        <asp:TextBox ID="certificationName" runat="server" CssClass="form-control mb-3" placeholder="Certification Name"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <asp:TextBox ID="issuingAuthority" runat="server" CssClass="form-control mb-3" placeholder="Issuing Authority"></asp:TextBox>
                    </div>
                    <div class="col-md-3">
                        <input type="date" class="form-control mb-3" placeholder="Date" />
                    </div>
                    <div class="col-md-5">
                        <asp:FileUpload ID="certificateFileUpload_0" runat="server" CssClass="form-control" />
                
                    </div>
                </div>
            </div>
            <!-- Add Certification Button -->
            <button type="button" class="btn btn-outline-primary btn-sm mt-2" onclick="addCertification()">Add Certification</button>
        </div>
        </div>
    </div>
</div>
                <h6 class="mb-4 bg-primary p-2 text-white rounded-2">Projects</h6>
<div class="row">
    <div class="col-12">
        <div class="row">
            <div class="mb-3">
                <label class="form-label required-label">Projects</label>
                <div id="projectsContainer">
                    <!-- Initial Project Input -->
                    <div class="row mb-2 project-entry">
                        <div class="col-md-5">
                            <asp:TextBox ID="projectTitle" runat="server" CssClass="form-control mb-3" placeholder="Title of Project"></asp:TextBox>
                        </div>
                        <div class="col-md-7">
                            <asp:TextBox ID="projectDescription" runat="server" CssClass="form-control mb-3" TextMode="MultiLine" Rows="1" placeholder="Description"></asp:TextBox>
                        </div>
                        <div class="col-md-4">
                            <asp:TextBox ID="technologiesUsed" runat="server" CssClass="form-control mb-3" placeholder="Technologies/Tools Used"></asp:TextBox>
                        </div>
                        <div class="col-md-4">
                            <asp:TextBox ID="projectRole" runat="server" CssClass="form-control mb-3" placeholder="Role (Lead, Contributor, etc.)"></asp:TextBox>
                        </div>
                        <div class="col-md-4">
                            <asp:TextBox ID="projectLink" runat="server" CssClass="form-control mb-3" placeholder="Link to GitHub/Project Demo"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <!-- Add Project Button -->
                <div class="d-flex align-items-start mb-3">
                    <div class="col-md-3">
                        <button type="button" class="btn btn-primary btn-sm mt-2 w-100" onclick="addProject()">Add Project</button>
                    </div>
                    <!-- ListBox for showing added project titles -->
                 
                </div>
            </div>
        </div>
    </div>
</div>
                <h6 class="mb-4 bg-primary p-2 text-white rounded-2">Internships</h6>
<div class="row">
    <div class="col-12">
        <div class="row">
            <div class="mb-3">
                <label class="form-label required-label">Internships</label>
                <div id="internshipsContainer">
                    <!-- Initial Internship Input -->
                    <div class="row mb-2 internship-entry">
                        <div class="col-md-6">
                            <asp:TextBox ID="companyName" runat="server" CssClass="form-control mb-3" placeholder="Company Name"></asp:TextBox>
                        </div>
                        <div class="col-md-3">
                            <input type="date" class="form-control mb-3" id="startDate" placeholder="Start Date" />
                        </div>
                        <div class="col-md-3">
                            <input type="date" class="form-control mb-3" id="endDate" placeholder="End Date" />
                        </div>
                        <div class="col-md-6">
                            <asp:TextBox ID="position" runat="server" CssClass="form-control mb-3" placeholder="Role/Position"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <asp:TextBox ID="responsibilities" runat="server" CssClass="form-control mb-3" TextMode="MultiLine" Rows="1" placeholder="Responsibilities"></asp:TextBox>
                        </div>
                        <div class="col-md-12">
                            <asp:TextBox ID="achievements" runat="server" CssClass="form-control mb-3" TextMode="MultiLine" Rows="3" placeholder="Key Achievements/Contributions"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <!-- Add Internship Button -->
                <div class="d-flex align-items-start mb-3">
                    <div class="col-md-3">
                        <button type="button" class="btn btn-outline-primary btn-sm mt-2 w-100" onclick="addInternship()">Add Internship</button>
                    </div>
                    <!-- ListBox for showing added internships -->
                
                </div>
            </div>
        </div>
    </div>
</div>
                <h6 class="mb-4 bg-primary p-2 text-white rounded-2">Extracurricular Activities</h6>
<div class="row">
    <div class="col-12">
        <div class="row mb-3">
            <div class="col-md-6">
                <asp:TextBox ID="leadershipPositions" runat="server" CssClass="form-control mb-3" placeholder="Leadership Positions (e.g., Head of Tech Fest)"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <asp:TextBox ID="eventsParticipated" runat="server" CssClass="form-control mb-3" placeholder="Events/Competitions Participated in (e.g., Hackathons, Debates)"></asp:TextBox>
            </div>
            <div class="col-md-12">
                <asp:TextBox ID="volunteeringExperience" runat="server" CssClass="form-control mb-3" TextMode="MultiLine" Rows="3" placeholder="Volunteering Experience"></asp:TextBox>
            </div>
        </div>
    </div>
</div>
<h6 class="mb-4 bg-primary p-2 text-white rounded-2">Achievements & Awards</h6>
<div class="row">
    <div class="col-12">
        <div class="row mb-3">
            <div class="col-md-6">
                <asp:TextBox ID="academicAwards" runat="server" CssClass="form-control mb-3" placeholder="Academic Awards (e.g., Dean’s List, Topper)"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <asp:TextBox ID="nonAcademicAwards" runat="server" CssClass="form-control mb-3" placeholder="Non-Academic Awards (e.g., Sports, Cultural)"></asp:TextBox>
            </div>
            <div class="col-md-12">
                <asp:TextBox ID="publications" runat="server" CssClass="form-control mb-3" TextMode="MultiLine" Rows="3" placeholder="Publications/Research Papers (if any)"></asp:TextBox>
            </div>
        </div>
    </div>
</div>
<h6 class="mb-4 bg-primary p-2 text-white rounded-2">Placement Preferences</h6>
<div class="row">
    <div class="col-12">
        <div class="row mb-3">
            <div class="col-md-6">
                <asp:TextBox ID="preferredJobRole" runat="server" CssClass="form-control mb-3" placeholder="Preferred Job Role (e.g., Software Developer)"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <asp:TextBox ID="preferredLocation" runat="server" CssClass="form-control mb-3" placeholder="Preferred Location (City, State, Country)"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <asp:TextBox ID="preferredIndustry" runat="server" CssClass="form-control mb-3" placeholder="Preferred Industry (e.g., Software, Manufacturing)"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <select id="willingToRelocate" runat="server" CssClass="form-control mb-3">
                    <option value="" disabled selected>Willing to Relocate</option>
                    <option value="Yes">Yes</option>
                    <option value="No">No</option>
                </select>
            </div>
            <div class="col-md-12">
                <asp:TextBox ID="expectedSalary" runat="server" CssClass="form-control mb-3" placeholder="Expected Salary (optional)"></asp:TextBox>
            </div>
        </div>
    </div>
</div>
<h6 class="mb-4 bg-primary p-2 text-white rounded-2">References</h6>
<div class="row">
    <div class="col-12">
        <div class="row mb-3">
            <div class="col-md-12">
                <asp:TextBox ID="referenceContactDetails" runat="server" CssClass="form-control mb-3" TextMode="MultiLine" Rows="3" placeholder="Reference Contact Details (optional)"></asp:TextBox>
            </div>
        </div>
    </div>
</div>


            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<%--    <script>
        function addProject() {
    // Get the project title
    const projectTitle = document.getElementById('<%= projectTitle.ClientID %>').value;

    // Ensure the project title is not empty
    if (projectTitle) {
        // Add the project title to the ListBox
        const newOption = document.createElement("option");
        newOption.text = projectTitle;
        listBox.add(newOption);

        // Clear the input fields for next entry
        document.getElementById('<%= projectTitle.ClientID %>').value = '';
        document.getElementById('<%= projectDescription.ClientID %>').value = '';
        document.getElementById('<%= technologiesUsed.ClientID %>').value = '';
        document.getElementById('<%= projectRole.ClientID %>').value = '';
        document.getElementById('<%= projectLink.ClientID %>').value = '';
    } else {
        alert("Please enter the project title.");
    }
}

    </script>
<script>
    function addCertification() {
        // Get the container for certifications
        var container = document.getElementById("certificationsContainer");
        
        // Clone the first entry (template) and clear its inputs
        var newEntry = container.children[0].cloneNode(true);
        var inputs = newEntry.querySelectorAll("input, asp:TextBox");
        inputs.forEach(input => input.value = ""); // Clear values

        // Append the new entry to the container
        container.appendChild(newEntry);
    }
</script>--%>
<script>
    function toggleEducationInputs() {
        // Get references to the 12th grade and diploma sections
        const grade12Div = document.getElementById('12thGradePercentageDiv');
        const diplomaDiv = document.getElementById('diplomaCGPADiv');
        
        // Get the selected radio button value
        const educationOption = document.querySelector('input[name="post10thEducation"]:checked').value;
        
        // Toggle visibility based on the selected option
        if (educationOption === "12th") {
            grade12Div.style.display = "block";
            diplomaDiv.style.display = "none";
        } else if (educationOption === "Diploma") {
            grade12Div.style.display = "none";
            diplomaDiv.style.display = "block";
        }
    }
</script>
    <!-- JavaScript to Handle File Input and Preview -->
    <script>
        function showImagePreview(event) {
            const file = event.target.files[0];
            const preview = document.getElementById('imgPreview');
            
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    preview.src = e.target.result; // Set image preview source to the uploaded file
                };
                reader.readAsDataURL(file);
            }
        }

        function clearImagePreview() {
            const preview = document.getElementById('imgPreview');
            const fileInput = document.getElementById('fileInput');
            preview.src = "/api/placeholder/150/200"; // Reset to placeholder image
            fileInput.value = ""; // Clear the file input value
        }
    </script>
    <script>
    document.addEventListener("DOMContentLoaded", function () {
        // Select the input field for skills
        var input = document.querySelector('.tagify-skills');
        
        // Initialize Tagify on the input element
        new Tagify(input, {
            delimiters: ", ", // Separate tags by comma and space
            maxTags: 100, // Limit to 100 tags
            dropdown: {
                enabled: 0 // Always show dropdown on focus
            }
        });
    });
</script>
    <script>
    document.addEventListener("DOMContentLoaded", function () {
        // Select the input field for skills
        var input = document.querySelector('.tagify-skills1');
        
        // Initialize Tagify on the input element
        new Tagify(input, {
            delimiters: ", ", // Separate tags by comma and space
            maxTags: 100, // Limit to 100 tags
            dropdown: {
                enabled: 0 // Always show dropdown on focus
            }
        });
    });
</script>

</asp:Content>
