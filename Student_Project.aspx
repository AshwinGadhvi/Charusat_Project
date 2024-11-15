<%@ Page Title="" Language="VB" MasterPageFile="~/website.master" AutoEventWireup="false" CodeFile="Student_Project.aspx.vb" Inherits="Student_Project" %>

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
</asp:Content><asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <div class="container">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
             <Triggers>
            <asp:PostBackTrigger ControlID="submit" />
        </Triggers>
            <ContentTemplate>
                <asp:Label ID="student_id" runat="server" Text="Label" Visible="false"></asp:Label>
                <asp:HiddenField ID="project_no" runat="server" />

                <!-- Certification Form -->
                <div class="card">
                   <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
    <h4 class="card-title text-white mb-0">Project Master</h4>
    <asp:LinkButton ID="back" runat="server" PostBackUrl="~/Student_Details.aspx" CssClass="btn btn-light btn-sm">Back To Profile</asp:LinkButton>
</div>

                    <div class="card-body">
                        <div class="form-group">
                            <label for="certificate_name">Project Name</label>
                            <asp:TextBox ID="Project_name" runat="server" class="form-control" placeholder="Enter Project Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Valid Name" ControlToValidate="Project_name" Display="Dynamic" ValidationGroup="admin"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="certificate_description">Project Description</label>
                            <asp:TextBox ID="project_description" runat="server" class="form-control" placeholder="Enter Project Description"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Valid Description" ControlToValidate="project_description" Display="Dynamic" ValidationGroup="admin"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="certificate_description">Technology Stack</label>
                            <asp:TextBox ID="technology_stack" runat="server" class="tagify-skills" placeholder="HTML, CSS, JS... Enter Tab After Add"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Valid Language" ControlToValidate="technology_stack" Display="Dynamic" ValidationGroup="admin"></asp:RequiredFieldValidator>
                        </div>
                        
                        <div class="form-group">
                            <label for="p_upload">Project Upload</label>
                            <asp:FileUpload ID="p_upload" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Upload a File" ControlToValidate="p_upload" Display="Dynamic" ValidationGroup="admin"></asp:RequiredFieldValidator>
                        </div>
                        <asp:Label ID="p_name" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="card-footer">
                        <asp:Button ID="submit" runat="server" Text="Submit" CssClass="btn btn-primary" ValidationGroup="admin" />
                        <asp:Button ID="resetForm" runat="server" Text="Reset" CssClass="btn btn-secondary" OnClientClick="clearForm(); return false;" />
                    </div>
                </div>

                <!-- Data Table -->
                <div class="card mt-4">
                    <div class="card-header">
                        <h3 class="card-title">List Of All Projects</h3>
                    </div>
                    <div class="card-body">
                        
                        <asp:GridView ID="example1" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="False" DataKeyNames="pro_id" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="pro_id" HeaderText="pro_id" ReadOnly="True" InsertVisible="False" SortExpression="pro_id"></asp:BoundField>
                                <asp:BoundField DataField="pro_name" HeaderText="pro_name" SortExpression="pro_name"></asp:BoundField>
                                <asp:BoundField DataField="pro_description" HeaderText="pro_description" SortExpression="pro_description"></asp:BoundField>
                                <asp:BoundField DataField="pro_cname" HeaderText="pro_cname" SortExpression="pro_cname"></asp:BoundField>
                                <asp:BoundField DataField="sr_id" HeaderText="sr_id" SortExpression="sr_id"></asp:BoundField>
                                <asp:BoundField DataField="tech_stack" HeaderText="tech_stack" SortExpression="tech_stack"></asp:BoundField>
                                <asp:TemplateField HeaderText="Actions">
            <ItemTemplate>
                <asp:ImageButton ID="Edit1" runat="server" CommandName="Edit" 
                    ImageUrl="~/Admin/img/icons8-edit-40.png" Width="35px" Height="35px" 
                    ToolTip="Edit Certificate" OnClick="Edit1_Click" />
                &nbsp;&nbsp;
                <asp:ImageButton ID="Delete1" runat="server" CommandName="Delete" 
                    ImageUrl="~/Admin/img/bin.png" Width="35px" Height="35px" 
                    ToolTip="Delete Certificate" 
                    OnClientClick="return confirm('Are you sure you want to delete this record?');" />
            </ItemTemplate>
        </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Charusat_ProjectConnectionString %>' DeleteCommand="DELETE FROM [Student_Project] WHERE [pro_id] = @pro_id" InsertCommand="INSERT INTO [Student_Project] ([pro_name], [pro_description], [pro_cname], [sr_id], [tech_stack]) VALUES (@pro_name, @pro_description, @pro_cname, @sr_id, @tech_stack)" SelectCommand="SELECT * FROM [Student_Project] WHERE ([sr_id] = @sr_id)" UpdateCommand="UPDATE [Student_Project] SET [pro_name] = @pro_name, [pro_description] = @pro_description, [pro_cname] = @pro_cname, [sr_id] = @sr_id, [tech_stack] = @tech_stack WHERE [pro_id] = @pro_id">
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
                                <asp:ControlParameter ControlID="student_id" PropertyName="Text" DefaultValue="0" Name="sr_id" Type="Int32"></asp:ControlParameter>
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

                <script>
                    function clearForm() {
                        document.getElementById('<%= Project_name.ClientID %>').value = '';
                        document.getElementById('<%= project_description.ClientID %>').value = '';
                        document.getElementById('<%= p_name.ClientID %>').value = '';
                        document.getElementById('<%= technology_stack.ClientID %>').value = '';
                    }
                </script>
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

