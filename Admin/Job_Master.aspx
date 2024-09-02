<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/Company.master" AutoEventWireup="false" CodeFile="Job_Master.aspx.vb" Inherits="Admin_Job_Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <!-- DataTables -->
    <link rel="stylesheet" href="plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/adminlte.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <asp:ScriptManager ID="ScriptManager1" runat="server">
        <Scripts>
        </Scripts>
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <asp:HiddenField ID="job_id" runat="server" />
            <asp:Label ID="company_id" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="job_location" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="job_industry" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="job_logo" runat="server" Text="" Visible="false"></asp:Label>
        <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1>Job Information</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="Company_Dashboard.aspx">Home</a></li>
                                <li class="breadcrumb-item active">Job Information</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </section>

        <div class="col-md-12">
                <div class="card card-primary">
                    <div class="card-header">
                        <h3 class="card-title">Job Information</h3>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="form-group col-4 d-inline-block">
                                <label for="exampleInputPassword1">Job Title</label>
                                <asp:TextBox ID="job_title" runat="server" placeholder="Enter The Job Title" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Valid Job Title" ControlToValidate="job_title" Display="none" Font-Bold="True" ValidationGroup="admin" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-4 d-inline-block">
                                <label for="exampleInputPassword1">Job Type</label>
                                <asp:DropDownList ID="job_type" runat="server" CssClass="form-control">
    <asp:ListItem Text="Full-Time" Value="Full-Time"></asp:ListItem>
    <asp:ListItem Text="Part-Time" Value="Part-Time"></asp:ListItem>
    <asp:ListItem Text="Contract" Value="Contract"></asp:ListItem>
    <asp:ListItem Text="Temporary" Value="Temporary"></asp:ListItem>
    <asp:ListItem Text="Freelance" Value="Freelance"></asp:ListItem>
    <asp:ListItem Text="Internship" Value="Internship"></asp:ListItem>
    <asp:ListItem Text="Consultancy" Value="Consultancy"></asp:ListItem>
    <asp:ListItem Text="Remote" Value="Remote"></asp:ListItem>
    <asp:ListItem Text="Shift Work" Value="Shift Work"></asp:ListItem>
    <asp:ListItem Text="Gig Work" Value="Gig Work"></asp:ListItem>
    <asp:ListItem Text="Apprenticeship" Value="Apprenticeship"></asp:ListItem>
    <asp:ListItem Text="Volunteer" Value="Volunteer"></asp:ListItem>
    <asp:ListItem Text="Agency (Industry)" Value="Agency"></asp:ListItem>
