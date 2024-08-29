<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="false" CodeFile="Company_Login.aspx.vb" Inherits="Company_Login" %>

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
    <Scripts></Scripts>
  </asp:ScriptManager>

  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
      <!-- Content Header (Page header) -->
      <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1>Company Master</h1>
            </div>
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                <li class="breadcrumb-item active">Company Master</li>
              </ol>
            </div>
          </div>
        </div>
      </section>
      <!-- Form -->
      <asp:HiddenField ID="company_id" runat="server" />
      <div class="col-md-6">
        <div class="card card-primary">
          <div class="card-header">
            <h3 class="card-title">Company Master</h3>
          </div>
          <div class="card-body">
            <div class="form-group">
              <label for="exampleInputEmail1">Company Name</label>
              <asp:TextBox ID="company_name" runat="server" class="form-control" placeholder="Enter Company Name"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Valid Name" ControlToValidate="company_name" Display="static" Font-Bold="True" ValidationGroup="admin" SetFocusOnError="true"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
              <label for="exampleInputEmail1">Company Email</label>
              <asp:TextBox ID="company_email" runat="server" class="form-control" placeholder="Enter Company Email"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Valid Email" ControlToValidate="company_email" Display="static" Font-Bold="True" ValidationGroup="admin" SetFocusOnError="true"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
              <label for="exampleInputPassword1">Company Password</label>
              <asp:TextBox ID="company_password" runat="server" placeholder="Enter Company Password" class="form-control" TextMode="Password"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Valid Password" ControlToValidate="company_password" Display="static" Font-Bold="True" ValidationGroup="admin" SetFocusOnError="true"></asp:RequiredFieldValidator>
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
              <h3 class="card-title">List Of All Company</h3>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <asp:GridView ID="example1" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="False" DataKeyNames="company_id" DataSourceID="SqlDataSource1" OnRowCommand="example1_RowCommand">
                <Columns>
                  <asp:BoundField DataField="company_id" HeaderText="company_id" ReadOnly="True" InsertVisible="False" SortExpression="company_id"></asp:BoundField>
                  <asp:BoundField DataField="company_name" HeaderText="company_name" SortExpression="company_name"></asp:BoundField>
                  <asp:BoundField DataField="company_email" HeaderText="company_email" SortExpression="company_email"></asp:BoundField>
                  <asp:BoundField DataField="company_password" HeaderText="company_password" SortExpression="company_password"></asp:BoundField>
                  <asp:TemplateField HeaderText="Actions" ItemStyle-Width="200px">
                    <ItemTemplate>
                      <asp:ImageButton ID="Edit1" runat="server" Text="Edit" CommandName="Edit1" OnClick="Edit1_Click" CausesValidation="false" ToolTip="Edit User" ImageUrl="img/pen.png" Width="35px" Height="35px" />
                      &nbsp;&nbsp;
                      <asp:ImageButton ID="del" runat="server" CommandName="del" CausesValidation="false" OnClientClick="return message(this);" Text="Delete" CommandArgument='<%# Container.DataItemIndex %>' Height="35px" Width="35px" ImageUrl="img/bin.png" />
                      &nbsp;&nbsp;
                      <asp:ImageButton ID="email" runat="server" CommandName="email" CausesValidation="false" OnClientClick="return message(this);" Text="email" CommandArgument='<%# Container.DataItemIndex %>' Height="35px" Width="35px" ImageUrl="img/email.png" />
                    </ItemTemplate>
                  </asp:TemplateField>
                </Columns>
              </asp:GridView>
              <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Charusat_ProjectConnectionString %>' DeleteCommand="DELETE FROM [Company_Master] WHERE [company_id] = @company_id" InsertCommand="INSERT INTO [Company_Master] ([company_name], [company_email], [company_password]) VALUES (@company_name, @company_email, @company_password)" SelectCommand="SELECT * FROM [Company_Master]" UpdateCommand="UPDATE [Company_Master] SET [company_name] = @company_name, [company_email] = @company_email, [company_password] = @company_password WHERE [company_id] = @company_id">
                <DeleteParameters>
                  <asp:Parameter Name="company_id" Type="Int32"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                  <asp:Parameter Name="company_name" Type="String"></asp:Parameter>
                  <asp:Parameter Name="company_email" Type="String"></asp:Parameter>
                  <asp:Parameter Name="company_password" Type="String"></asp:Parameter>
                </InsertParameters>
                <UpdateParameters>
                  <asp:Parameter Name="company_name" Type="String"></asp:Parameter>
                  <asp:Parameter Name="company_email" Type="String"></asp:Parameter>
                  <asp:Parameter Name="company_password" Type="String"></asp:Parameter>
                  <asp:Parameter Name="company_id" Type="Int32"></asp:Parameter>
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
          "responsive": true,
          "lengthChange": false,
          "autoWidth": false,
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
      </script>
    </ContentTemplate>
  </asp:UpdatePanel>
</asp:Content>
