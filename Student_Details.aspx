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
            <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                <h5 class="mb-0 text-white">Profile</h5>
                <div>
                    <button class="btn btn-light btn-sm">Save</button>
                    <span class="ms-3">MODE: EDIT</span>
                </div>
            </div>
            <div class="card-body">
                <h6 class="mb-4">General Information</h6>
                
                <form>
                    <div class="row">
                        <!-- Left Column -->
                        <div class="col-md-8">
                            <div class="row mb-3">
                                <label class="col-sm-3 col-form-label required-label">Student ID</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" placeholder="Enter Your ID">
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label class="col-sm-3 col-form-label">Full Name</label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" placeholder="First Name">
                                </div>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" placeholder="Middle Name">
                                </div>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" placeholder="Last Name">
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label class="col-sm-3 col-form-label">Display Name</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" value="Full Name">
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label class="col-sm-3 col-form-label">Father's Name</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" placeholder="Enter Parent Details">
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label class="col-sm-3 col-form-label">Mother's Name</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" placeholder="Enter Parent Details">
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label class="col-sm-3 col-form-label">Birth Date</label>
                                <div class="col-sm-9">
                                    <input type="date" class="form-control" placeholder="select date">
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label class="col-sm-3 col-form-label">Gender</label>
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
                                        <label class="form-check-label">Transgender</label>
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
                    </div>

                    <!-- Additional Fields -->
                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
    <label class="form-label required-label">Skills</label>
                                <input type="text" class="tagify-skills" />
                            </div>

                            <div class="mb-3">
                                <label class="form-label">University</label>
                                <select class="form-select">
                                    <option>CHARUSAT</option>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Institute</label>
                                <select class="form-select">
                                    <option>CSPIT</option>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Program</label>
                                <select class="form-select">
                                    <option>BTECH(CE)</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Admission Caste</label>
                                <select class="form-select">
                                    <option>OPEN</option>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Religion</label>
                                <select class="form-select">
                                    <option>Hindu</option>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Mother Tongue</label>
                                <input type="text" class="form-control" value="Gujarati">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Marital Status</label>
                                <select class="form-select">
                                    <option>UNMARRIED</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
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

</asp:Content>