</asp:DropDownList>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Valid Job Title" ControlToValidate="job_title" Display="none" Font-Bold="True" ValidationGroup="admin" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-4 d-inline-block">
                                <label for="exampleInputPassword1">Job Package</label>
                                <asp:TextBox ID="job_package" runat="server" placeholder="Enter The Job Package In LPA" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Valid Job Package" ControlToValidate="job_package" Display="none" Font-Bold="True" ValidationGroup="admin" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-6 d-inline-block">
                                <label for="exampleInputPassword1">Job Description</label>
                                <asp:TextBox id="job_description" runat="server" placeholder="Enter The Job Description" class="form-control" TextMode="MultiLine"></asp:TextBox>
                                
                                
                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Valid Job Description" ControlToValidate="job_description" Display="none" Font-Bold="True" ValidationGroup="admin" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            </div>
                                                        <div class="form-group col-6 d-inline-block">
                                <label for="exampleInputPassword1">Job Requiremments</label><asp:TextBox id="job_requirements" runat="server" placeholder="Enter The Job Requirements" class="form-control" TextMode="MultiLine"></asp:TextBox>
                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Valid Job Requirements" ControlToValidate="job_requirements" Display="none" Font-Bold="True" ValidationGroup="admin" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        </div>
                       <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="admin" ForeColor="#FF3300" />
                    <div class="card-footer">
                        <asp:Button ID="submit" runat="server" Text="submit" CssClass="btn btn-primary" CausesValidation="true" ValidationGroup="admin" />
                        <asp:Button ID="show" runat="server" Text="Show" CssClass="btn btn-danger" PostBackUrl="~/Admin/Job_Master.aspx" />
                    </div>
                    </div>
                            </div>
        <div class="content">
                <div class="container-fluid">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Job Information</h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            
                            <asp:GridView ID="example1" runat="server" CssClass="table table-bordered table-striped table-responsive" AutoGenerateColumns="False" DataKeyNames="job_id" DataSourceID="SqlDataSource1">
                                <Columns>
                                    <asp:BoundField DataField="job_id" HeaderText="job_id" ReadOnly="True" InsertVisible="False" SortExpression="job_id"></asp:BoundField>
                                    <asp:BoundField DataField="company_id" HeaderText="company_id" SortExpression="company_id"></asp:BoundField>
                                    <asp:BoundField DataField="job_title" HeaderText="job_title" SortExpression="job_title"></asp:BoundField>
                                    <asp:BoundField DataField="job_type" HeaderText="job_type" SortExpression="job_type"></asp:BoundField>
                                    <asp:BoundField DataField="job_package" HeaderText="job_package" SortExpression="job_package"></asp:BoundField>
                                    <asp:BoundField DataField="job_location" HeaderText="job_location" SortExpression="job_location"></asp:BoundField>
                                    <asp:BoundField DataField="job_industry" HeaderText="job_industry" SortExpression="job_industry"></asp:BoundField>
                                    <asp:BoundField DataField="job_description" HeaderText="job_description" SortExpression="job_description"></asp:BoundField>
                                    <asp:BoundField DataField="job_requirements" HeaderText="job_requirements" SortExpression="job_requirements"></asp:BoundField>
                                    <asp:BoundField DataField="job_logo" HeaderText="job_logo" SortExpression="job_logo"></asp:BoundField>
                                      <asp:TemplateField HeaderText="Company Logo">

                                <ItemTemplate>
                                    <asp:Image ID="img" ImageUrl='<%# "../Admin/img/Logos/" + Eval("job_logo") %>' Width="150px" runat="server" />
                                </ItemTemplate>

                            </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Actions" ItemStyle-Width="200px">
                    <ItemTemplate>
                      <asp:ImageButton ID="Edit1" runat="server" Text="Edit" CommandName="Edit1" OnClick="Edit1_Click" CausesValidation="false" ToolTip="Edit User" ImageUrl="img/pen.png" Width="35px" Height="35px" />
                      &nbsp;&nbsp;
                      <asp:ImageButton ID="del" runat="server" CommandName="del" CausesValidation="false" OnClientClick="return message(this);" Text="Delete" CommandArgument='<%# Eval("job_id") %>' Height="35px" Width="35px" ImageUrl="img/bin.png" />
                      &nbsp;&nbsp;
                    </ItemTemplate>
                  </asp:TemplateField>
                                </Columns>
                            </asp:GridView>

                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Charusat_ProjectConnectionString %>' DeleteCommand="DELETE FROM [Job_Master] WHERE [job_id] = @job_id" InsertCommand="INSERT INTO [Job_Master] ([company_id], [job_title], [job_type], [job_package], [job_location], [job_industry], [job_description], [job_requirements], [job_logo]) VALUES (@company_id, @job_title, @job_type, @job_package, @job_location, @job_industry, @job_description, @job_requirements, @job_logo)" SelectCommand="SELECT * FROM [Job_Master] WHERE ([company_id] = @company_id)" UpdateCommand="UPDATE [Job_Master] SET [company_id] = @company_id, [job_title] = @job_title, [job_type] = @job_type, [job_package] = @job_package, [job_location] = @job_location, [job_industry] = @job_industry, [job_description] = @job_description, [job_requirements] = @job_requirements, [job_logo] = @job_logo WHERE [job_id] = @job_id">
                                <DeleteParameters>
                                    <asp:Parameter Name="job_id" Type="Int32"></asp:Parameter>
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="company_id" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="job_title" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="job_type" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="job_package" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="job_location" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="job_industry" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="job_description" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="job_requirements" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="job_logo" Type="String"></asp:Parameter>
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="company_id" PropertyName="Text" DefaultValue="0" Name="company_id" Type="Int32"></asp:ControlParameter>
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="company_id" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="job_title" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="job_type" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="job_package" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="job_location" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="job_industry" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="job_description" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="job_requirements" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="job_logo" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="job_id" Type="Int32"></asp:Parameter>
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
            </div>
    </ContentTemplate>    
    </asp:UpdatePanel>
</asp:Content>

