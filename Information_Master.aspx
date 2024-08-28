<%@ Page Title="" Language="VB" MasterPageFile="~/Company.master" AutoEventWireup="false" CodeFile="Information_Master.aspx.vb" Inherits="Information_Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- DataTables -->
    <link rel="stylesheet" href="plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/adminlte.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        <Scripts>
        </Scripts>
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:HiddenField ID="company_id" runat="server" />
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1>Company Master</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="Company_Dashboard.aspx">Home</a></li>
                                <li class="breadcrumb-item active">Company Master</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Form -->
            <div class="col-md-12">
                <div class="card card-primary">
                    <div class="card-header">
                        <h3 class="card-title">Company Master</h3>
                    </div>
                    <div class="card-body">
                        <div class="row">

                            <div class="form-group col-4 d-inline-block">
                                <label for="exampleInputEmail1">Company Name</label>
                                <asp:TextBox ID="company_name" runat="server" class="form-control" placeholder="Enter Name Of Company"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Valid Name Of company" ControlToValidate="company_name" Display="none" Font-Bold="True" ValidationGroup="admin" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-4 d-inline-block">
                                <label for="exampleInputPassword1">Company Address</label>
                                <asp:TextBox ID="company_address" runat="server" placeholder="Enter Company Address" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Valid company address" ControlToValidate="company_address" Display="none" Font-Bold="True" ValidationGroup="admin" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-4 d-inline-block">
                                <label for="exampleInputPassword1">Company City</label>
                                <asp:TextBox ID="company_city" runat="server" placeholder="Enter Company City" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Valid company city" ControlToValidate="company_city" Display="none" Font-Bold="True" ValidationGroup="admin" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-4 d-inline-block">
                                <label for="exampleInputPassword1">Company State</label>
                                <asp:TextBox ID="company_state" runat="server" placeholder="Enter Company State" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Valid company state" ControlToValidate="company_state" Display="none" Font-Bold="True" ValidationGroup="admin" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-4 d-inline-block">
                                <label for="exampleInputPassword1">Company Country</label>
                                <asp:TextBox ID="company_country" runat="server" placeholder="Enter Company Country" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Valid Company Country" ControlToValidate="company_country" Display="none" Font-Bold="True" ValidationGroup="admin" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-4 d-inline-block">
                                <label for="exampleInputPassword1">Company Zipcode</label>
                                <asp:TextBox ID="company_zipcode" runat="server" placeholder="Enter Company Zipcode" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Enter Valid Company Zipcode" ControlToValidate="company_zipcode" Display="none" Font-Bold="True" ValidationGroup="admin" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-4 d-inline-block">
                                <label for="exampleInputPassword1">Company Email</label>
                                <asp:TextBox ID="company_email" runat="server" placeholder="Enter Company Email" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Enter Valid Company Email" ControlToValidate="company_email" Display="none" Font-Bold="True" ValidationGroup="admin" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-4 d-inline-block">
                                <label for="exampleInputPassword1">Company Phone</label>
                                <asp:TextBox ID="company_phone" runat="server" placeholder="Enter Company Phone Number" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Enter Valid Company Phone Number" ControlToValidate="company_phone" Display="none" Font-Bold="True" ValidationGroup="admin" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-4 d-inline-block">
                                <label for="exampleInputPassword1">Company Website</label>
                                <asp:TextBox ID="company_website" runat="server" placeholder="Enter Company Website Link" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Enter Valid Company Website" ControlToValidate="company_website" Display="none" Font-Bold="True" ValidationGroup="admin" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-4 d-inline-block">
                                <label for="exampleInputPassword1">Company Industry</label>
                                <asp:TextBox ID="company_industry" runat="server" placeholder="Enter Company Industry" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Enter Valid Company Industry" ControlToValidate="company_industry" Display="none" Font-Bold="True" ValidationGroup="admin" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-4 d-inline-block">
                                <label for="exampleInputPassword1">Company Contact Person</label>
                                <asp:TextBox ID="cm_c_p_n" runat="server" placeholder="Enter Company Contact Person Name" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Enter Valid Contact Person Name" ControlToValidate="cm_c_p_n" Display="none" Font-Bold="True" ValidationGroup="admin" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-4 d-inline-block">
                                <label for="exampleInputPassword1">Company Contact Person Email</label>
                                <asp:TextBox ID="cm_c_p_e" runat="server" placeholder="Enter Company Contact Person Email" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Enter Valid Company Contact Person Email" ControlToValidate="cm_c_p_e" Display="none" Font-Bold="True" ValidationGroup="admin" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-4 d-inline-block">
                                <label for="exampleInputPassword1">Company Contact Person Number</label>
                                <asp:TextBox ID="cm_c_p_m" runat="server" placeholder="Enter Company Contact Person Number" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="Enter Valid Company contact person number" ControlToValidate="cm_c_p_m" Display="none" Font-Bold="True" ValidationGroup="admin" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-4 d-inline-block">
                                <label for="exampleInputPassword1">Company Description</label>
                                <asp:TextBox ID="company_description" runat="server" placeholder="Enter Company Description" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="Enter Valid Company Discription" ControlToValidate="company_description" Display="none" Font-Bold="True" ValidationGroup="admin" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="admin" ForeColor="#FF3300" />
                    <div class="card-footer">
                        <asp:Button ID="submit" runat="server" Text="submit" CssClass="btn btn-primary" CausesValidation="true" ValidationGroup="admin"/>
                    </div>
                </div>
            </div>
                        <!-- Table -->
            <div class="content">
                <div class="container-fluid">
                    <div class="card">
              <div class="card-header">
                <h3 class="card-title">Company Details</h3>
              </div>
              <!-- /.card-header -->
           <div class="card-body">
            <asp:GridView ID="example1" runat="server" AutoGenerateColumns="False" DataKeyNames="company_id" DataSourceID="SqlDataSource1" CssClass="table table-bordered table-striped table-responsive">
                <Columns>
                    <asp:BoundField DataField="company_id" HeaderText="company_id" ReadOnly="True" InsertVisible="False" SortExpression="company_id"></asp:BoundField>
                    <asp:BoundField DataField="company_name" HeaderText="company_name" SortExpression="company_name"></asp:BoundField>
                    <asp:BoundField DataField="company_address" HeaderText="company_address" SortExpression="company_address"></asp:BoundField>
                    <asp:BoundField DataField="company_city" HeaderText="company_city" SortExpression="company_city"></asp:BoundField>
                    <asp:BoundField DataField="company_state" HeaderText="company_state" SortExpression="company_state"></asp:BoundField>
                    <asp:BoundField DataField="company_country" HeaderText="company_country" SortExpression="company_country"></asp:BoundField>
                    <asp:BoundField DataField="company_zipcode" HeaderText="company_zipcode" SortExpression="company_zipcode"></asp:BoundField>
                    <asp:BoundField DataField="company_email" HeaderText="company_email" SortExpression="company_email"></asp:BoundField>
                    <asp:BoundField DataField="company_phone" HeaderText="company_phone" SortExpression="company_phone"></asp:BoundField>
                    <asp:BoundField DataField="company_website" HeaderText="company_website" SortExpression="company_website"></asp:BoundField>
                    <asp:BoundField DataField="company_industry" HeaderText="company_industry" SortExpression="company_industry"></asp:BoundField>
                    <asp:BoundField DataField="company_contact_person_name" HeaderText="company_contact_person_name" SortExpression="company_contact_person_name"></asp:BoundField>
                    <asp:BoundField DataField="company_contact_person_email" HeaderText="company_contact_person_email" SortExpression="company_contact_person_email"></asp:BoundField>
                    <asp:BoundField DataField="company_contact_person_phone" HeaderText="company_contact_person_phone" SortExpression="company_contact_person_phone"></asp:BoundField>
                    <asp:BoundField DataField="company_description" HeaderText="company_description" SortExpression="company_description"></asp:BoundField>
                                                             <asp:TemplateField HeaderText="Actions" ItemStyle-Width="200px">
                    <ItemTemplate>
                      <asp:ImageButton ID="Edit1" runat="server" Text="Edit" CommandName="Edit1" OnClick="Edit1_Click" CausesValidation="false" ToolTip="Edit User" ImageUrl="img/pen.png" Width="35px" Height="35px" />
                      &nbsp;&nbsp;
                      <asp:ImageButton ID="del" runat="server" CommandName="del" CausesValidation="false" OnClientClick="return message(this);" Text="Delete" CommandArgument='<%# Eval("company_id") %>' Height="35px" Width="35px" ImageUrl="img/bin.png" />
                      &nbsp;&nbsp;
                    </ItemTemplate>
                  </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Charusat_ProjectConnectionString %>' DeleteCommand="DELETE FROM [Company_Details] WHERE [company_id] = @company_id" InsertCommand="INSERT INTO [Company_Details] ([company_name], [company_address], [company_city], [company_state], [company_country], [company_zipcode], [company_email], [company_phone], [company_website], [company_industry], [company_contact_person_name], [company_contact_person_email], [company_contact_person_phone], [company_description]) VALUES (@company_name, @company_address, @company_city, @company_state, @company_country, @company_zipcode, @company_email, @company_phone, @company_website, @company_industry, @company_contact_person_name, @company_contact_person_email, @company_contact_person_phone, @company_description)" SelectCommand="SELECT * FROM [Company_Details]" UpdateCommand="UPDATE [Company_Details] SET [company_name] = @company_name, [company_address] = @company_address, [company_city] = @company_city, [company_state] = @company_state, [company_country] = @company_country, [company_zipcode] = @company_zipcode, [company_email] = @company_email, [company_phone] = @company_phone, [company_website] = @company_website, [company_industry] = @company_industry, [company_contact_person_name] = @company_contact_person_name, [company_contact_person_email] = @company_contact_person_email, [company_contact_person_phone] = @company_contact_person_phone, [company_description] = @company_description WHERE [company_id] = @company_id">
                <DeleteParameters>
                    <asp:Parameter Name="company_id" Type="Int32"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="company_name" Type="String"></asp:Parameter>
                    <asp:Parameter Name="company_address" Type="String"></asp:Parameter>
                    <asp:Parameter Name="company_city" Type="String"></asp:Parameter>
                    <asp:Parameter Name="company_state" Type="String"></asp:Parameter>
                    <asp:Parameter Name="company_country" Type="String"></asp:Parameter>
                    <asp:Parameter Name="company_zipcode" Type="String"></asp:Parameter>
                    <asp:Parameter Name="company_email" Type="String"></asp:Parameter>
                    <asp:Parameter Name="company_phone" Type="String"></asp:Parameter>
                    <asp:Parameter Name="company_website" Type="String"></asp:Parameter>
                    <asp:Parameter Name="company_industry" Type="String"></asp:Parameter>
                    <asp:Parameter Name="company_contact_person_name" Type="String"></asp:Parameter>
                    <asp:Parameter Name="company_contact_person_email" Type="String"></asp:Parameter>
                    <asp:Parameter Name="company_contact_person_phone" Type="String"></asp:Parameter>
                    <asp:Parameter Name="company_description" Type="String"></asp:Parameter>
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="company_name" Type="String"></asp:Parameter>
                    <asp:Parameter Name="company_address" Type="String"></asp:Parameter>
                    <asp:Parameter Name="company_city" Type="String"></asp:Parameter>
                    <asp:Parameter Name="company_state" Type="String"></asp:Parameter>
                    <asp:Parameter Name="company_country" Type="String"></asp:Parameter>
                    <asp:Parameter Name="company_zipcode" Type="String"></asp:Parameter>
                    <asp:Parameter Name="company_email" Type="String"></asp:Parameter>
                    <asp:Parameter Name="company_phone" Type="String"></asp:Parameter>
                    <asp:Parameter Name="company_website" Type="String"></asp:Parameter>
                    <asp:Parameter Name="company_industry" Type="String"></asp:Parameter>
                    <asp:Parameter Name="company_contact_person_name" Type="String"></asp:Parameter>
                    <asp:Parameter Name="company_contact_person_email" Type="String"></asp:Parameter>
                    <asp:Parameter Name="company_contact_person_phone" Type="String"></asp:Parameter>
                    <asp:Parameter Name="company_description" Type="String"></asp:Parameter>
                    <asp:Parameter Name="company_id" Type="Int32"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>
               </div>
                        </div>
                    </div>
                </div>
            
            <script type="text/javascript">
                $("#ContentPlaceHolder1_example1").DataTable({
                    "responsive": true, "lengthChange": false, "autoWidth": false,
                    "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
                }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
                $('#example2').DataTable({
                    "paging": true,
                    "lengthChange": false,
                    "searching": false,
                    "ordering": true,
                    "info": true,
                    "autoWidth": false,
                    "responsive": true,
                });
  });
            </script>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

