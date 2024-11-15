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
    <asp:Label ID="student_id" runat="server" Text="" Visible="false"></asp:Label>
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
            <asp:LinkButton ID="certificte" runat="server" class="btn-info btn-sm rounded mt-2" PostBackUrl="~/Student_Certificate.aspx">Add Certification</asp:LinkButton>
        </div>
                <asp:GridView ID="example1" runat="server" AutoGenerateColumns="False" DataKeyNames="certificate_id" CssClass="table table-bordered table-striped table-responsive" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="certificate_id" HeaderText="certificate_id" ReadOnly="True" InsertVisible="False" SortExpression="certificate_id" Visible="false"></asp:BoundField>
                        <asp:BoundField DataField="certificate_name" HeaderText="Certificate Name" SortExpression="certificate_name"></asp:BoundField>
                        <asp:BoundField DataField="certificate_description" HeaderText="Certificate Description" SortExpression="certificate_description"></asp:BoundField>
                        <asp:BoundField DataField="cp_name" HeaderText="cp_name" SortExpression="cp_name" Visible="false"></asp:BoundField>
                        <asp:BoundField DataField="sr_id" HeaderText="sr_id" SortExpression="sr_id" Visible="false"></asp:BoundField>
                        <asp:TemplateField HeaderText="Actions">
            <ItemTemplate>
                <asp:ImageButton ID="Edit1" runat="server" CommandName="Edit" 
                    ImageUrl="~/Admin/img/pen.png" Width="35px" Height="35px" 
                    ToolTip="Edit Certificate" PostBackUrl="~/Student_Certificate.aspx"/>
                &nbsp;&nbsp;
                <asp:ImageButton ID="Delete1" runat="server" CommandName="Delete" 
                    ImageUrl="~/Admin/img/bin.png" Width="35px" Height="35px" 
                    ToolTip="Delete Certificate" 
                    OnClientClick="return confirm('Are you sure you want to delete this record?');" />
            </ItemTemplate>
        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Charusat_ProjectConnectionString %>' DeleteCommand="DELETE FROM [Student_Certificate] WHERE [certificate_id] = @certificate_id" InsertCommand="INSERT INTO [Student_Certificate] ([certificate_name], [certificate_description], [cp_name], [sr_id]) VALUES (@certificate_name, @certificate_description, @cp_name, @sr_id)" SelectCommand="SELECT * FROM [Student_Certificate] WHERE ([sr_id] = @sr_id) ORDER BY [certificate_name]" UpdateCommand="UPDATE [Student_Certificate] SET [certificate_name] = @certificate_name, [certificate_description] = @certificate_description, [cp_name] = @cp_name, [sr_id] = @sr_id WHERE [certificate_id] = @certificate_id">
                    <DeleteParameters>
                        <asp:Parameter Name="certificate_id" Type="Int32"></asp:Parameter>
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="certificate_name" Type="String"></asp:Parameter>
                        <asp:Parameter Name="certificate_description" Type="String"></asp:Parameter>
                        <asp:Parameter Name="cp_name" Type="String"></asp:Parameter>
                        <asp:Parameter Name="sr_id" Type="Int32"></asp:Parameter>
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter SessionField="Main_id" DefaultValue="0" Name="sr_id" Type="Int32"></asp:SessionParameter>
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="certificate_name" Type="String"></asp:Parameter>
                        <asp:Parameter Name="certificate_description" Type="String"></asp:Parameter>
                        <asp:Parameter Name="cp_name" Type="String"></asp:Parameter>
                        <asp:Parameter Name="sr_id" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="certificate_id" Type="Int32"></asp:Parameter>
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        
    </div>
</div>
                <h6 class="mb-4 bg-primary p-2 text-white rounded-2">Projects</h6>
