<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/Company.master" AutoEventWireup="false" CodeFile="Round_Information.aspx.vb" Inherits="Admin_Round_Information" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.39.0/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.39.0/js/tempusdominus-bootstrap-4.min.js"></script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Label ID="company_id" runat="server" Text="" Visible="false"></asp:Label>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        <Scripts>
            
        </Scripts>
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:HiddenField ID="round_id" runat="server" />
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1>Round Master</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="Company_Dashboard.aspx">Home</a></li>
                                <li class="breadcrumb-item active">Round Master</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Form -->
            <div class="col-md-12">
                <div class="card card-primary">
                    <div class="card-header">
                        <h3 class="card-title">Round Master</h3>
                    </div>
                    <div class="card-body">
                        <div class="row">

                            <div class="form-group col-4 d-inline-block">
                                <label for="exampleInputEmail1">Company Name</label>
                                <asp:DropDownList ID="company_name" runat="server" DataSourceID="SqlDataSource3" DataTextField="company_name" DataValueField="company_id" CssClass="form-control" readOnly></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:Charusat_ProjectConnectionString %>' SelectCommand="SELECT [company_id], [company_name] FROM [Company_Details] WHERE ([company_id] = @company_id) ORDER BY [company_name]">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="company_id" PropertyName="Text" DefaultValue="0" Name="company_id" Type="Int32"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                            <div class="form-group col-4 d-inline-block">
                                <label for="exampleInputPassword1">Round Number</label>
                                <asp:TextBox ID="round_number" runat="server" placeholder="Enter Round Number Ex: 1,2,3.." class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Valid round number" ControlToValidate="round_number" Display="none" Font-Bold="True" ValidationGroup="admin" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-4 d-inline-block">
                                <label for="exampleInputPassword1">Round Type</label>
                                <asp:TextBox ID="round_type" runat="server" placeholder="Enter Round Type Ex: Aptitude,Coding..." class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Valid Round Type" ControlToValidate="round_type" Display="none" Font-Bold="True" ValidationGroup="admin" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-4 d-inline-block">
                                <label for="exampleInputPassword1">Round Date</label>
                      <div class="input-group date" id="datetimepicker1" data-target-input="nearest">
    <asp:TextBox ID="round_date" runat="server" class="form-control datetimepicker-input" data-target="#datetimepicker1" placeholder="Select The Date"></asp:TextBox>
    <div class="input-group-append" data-target="#datetimepicker1" data-toggle="datetimepicker">
        <div class="input-group-text"><i class="fa fa-calendar"></i></div>
    </div>
