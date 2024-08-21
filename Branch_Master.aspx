<%@ Page Title="" Language="VB" MasterPageFile="~/Admin.master" AutoEventWireup="false" CodeFile="Branch_Master.aspx.vb" Inherits="Branch_Master" %>

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
            <asp:HiddenField ID="branch_id" runat="server" />
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1>Admin Master</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                                <li class="breadcrumb-item active">Branch Master</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Form -->
            <div class="col-md-6">
                <div class="card card-primary">
                    <div class="card-header">
                        <h3 class="card-title">Branch Master</h3>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Select College</label>
                            <asp:DropDownList ID="college_name" runat="server" DataSourceID="SqlDataSource1" DataTextField="college_name" DataValueField="college_id" class="form-control"></asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Charusat_ProjectConnectionString %>' SelectCommand="SELECT [college_id], [college_name] FROM [College_Master] ORDER BY [college_name]"></asp:SqlDataSource>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Valid Name" ControlToValidate="college_name" Display="static" Font-Bold="True" ValidationGroup="admin" SetFocusOnError="true"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">College Branch</label>
                            <asp:TextBox ID="branch_name" runat="server" placeholder="Enter Branch Name" class="form-control"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Valid Password" ControlToValidate="branch_name" Display="static" Font-Bold="True" ValidationGroup="admin" SetFocusOnError="true" ></asp:RequiredFieldValidator>
                        </div>
                        
                    </div>
                    <div class="card-footer">
                        <asp:Button ID="submit" runat="server" Text="submit" CssClass="btn btn-primary" CausesValidation="true" />
                    </div>
                </div>
            </div>

            <!-- Table -->
            <div class="content">
                <div class="container-fluid">
                    <div class="card">
              <div class="card-header">
                <h3 class="card-title">DataTable with default features</h3>
              </div>
              <!-- /.card-header -->
           
                <div class="card-body">
                    <asp:GridView ID="example1" runat="server" AutoGenerateColumns="False"  DataKeyNames="branch_id" DataSourceID="SqlDataSource2" CssClass="table table-bordered table-striped">

                        <Columns>
                            <asp:BoundField DataField="branch_id" HeaderText="branch_id" ReadOnly="True" InsertVisible="False" SortExpression="branch_id"></asp:BoundField>
                            <asp:BoundField DataField="college_id" HeaderText="college_id" SortExpression="college_id"></asp:BoundField>
                            <asp:BoundField DataField="branch_name" HeaderText="branch_name" SortExpression="branch_name"></asp:BoundField>
                            <asp:TemplateField HeaderText="Actions" ItemStyle-Width="200px">
                                <ItemTemplate>
                                    <asp:ImageButton ID="Edit1" runat="server" Text="Edit" CommandName="Edit1" OnClick="Edit1_Click" CausesValidation="false" ToolTip="Edit User" ImageUrl="img/pen.png" Width="35px" Height="35px" />
                                    &nbsp;&nbsp;
                                          
                               <asp:ImageButton ID="del" runat="server" CommandName="del" CausesValidation="false" OnClientClick="return message(this);" Text="Delete" CommandArgument='<%# Eval("branch_id") %>' Height="35px" Width="35px" ImageUrl="img/bin.png"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>

                    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:Charusat_ProjectConnectionString %>' DeleteCommand="DELETE FROM [Branch_Master] WHERE [branch_id] = @branch_id" InsertCommand="INSERT INTO [Branch_Master] ([college_id], [branch_name]) VALUES (@college_id, @branch_name)" SelectCommand="SELECT * FROM [Branch_Master]">
                        <DeleteParameters>
                            <asp:Parameter Name="branch_id" Type="Int32"></asp:Parameter>
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="college_id" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="branch_name" Type="String"></asp:Parameter>
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="college_id" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="branch_name" Type="String"></asp:Parameter>
                            <asp:Parameter Name="branch_id" Type="Int32"></asp:Parameter>
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
              
              <!-- /.card-body -->
            </div>
                </div>
            </div>
            <!-- Table end -->
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