<div class="row">
    <div class="col-12">
        <div class="row">
            <div class="mb-3">
            <asp:LinkButton ID="project" runat="server" class="btn-info btn-sm rounded mt-2" PostBackUrl="~/Student_Project.aspx">Add Project</asp:LinkButton>
                    </div>
                    <!-- ListBox for showing added project titles -->
            <asp:GridView ID="example2" runat="server" CssClass="table table-bordered table-striped table-responsive" AutoGenerateColumns="False" DataKeyNames="pro_id" DataSourceID="SqlDataSource2">
                <Columns>
                    <asp:BoundField DataField="pro_id" HeaderText="pro_id" Visible="false" ReadOnly="True" InsertVisible="False" SortExpression="pro_id"></asp:BoundField>
                    <asp:BoundField DataField="pro_name" HeaderText="Project Name" SortExpression="pro_name"></asp:BoundField>
                    <asp:BoundField DataField="pro_description" HeaderText="Project Description" SortExpression="pro_description"></asp:BoundField>
                    <asp:BoundField DataField="pro_cname" HeaderText="pro_cname" SortExpression="pro_cname" Visible="false"></asp:BoundField>
                    <asp:BoundField DataField="sr_id" HeaderText="sr_id" SortExpression="sr_id" Visible="false"></asp:BoundField>
                    <asp:BoundField DataField="tech_stack" HeaderText="Technology Used" SortExpression="tech_stack"></asp:BoundField>
                    <asp:TemplateField HeaderText="Actions">
            <ItemTemplate>
                <asp:ImageButton ID="Edit1" runat="server" CommandName="Edit" 
                    ImageUrl="~/Admin/img/pen.png" Width="35px" Height="35px" 
                    ToolTip="Edit Project" PostBackUrl="~/Student_Project.aspx"/>
                &nbsp;&nbsp;
                <asp:ImageButton ID="Delete1" runat="server" CommandName="Delete" 
                    ImageUrl="~/Admin/img/bin.png" Width="35px" Height="35px" 
                    ToolTip="Delete Certificate" 
                    OnClientClick="return confirm('Are you sure you want to delete this record?');" />
            </ItemTemplate>
        </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:Charusat_ProjectConnectionString %>' DeleteCommand="DELETE FROM [Student_Project] WHERE [pro_id] = @pro_id" InsertCommand="INSERT INTO [Student_Project] ([pro_name], [pro_description], [pro_cname], [sr_id], [tech_stack]) VALUES (@pro_name, @pro_description, @pro_cname, @sr_id, @tech_stack)" SelectCommand="SELECT * FROM [Student_Project] WHERE ([sr_id] = @sr_id) ORDER BY [pro_name]" UpdateCommand="UPDATE [Student_Project] SET [pro_name] = @pro_name, [pro_description] = @pro_description, [pro_cname] = @pro_cname, [sr_id] = @sr_id, [tech_stack] = @tech_stack WHERE [pro_id] = @pro_id">
                <DeleteParameters>
                    <asp:Parameter Name="pro_id" Type="Int32"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="pro_name" Type="String"></asp:Parameter>
                    <asp:Parameter Name="pro_description" Type="String"></asp:Parameter>
                    <asp:Parameter Name="pro_cname" Type="String"></asp:Parameter>
                    <asp:Parameter Name="sr_id" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="tech_stack" Type="String"></asp:Parameter>
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter SessionField="Main_id" DefaultValue="0" Name="sr_id" Type="Int32"></asp:SessionParameter>
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="pro_name" Type="String"></asp:Parameter>
                    <asp:Parameter Name="pro_description" Type="String"></asp:Parameter>
                    <asp:Parameter Name="pro_cname" Type="String"></asp:Parameter>
                    <asp:Parameter Name="sr_id" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="tech_stack" Type="String"></asp:Parameter>
                    <asp:Parameter Name="pro_id" Type="Int32"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</div>
                <h6 class="mb-4 bg-primary p-2 text-white rounded-2">Internships</h6>
<div class="row">
    <div class="col-12">
        <div class="row">
            <div class="mb-3">
                        <button type="button" class="btn-info btn-sm mt-2">Add Internship Experience</button>
                    </div>
                    <!-- ListBox for showing added internships -->
               
        </div>
    </div>
</div>
                <h6 class="mb-4 bg-primary p-2 text-white rounded-2">Extracurricular Activities</h6>
<div class="row">
    <div class="col-12">
        <div class="row">
             <div class="mb-3">
                        <button type="button" class="btn-info btn-sm mt-2">Add Extracurricular Activities</button>
                    </div>
        </div>
    </div>
</div>
<h6 class="mb-4 bg-primary p-2 text-white rounded-2">Achievements & Awards</h6>
<div class="row">
    <div class="col-12">
        <div class="row">
             <div class="mb-3">
                        <button type="button" class="btn-info btn-sm mt-2">Add Achievements & Awards</button>
                    </div>
        </div>
    </div>
</div>
<h6 class="mb-4 bg-primary p-2 text-white rounded-2">Placement Preferences</h6>
<div class="row">
    <div class="col-12">
        <div class="row">
             <div class="mb-3">
                        <button type="button" class="btn-info btn-sm mt-2">Add Placement Preferences</button>
                    </div>
        </div>
    </div>
</div>
<h6 class="mb-4 bg-primary p-2 text-white rounded-2">References</h6>
<div class="row">
    <div class="col-12">
         <div class="row">
             <div class="mb-3">
                        <button type="button" class="btn-info btn-sm mt-2">Add Refereneces</button>
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
