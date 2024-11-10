<%@ Page Title="" Language="VB" MasterPageFile="~/website.master" AutoEventWireup="false" CodeFile="Student_Details.aspx.vb" Inherits="Student_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        /* Styling for the full form container */
        .form-container {
            display: grid;
            grid-template-columns: 1fr 1fr;
            grid-gap: 20px;
            padding: 20px;
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
            background-color: #f9f9f9; /* Light grey background */
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        /* Style for section headers (h2) */
        .form-container h2 {
            grid-column: span 2;
            font-size: 1.5rem;
            margin-bottom: 20px;
            border-bottom: 2px solid #ccc;
            padding-bottom: 10px;
            background-color: #007bff; /* Blue background */
            color: white;
            padding: 10px;
            border-radius: 5px;
        }

        /* Style for form groups */
        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group label {
            margin-bottom: 5px;
            font-weight: bold;
        }

        .form-group input, .form-group select, .form-group textarea {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 1rem;
            width: 100%;
        }

        .form-group textarea {
            resize: vertical;
        }

        /* Required field asterisk */
        .required-label::after {
            content: " *";
            color: red;
            font-weight: bold;
        }

        /* Full-width fields */
        .form-full {
            grid-column: span 2;
        }
    </style>
     <!-- Tagify CSS & JS CDN -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/tagify/4.9.5/tagify.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tagify/4.9.5/tagify.min.js"></script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
        <div class="form-container">

            <!-- Personal Details Section -->
            <h2>Personal Details</h2>

            <div class="form-group">
                <label for="txtstudentid" class="required-label">Student ID</label>
                <asp:TextBox ID="txtStudentId" runat="server" />
            </div>

            <div class="form-group">
                <label for="txtFullName" class="required-label">Full Name</label>
                <asp:TextBox ID="txtFullName" runat="server" />
            </div>

            <div class="form-group">
                <label for="dateDOB" class="required-label">Date of Birth</label>
                <%--<asp:TextBox ID="dateDOB" runat="server" TextMode="Date" />--%>
            </div>

            <div class="form-group">
                <label for="ddlGender" class="required-label">Gender</label>
                <asp:DropDownList ID="ddlGender" runat="server">
                    <asp:ListItem Text="Select" Value="" />
                    <asp:ListItem Text="Male" Value="Male" />
                    <asp:ListItem Text="Female" Value="Female" />
                    <asp:ListItem Text="Other" Value="Other" />
                </asp:DropDownList>
            </div>

            <div class="form-group">
                <label for="txtContactNumber" class="required-label">Contact Number</label>
                <asp:TextBox ID="txtContactNumber" runat="server" />
            </div>

            <div class="form-group">
                <label for="txtEmailAddress" class="required-label">Email Address</label>
                <asp:TextBox ID="txtEmailAddress" runat="server" />
            </div>

            <div class="form-group form-full">
                <label for="txtPermanentAddress" class="required-label">Permanent Address</label>
                <asp:TextBox ID="txtPermanentAddress" runat="server" TextMode="MultiLine" Rows="3" />
            </div>

            <div class="form-group form-full">
                <label for="txtCurrentAddress">Current Address</label>
                <asp:TextBox ID="txtCurrentAddress" runat="server" TextMode="MultiLine" Rows="3" />
            </div>

            <div class="form-group">
                <label for="txtNationality" class="required-label">Nationality</label>
                <asp:TextBox ID="txtNationality" runat="server" />
            </div>

            <!-- Educational Qualifications Section -->
            <h2>Educational Qualifications</h2>

            <div class="form-group">
                <label for="txtInstituteName" class="required-label">University/Institute Name</label>
                <asp:TextBox ID="txtInstituteName" runat="server" />
            </div>

            <div class="form-group">
                <label for="ddlDegree" class="required-label">Degree</label>
                <asp:DropDownList ID="ddlDegree" runat="server">
                    <asp:ListItem Text="Select" Value="" />
                    <asp:ListItem Text="B.Tech" Value="B.Tech" />
                    <asp:ListItem Text="MBA" Value="MBA" />
                    <asp:ListItem Text="B.Sc" Value="B.Sc" />
                </asp:DropDownList>
            </div>

            <div class="form-group">
                <label for="ddlSpecialization" class="required-label">Specialization/Branch</label>
                <asp:DropDownList ID="ddlSpecialization" runat="server">
                    <asp:ListItem Text="Select" Value="" />
                    <asp:ListItem Text="Computer Science" Value="Computer Science" />
                    <asp:ListItem Text="Electrical Engineering" Value="Electrical Engineering" />
                </asp:DropDownList>
            </div>

            <div class="form-group">
                <label for="ddlYearOfPassing" class="required-label">Year of Passing</label>
                <asp:DropDownList ID="ddlYearOfPassing" runat="server">
                    <asp:ListItem Text="Select" Value="" />
                    <asp:ListItem Text="2024" Value="2024" />
                    <asp:ListItem Text="2023" Value="2023" />
                </asp:DropDownList>
            </div>

            <div class="form-group">
                <label for="txtCGPA" class="required-label">CGPA/Percentage</label>
                <asp:TextBox ID="txtCGPA" runat="server" />
            </div>

            <div class="form-group form-full">
                <label for="txtCertifications">Certifications</label>
                <asp:TextBox ID="txtCertifications" runat="server" TextMode="MultiLine" Rows="2" />
            </div>

             <!-- Skills Section -->
        <h2>Skills</h2>
        <div class="form-group form-full">
            <label for="txtTechnicalSkills" class="required-label">Technical Skills</label>
            <!-- Text area for technical skills that will be converted into Tagify input -->
            <asp:TextBox ID="txtTechnicalSkills" runat="server" TextMode="MultiLine" Rows="3" CssClass="tagify-skills" />
        </div>

        <!-- Soft Skills -->
        <div class="form-group form-full">
            <label for="txtSoftSkills">Soft Skills</label>
            <asp:TextBox ID="txtSoftSkills" runat="server" TextMode="MultiLine" Rows="3" CssClass="tagify-skills"/>
        </div>

            <!-- Projects Section -->
            <h2>Projects</h2>

            <div class="form-group">
                <label for="txtProjectTitle" class="required-label">Project Title</label>
                <asp:TextBox ID="txtProjectTitle" runat="server" />
            </div>

            <div class="form-group form-full">
                <label for="txtProjectDescription" class="required-label">Project Description</label>
                <asp:TextBox ID="txtProjectDescription" runat="server" TextMode="MultiLine" Rows="3" />
            </div>

            <div class="form-group form-full">
                <label for="txtTechnologiesUsed">Technologies Used</label>
                <asp:TextBox ID="txtTechnologiesUsed" runat="server" TextMode="MultiLine" Rows="2" />
            </div>

            <div class="form-group">
                <label for="txtProjectRole" class="required-label">Role in Project</label>
                <asp:TextBox ID="txtProjectRole" runat="server" />
            </div>

            <div class="form-group form-full">
                <label for="txtGitHubURL">GitHub/Project Demo URL</label>
                <asp:TextBox ID="txtGitHubURL" runat="server" />
            </div>

            <!-- Company Experience Section -->
            <h2>Company Experience</h2>

            <div class="form-group">
                <label for="txtCompanyName" class="required-label">Company Name</label>
                <asp:TextBox ID="txtCompanyName" runat="server" />
            </div>

            <div class="form-group">
                <label for="txtJobRole" class="required-label">Job Role</label>
                <asp:TextBox ID="txtJobRole" runat="server" />
            </div>

            <div class="form-group">
                <label for="txtDuration" class="required-label">Duration</label>
                <asp:TextBox ID="txtDuration" runat="server" />
            </div>

            <div class="form-group form-full">
                <label for="txtExperienceDescription" class="required-label">Experience Description</label>
                <asp:TextBox ID="txtExperienceDescription" runat="server" TextMode="MultiLine" Rows="3" />
            </div>

            <!-- LinkedIn Profile Section -->
            <h2>LinkedIn Profile</h2>

            <div class="form-group form-full">
                <label for="txtLinkedInURL" class="required-label">LinkedIn Profile URL</label>
                <asp:TextBox ID="txtLinkedInURL" runat="server" />
            </div>

            <!-- Resume and Photo Upload Section -->
            <h2>Resume & Photo Upload</h2>

            <div class="form-group form-full">
                <label for="fileResume" class="required-label">Resume Upload</label>
                <asp:FileUpload ID="fileResume" runat="server" />
            </div>

            <div class="form-group form-full">
                <label for="filePhoto" class="required-label">Passport-size Photo Upload</label>
                <asp:FileUpload ID="filePhoto" runat="server" />
            </div>

        </div>

        <!-- Submit Button -->
        <div style="text-align: center; margin-top: 20px;">
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" />
        </div>
      <!-- Initialize Tagify for Technical Skills TextBox -->
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            // Initialize Tagify on the ASP.NET TextBox rendered as a textarea
            var input = document.querySelector('.tagify-skills');
            new Tagify(input, {
                // Additional options (optional)
                delimiters: ", ", // Tags separated by comma and space
                maxTags:100, // Limit to 100 tags
                dropdown: {
                    enabled: 0 // Always show dropdown on focus
                }
            });
        });
    </script>
</asp:Content>




