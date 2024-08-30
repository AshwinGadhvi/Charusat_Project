﻿<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="false" CodeFile="College_Master.aspx.vb" Inherits="College_Master" %>

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
            <asp:HiddenField ID="college_id" runat="server" />
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1>College Master</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                                <li class="breadcrumb-item active">College Master</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Form -->
            <div class="col-md-12">
                <div class="card card-primary">
                    <div class="card-header">
                        <h3 class="card-title">College Master</h3>
                    </div>
                    <div class="card-body">
                        <div class="row">

                        <div class="form-group col-6 d-inline-block">
                            <label for="exampleInputEmail1">College Name</label>
                            <asp:TextBox ID="college_name" runat="server" class="form-control" placeholder="Enter Name Of College"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Valid Name Of College" ControlToValidate="college_name" Display="none" Font-Bold="True" ValidationGroup="admin" SetFocusOnError="true"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-6 d-inline-block">
                            <label for="exampleInputPassword1">College Location</label>
                            <asp:TextBox ID="college_location" runat="server" placeholder="Enter College Location" class="form-control"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Valid college location" ControlToValidate="college_location" Display="none" Font-Bold="True" ValidationGroup="admin" SetFocusOnError="true" ></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-6 d-inline-block">
                            <label for="exampleInputPassword1">College Email</label>
                            <asp:TextBox ID="college_email" runat="server" placeholder="Enter College Email" class="form-control"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Valid college email" ControlToValidate="college_email" Display="none" Font-Bold="True" ValidationGroup="admin" SetFocusOnError="true" ></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-6 d-inline-block">
                            <label for="exampleInputPassword1">College Contact</label>
                            <asp:TextBox ID="college_contact" runat="server" placeholder="Enter College Contact" class="form-control"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Valid college Contact" ControlToValidate="college_contact" Display="none" Font-Bold="True" ValidationGroup="admin" SetFocusOnError="true" ></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-6 d-inline-block">
                            <label for="exampleInputPassword1">College Details</label>
                            <asp:TextBox ID="college_details" runat="server" placeholder="Enter College Details" class="form-control"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Valid college details" ControlToValidate="college_details" Display="none" Font-Bold="True" ValidationGroup="admin" SetFocusOnError="true" ></asp:RequiredFieldValidator>
                        </div>
                        </div>
                    </div>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="#FF3300" ValidationGroup="admin" />
                    <div class="card-footer">
                        <asp:Button ID="submit" runat="server" Text="submit" CssClass="btn btn-primary" CausesValidation="true" ValidationGroup="admin" />
                    </div>
                </div>
            </div>

            <!-- Table -->
            <div class="content">
                <div class="container-fluid">
                    <div class="card">
              <div class="card-header">
                <h3 class="card-title">List Of All Colleges</h3>
              </div>
              <!-- /.card-header -->
           <div class="card-body">
               <asp:GridView ID="example1" runat="server" AutoGenerateColumns="False" DataKeyNames="college_id" CssClass="table table-bordered table-striped"  DataSourceID="SqlDataSource1">
                   <Columns>
                       <asp:BoundField DataField="college_id" HeaderText="college_id" ReadOnly="True" InsertVisible="False" SortExpression="college_id"></asp:BoundField>
                       <asp:BoundField DataField="college_name" HeaderText="college_name" SortExpression="college_name"></asp:BoundField>
                       <asp:BoundField DataField="college_location" HeaderText="college_location" SortExpression="college_location"></asp:BoundField>
                       <asp:BoundField DataField="college_email" HeaderText="college_email" SortExpression="college_email"></asp:BoundField>
                       <asp:BoundField DataField="college_contact" HeaderText="college_contact" SortExpression="college_contact"></asp:BoundField>
                       <asp:BoundField DataField="college_details" HeaderText="college_details" SortExpression="college_details"></asp:BoundField>
                                         <asp:TemplateField HeaderText="Actions" ItemStyle-Width="200px">
                    <ItemTemplate>
                      <asp:ImageButton ID="Edit1" runat="server" Text="Edit" CommandName="Edit1" OnClick="Edit1_Click" CausesValidation="false" ToolTip="Edit User" ImageUrl="img/pen.png" Width="35px" Height="35px" />
                      &nbsp;&nbsp;
                      <asp:ImageButton ID="del" runat="server" CommandName="del" CausesValidation="false" OnClientClick="return message(this);" Text="Delete" CommandArgument='<%# Eval("college_id") %>' Height="35px" Width="35px" ImageUrl="img/bin.png" />
                      &nbsp;&nbsp;
                    </ItemTemplate>
                  </asp:TemplateField>
                   </Columns>
               </asp:GridView>
               <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Charusat_ProjectConnectionString %>' DeleteCommand="DELETE FROM [College_Master] WHERE [college_id] = @college_id" InsertCommand="INSERT INTO [College_Master] ([college_name], [college_location], [college_email], [college_contact], [college_details]) VALUES (@college_name, @college_location, @college_email, @college_contact, @college_details)" SelectCommand="SELECT * FROM [College_Master]" UpdateCommand="UPDATE [College_Master] SET [college_name] = @college_name, [college_location] = @college_location, [college_email] = @college_email, [college_contact] = @college_contact, [college_details] = @college_details WHERE [college_id] = @college_id">
                   <DeleteParameters>
                       <asp:Parameter Name="college_id" Type="Int32"></asp:Parameter>
                   </DeleteParameters>
                   <InsertParameters>
                       <asp:Parameter Name="college_name" Type="String"></asp:Parameter>
                       <asp:Parameter Name="college_location" Type="String"></asp:Parameter>
                       <asp:Parameter Name="college_email" Type="String"></asp:Parameter>
                       <asp:Parameter Name="college_contact" Type="String"></asp:Parameter>
                       <asp:Parameter Name="college_details" Type="String"></asp:Parameter>
                   </InsertParameters>
                   <UpdateParameters>
                       <asp:Parameter Name="college_name" Type="String"></asp:Parameter>
                       <asp:Parameter Name="college_location" Type="String"></asp:Parameter>
                       <asp:Parameter Name="college_email" Type="String"></asp:Parameter>
                       <asp:Parameter Name="college_contact" Type="String"></asp:Parameter>
                       <asp:Parameter Name="college_details" Type="String"></asp:Parameter>
                       <asp:Parameter Name="college_id" Type="Int32"></asp:Parameter>
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