</div>
       
                            </div>
                            <div class="form-group col-4 d-inline-block">
                                <label for="exampleInputPassword1">Round Duration</label>
                                <asp:TextBox ID="round_duration" runat="server" placeholder="Enter Round Duration" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Valid Time For Round" ControlToValidate="round_duration" Display="none" Font-Bold="True" ValidationGroup="admin" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-4 d-inline-block">
                                <label for="exampleInputPassword1">Round Instruction</label>
                                <asp:TextBox ID="round_instruction" runat="server" placeholder="Enter Instruction For Round" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Enter Valid Instruction For Round" ControlToValidate="round_instruction" Display="none" Font-Bold="True" ValidationGroup="admin" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-4 d-inline-block">
                                <label for="exampleInputPassword1">Round Documents</label>
                                <asp:TextBox ID="round_documents" runat="server" placeholder="Enter Documents Require For Round" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Enter Valid Documents For Round" ControlToValidate="round_documents" Display="none" Font-Bold="True" ValidationGroup="admin" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-4 d-inline-block">
                                <label for="exampleInputPassword1">Round Interviewer</label>
                                <asp:TextBox ID="round_interviewer" runat="server" placeholder="Enter Total Number Of Interviewer" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Enter Valid Interviewer Count" ControlToValidate="round_interviewer" Display="none" Font-Bold="True" ValidationGroup="admin" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-4 d-inline-block">
                                <label for="exampleInputPassword1">Round Link</label>
                                <asp:TextBox ID="round_link" runat="server" placeholder="Enter Round Link If Online" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Enter Valid Round Link" ControlToValidate="round_link" Display="none" Font-Bold="True" ValidationGroup="admin" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-4 d-inline-block">
                                <label for="exampleInputPassword1">Round Description</label>
                                <asp:TextBox ID="round_description" runat="server" placeholder="Enter The Description About The Round" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Enter Valid Round Description" ControlToValidate="round_description" Display="none" Font-Bold="True" ValidationGroup="admin" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-4 d-inline-block">
                                <label for="exampleInputPassword1">Round Prerequisites</label>
                                <asp:TextBox ID="round_prerequisites" runat="server" placeholder="Enter Prerequisites For Round" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Enter Valid Contact Prerequisites" ControlToValidate="round_prerequisites" Display="none" Font-Bold="True" ValidationGroup="admin" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-4 d-inline-block">
                                <label for="exampleInputPassword1">Round Evalution</label>
                                <asp:TextBox ID="round_evalution" runat="server" placeholder="Enter Criteria For Evalution" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Enter Valid Round Evalution Details" ControlToValidate="round_evalution" Display="none" Font-Bold="True" ValidationGroup="admin" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            </div>
                            
                            
                        </div>
                    </div>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="admin" ForeColor="#FF3300" />
                    <div class="card-footer">
                        <asp:Button ID="submit" runat="server" Text="submit" CssClass="btn btn-primary" CausesValidation="true" ValidationGroup="admin" />
                        <asp:Button ID="show" runat="server" Text="Show" CssClass="btn btn-danger" PostBackUrl="~/Admin/Round_Information.aspx" />
                    </div>
                </div>
            </div>
            <!-- Table -->
            <div class="content">
                <div class="container-fluid">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Round Information</h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            
                            <asp:GridView ID="example1" runat="server" CssClass="table table-bordered table-striped table-responsive" AutoGenerateColumns="False" DataKeyNames="round_id" DataSourceID="SqlDataSource1" Visible="false">
                                <Columns>
                                    <asp:BoundField DataField="round_id" HeaderText="round_id" ReadOnly="True" InsertVisible="False" SortExpression="round_id"></asp:BoundField>
                                    <asp:BoundField DataField="company_id" HeaderText="company_id" SortExpression="company_id"></asp:BoundField>
                                    <asp:BoundField DataField="round_number" HeaderText="round_number" SortExpression="round_number"></asp:BoundField>
                                    <asp:BoundField DataField="round_type" HeaderText="round_type" SortExpression="round_type"></asp:BoundField>
                                    <asp:BoundField DataField="round_date" HeaderText="round_date" SortExpression="round_date"></asp:BoundField>
                                    <asp:BoundField DataField="round_duration" HeaderText="round_duration" SortExpression="round_duration"></asp:BoundField>
                                    <asp:BoundField DataField="round_instruction" HeaderText="round_instruction" SortExpression="round_instruction"></asp:BoundField>
                                    <asp:BoundField DataField="round_documents" HeaderText="round_documents" SortExpression="round_documents"></asp:BoundField>
                                    <asp:BoundField DataField="round_interviewer" HeaderText="round_interviewer" SortExpression="round_interviewer"></asp:BoundField>
                                    <asp:BoundField DataField="round_link" HeaderText="round_link" SortExpression="round_link"></asp:BoundField>
                                    <asp:BoundField DataField="round_description" HeaderText="round_description" SortExpression="round_description"></asp:BoundField>
                                    <asp:BoundField DataField="round_prerequisites" HeaderText="round_prerequisites" SortExpression="round_prerequisites"></asp:BoundField>
                                    <asp:BoundField DataField="round_evalution" HeaderText="round_evalution" SortExpression="round_evalution"></asp:BoundField>
                                    <asp:BoundField DataField="company_name" HeaderText="company_name" SortExpression="company_name"></asp:BoundField>
                                                        <asp:TemplateField HeaderText="Actions" ItemStyle-Width="200px">
                    <ItemTemplate>
                      <asp:ImageButton ID="Edit1" runat="server" Text="Edit" CommandName="Edit1" OnClick="Edit1_Click" CausesValidation="false" ToolTip="Edit User" ImageUrl="img/pen.png" Width="35px" Height="35px" />
                      &nbsp;&nbsp;
                      <asp:ImageButton ID="del" runat="server" CommandName="del" CausesValidation="false" OnClientClick="return message(this);" Text="Delete" CommandArgument='<%# Eval("round_id") %>' Height="35px" Width="35px" ImageUrl="img/bin.png" />
                      &nbsp;&nbsp;
                    </ItemTemplate>
                  </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Charusat_ProjectConnectionString %>' DeleteCommand="DELETE FROM [Round_Info_Master] WHERE [round_id] = @round_id" InsertCommand="INSERT INTO [Round_Info_Master] ([company_id], [round_number], [round_type], [round_date], [round_duration], [round_instruction], [round_documents], [round_interviewer], [round_link], [round_description], [round_prerequisites], [round_evalution], [company_name]) VALUES (@company_id, @round_number, @round_type, @round_date, @round_duration, @round_instruction, @round_documents, @round_interviewer, @round_link, @round_description, @round_prerequisites, @round_evalution, @company_name)" SelectCommand="SELECT * FROM [Round_Info_Master] WHERE ([company_id] = @company_id)" UpdateCommand="UPDATE [Round_Info_Master] SET [company_id] = @company_id, [round_number] = @round_number, [round_type] = @round_type, [round_date] = @round_date, [round_duration] = @round_duration, [round_instruction] = @round_instruction, [round_documents] = @round_documents, [round_interviewer] = @round_interviewer, [round_link] = @round_link, [round_description] = @round_description, [round_prerequisites] = @round_prerequisites, [round_evalution] = @round_evalution, [company_name] = @company_name WHERE [round_id] = @round_id">
                                <DeleteParameters>
                                    <asp:Parameter Name="round_id" Type="Int32"></asp:Parameter>
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="company_id" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="round_number" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="round_type" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="round_date" Type="DateTime"></asp:Parameter>
                                    <asp:Parameter Name="round_duration" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="round_instruction" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="round_documents" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="round_interviewer" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="round_link" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="round_description" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="round_prerequisites" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="round_evalution" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="company_name" Type="String"></asp:Parameter>
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="company_id" PropertyName="Text" DefaultValue="0" Name="company_id" Type="Int32"></asp:ControlParameter>
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="company_id" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="round_number" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="round_type" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="round_date" Type="DateTime"></asp:Parameter>
                                    <asp:Parameter Name="round_duration" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="round_instruction" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="round_documents" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="round_interviewer" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="round_link" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="round_description" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="round_prerequisites" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="round_evalution" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="company_name" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="round_id" Type="Int32"></asp:Parameter>
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
            </div>
            <script type="text/javascript">
    $(function () {
        $('#datetimepicker1').datetimepicker({
            format: 'L' // Modify the format as needed
        });
    });
</script>

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

