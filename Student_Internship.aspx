<%@ Page Title="" Language="VB" MasterPageFile="~/website.master" AutoEventWireup="false" CodeFile="Student_Internship.aspx.vb" Inherits="Student_Internship" %>

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
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <div class="container">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
             <Triggers>
            <asp:PostBackTrigger ControlID="submit" />
        </Triggers>
            <ContentTemplate>
                <asp:Label ID="student_id" runat="server" Text="Label" Visible="false"></asp:Label>
                <asp:HiddenField ID="intern_no" runat="server" />

                <!-- Certification Form -->
                <div class="card">
                   <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
    <h4 class="card-title text-white mb-0">Internship Master</h4>
    <asp:LinkButton ID="back" runat="server" PostBackUrl="~/Student_Details.aspx" CssClass="btn btn-light btn-sm">Back To Profile</asp:LinkButton>
</div>

                    <div class="card-body">
                        <div class="form-group">
                            <label for="certificate_name">Company Name</label>
                            <asp:TextBox ID="company_name" runat="server" class="form-control" placeholder="Enter Company Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Valid Name" ControlToValidate="company_name" Display="Dynamic" ValidationGroup="admin"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="certificate_description">Role/Posistion</label>
                            <asp:TextBox ID="role" runat="server" class="form-control" placeholder="Enter Your Role In Company"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Valid role" ControlToValidate="role" Display="Dynamic" ValidationGroup="admin"></asp:RequiredFieldValidator>
                        </div>
                        
                        <div class="form-group">
                            <label for="certificate_description">Duration</label>
                            <asp:TextBox ID="duration" runat="server" class="form-control" placeholder="Enter Proper Duration"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Valid Duration" ControlToValidate="duration" Display="Dynamic" ValidationGroup="admin"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="certificate_description">Location</label>
                            <asp:TextBox ID="location" runat="server" class="form-control" placeholder="Enter Company Location"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Valid Location" ControlToValidate="location" Display="Dynamic" ValidationGroup="admin"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="certificate_description">Industry</label>
                            <asp:TextBox ID="industry" runat="server" class="form-control" placeholder="IT/SOFTWARE"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Valid Industry" ControlToValidate="industry" Display="Dynamic" ValidationGroup="admin"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="certificate_description">Technology Stack</label>
                            <asp:TextBox ID="technology_stack" runat="server" class="tagify-skills" placeholder="HTML, CSS, JS... Enter Tab After Add"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Enter Valid Language" ControlToValidate="technology_stack" Display="Dynamic" ValidationGroup="admin"></asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group">
                            <label for="certificate_description">Responsibility</label>
                            <asp:TextBox ID="respon" runat="server" class="form-control" placeholder="Responsibility"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Enter Valid Thing" ControlToValidate="respon" Display="Dynamic" ValidationGroup="admin"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="certificate_description">SuperVisor Name</label>
                            <asp:TextBox ID="sp_name" runat="server" class="form-control" placeholder="Enter SuperVisor Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Enter Valid Name" ControlToValidate="sp_name" Display="Dynamic" ValidationGroup="admin"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="certificate_description">Paid Or UnPaid</label>
                            <asp:TextBox ID="p_up" runat="server" class="form-control" placeholder="Paid Or UnPaid"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Enter Valid Reason" ControlToValidate="p_up" Display="Dynamic" ValidationGroup="admin"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="certificate_description">Time</label>
                            <asp:TextBox ID="time" runat="server" class="form-control" placeholder="Work For How Many Hour"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Enter Valid Time" ControlToValidate="time" Display="Dynamic" ValidationGroup="admin"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="certificate_description">Remote Or Site</label>
                            <asp:TextBox ID="r_s" runat="server" class="form-control" placeholder="Remote Or On site"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Enter Valid Thing" ControlToValidate="r_s" Display="Dynamic" ValidationGroup="admin"></asp:RequiredFieldValidator>
                        </div>
                        </div>
                    <div class="card-footer">
                        <asp:Button ID="submit" runat="server" Text="Submit" CssClass="btn btn-primary" ValidationGroup="admin" />
                        <asp:Button ID="resetForm" runat="server" Text="Reset" CssClass="btn btn-secondary" OnClientClick="clearForm(); return false;" />
                    </div>
                </div>

                <!-- Data Table -->
                <div class="card mt-4">
                    <div class="card-header">
                        <h3 class="card-title">List Of All Internship</h3>
                    </div>
                    <div class="card-body">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="intern_id" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="intern_id" HeaderText="intern_id" ReadOnly="True" InsertVisible="False" SortExpression="intern_id"></asp:BoundField>
                                <asp:BoundField DataField="company_name" HeaderText="company_name" SortExpression="company_name"></asp:BoundField>
                                <asp:BoundField DataField="role" HeaderText="role" SortExpression="role"></asp:BoundField>
                                <asp:BoundField DataField="duration" HeaderText="duration" SortExpression="duration"></asp:BoundField>
                                <asp:BoundField DataField="location" HeaderText="location" SortExpression="location"></asp:BoundField>
                                <asp:BoundField DataField="industry" HeaderText="industry" SortExpression="industry"></asp:BoundField>
                                <asp:BoundField DataField="skill_gain" HeaderText="skill_gain" SortExpression="skill_gain"></asp:BoundField>
                                <asp:BoundField DataField="responsibility" HeaderText="responsibility" SortExpression="responsibility"></asp:BoundField>
                                <asp:BoundField DataField="Supervisor_name" HeaderText="Supervisor_name" SortExpression="Supervisor_name"></asp:BoundField>
                                <asp:BoundField DataField="paid_unpaid" HeaderText="paid_unpaid" SortExpression="paid_unpaid"></asp:BoundField>
                                <asp:BoundField DataField="time" HeaderText="time" SortExpression="time"></asp:BoundField>
                                <asp:BoundField DataField="remote_site" HeaderText="remote_site" SortExpression="remote_site"></asp:BoundField>
                                <asp:BoundField DataField="sr_id" HeaderText="sr_id" SortExpression="sr_id"></asp:BoundField>
                            </Columns>
                        </asp:GridView>

                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Charusat_ProjectConnectionString %>' DeleteCommand="DELETE FROM [Student_internship] WHERE [intern_id] = @intern_id" InsertCommand="INSERT INTO [Student_internship] ([company_name], [role], [duration], [location], [industry], [skill_gain], [responsibility], [Supervisor_name], [paid_unpaid], [time], [remote_site], [sr_id]) VALUES (@company_name, @role, @duration, @location, @industry, @skill_gain, @responsibility, @Supervisor_name, @paid_unpaid, @time, @remote_site, @sr_id)" SelectCommand="SELECT * FROM [Student_internship] WHERE ([sr_id] = @sr_id)" UpdateCommand="UPDATE [Student_internship] SET [company_name] = @company_name, [role] = @role, [duration] = @duration, [location] = @location, [industry] = @industry, [skill_gain] = @skill_gain, [responsibility] = @responsibility, [Supervisor_name] = @Supervisor_name, [paid_unpaid] = @paid_unpaid, [time] = @time, [remote_site] = @remote_site, [sr_id] = @sr_id WHERE [intern_id] = @intern_id">
                            <DeleteParameters>
                                <asp:Parameter Name="intern_id" Type="Int32"></asp:Parameter>
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="company_name" Type="String"></asp:Parameter>
                                <asp:Parameter Name="role" Type="String"></asp:Parameter>
                                <asp:Parameter Name="duration" Type="String"></asp:Parameter>
                                <asp:Parameter Name="location" Type="String"></asp:Parameter>
                                <asp:Parameter Name="industry" Type="String"></asp:Parameter>
                                <asp:Parameter Name="skill_gain" Type="String"></asp:Parameter>
                                <asp:Parameter Name="responsibility" Type="String"></asp:Parameter>
                                <asp:Parameter Name="Supervisor_name" Type="String"></asp:Parameter>
                                <asp:Parameter Name="paid_unpaid" Type="String"></asp:Parameter>
                                <asp:Parameter Name="time" Type="String"></asp:Parameter>
                                <asp:Parameter Name="remote_site" Type="String"></asp:Parameter>
                                <asp:Parameter Name="sr_id" Type="Int32"></asp:Parameter>
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="student_id" PropertyName="Text" DefaultValue="0" Name="sr_id" Type="Int32"></asp:ControlParameter>
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="company_name" Type="String"></asp:Parameter>
                                <asp:Parameter Name="role" Type="String"></asp:Parameter>
                                <asp:Parameter Name="duration" Type="String"></asp:Parameter>
                                <asp:Parameter Name="location" Type="String"></asp:Parameter>
                                <asp:Parameter Name="industry" Type="String"></asp:Parameter>
                                <asp:Parameter Name="skill_gain" Type="String"></asp:Parameter>
                                <asp:Parameter Name="responsibility" Type="String"></asp:Parameter>
                                <asp:Parameter Name="Supervisor_name" Type="String"></asp:Parameter>
                                <asp:Parameter Name="paid_unpaid" Type="String"></asp:Parameter>
                                <asp:Parameter Name="time" Type="String"></asp:Parameter>
                                <asp:Parameter Name="remote_site" Type="String"></asp:Parameter>
                                <asp:Parameter Name="sr_id" Type="Int32"></asp:Parameter>
                                <asp:Parameter Name="intern_id" Type="Int32"></asp:Parameter>
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>

                
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
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

