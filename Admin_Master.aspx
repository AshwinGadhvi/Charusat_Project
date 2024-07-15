<%@ Page Title="" Language="VB" MasterPageFile="~/Admin.master" AutoEventWireup="false" CodeFile="Admin_Master.aspx.vb" Inherits="Admin_Master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

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
            <asp:HiddenField ID="user_id" runat="server" />
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
                                <li class="breadcrumb-item active">Admin Master</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Form -->
            <div class="col-md-6">
                <div class="card card-primary">
                    <div class="card-header">
                        <h3 class="card-title">Admin Master</h3>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Admin Name</label>
                            <asp:TextBox ID="user_name" runat="server" class="form-control" placeholder="Enter Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Valid Name" ControlToValidate="user_name" Display="static" Font-Bold="True" ValidationGroup="admin" SetFocusOnError="true"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Password</label>
                            <asp:TextBox ID="user_password" runat="server" placeholder="Enter Password" class="form-control" TextMode="Password"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Valid Password" ControlToValidate="user_password" Display="static" Font-Bold="True" ValidationGroup="admin" SetFocusOnError="true" ></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputFile">User Type</label>
                            <asp:DropDownList ID="user_type" runat="server" CssClass="form-control">
                                <asp:ListItem>Admin</asp:ListItem>
                                <asp:ListItem>User</asp:ListItem>
                            </asp:DropDownList>
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
                <asp:GridView ID="example1" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="False" DataKeyNames="user_id" DataSourceID="SqlDataSource1">

                        <Columns>
                            <asp:BoundField DataField="user_id" HeaderText="user_id" ReadOnly="True" InsertVisible="False" SortExpression="user_id"></asp:BoundField>
                            <asp:BoundField DataField="user_name" HeaderText="user_name" SortExpression="user_name"></asp:BoundField>
                            <asp:BoundField DataField="user_password" HeaderText="user_password" SortExpression="user_password"></asp:BoundField>
                            <asp:BoundField DataField="user_type" HeaderText="user_type" SortExpression="user_type"></asp:BoundField>
                            <asp:TemplateField HeaderText="Actions" ItemStyle-Width="200px">
                                <ItemTemplate>
                                    <asp:ImageButton ID="Edit1" runat="server" Text="Edit" CommandName="Edit1" OnClick="Edit1_Click" CausesValidation="false" ToolTip="Edit User" ImageUrl="img/icons8-edit-40.png" Width="35px" Height="35px" />
                                    &nbsp;&nbsp;
                                          
                               <asp:ImageButton ID="del" runat="server" CommandName="del" CausesValidation="false" OnClientClick="return message(this);" Text="Delete" CommandArgument='<%# Eval("user_id") %>' Height="35px" Width="35px" ImageUrl="img/icons8-delete-40.png"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Charusat_ProjectConnectionString %>' DeleteCommand="DELETE FROM [Admin_Master] WHERE [user_id] = @user_id" InsertCommand="INSERT INTO [Admin_Master] ([user_name], [user_password], [user_type]) VALUES (@user_name, @user_password, @user_type)" SelectCommand="SELECT * FROM [Admin_Master]" UpdateCommand="UPDATE [Admin_Master] SET [user_name] = @user_name, [user_password] = @user_password, [user_type] = @user_type WHERE [user_id] = @user_id">
                        <DeleteParameters>
                            <asp:Parameter Name="user_id" Type="Int32"></asp:Parameter>
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="user_name" Type="String"></asp:Parameter>
                            <asp:Parameter Name="user_password" Type="String"></asp:Parameter>
                            <asp:Parameter Name="user_type" Type="String"></asp:Parameter>
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="user_name" Type="String"></asp:Parameter>
                            <asp:Parameter Name="user_password" Type="String"></asp:Parameter>
                            <asp:Parameter Name="user_type" Type="String"></asp:Parameter>
                            <asp:Parameter Name="user_id" Type="Int32"></asp:Parameter>
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
