<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="false" CodeFile="College_Master.aspx.vb" Inherits="College_Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <!-- SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <!-- SweetAlert2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

      <!-- DataTables -->
    <link rel="stylesheet" href="plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
     <style>
        .modalPopup {
            width: 600px;
            height: 600px;
        }
        .modal-content {
            width: 100%;
            height: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        <Scripts>
        </Scripts>
    </asp:ScriptManager>


    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
             <asp:Button ID="btnShowPopup" runat="server" Text="New College" CssClass="btn btn-primary m-2" OnClientClick="return false;" />
              <asp:HiddenField ID="college_id" runat="server" />

             <!-- Modal Popup Content -->
            <asp:Panel ID="pnlAdminForm" runat="server" CssClass="modalPopup" style="display:none;">
                <div class="modal-content">
                    <div class="modal-header bg-primary">
                        <h4 class="modal-title">College Master</h4>
                        <button type="button" class="close" onclick="closeModal();" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <asp:HiddenField ID="user_id" runat="server" />
                         <div class="form-group col-12 d-inline-block">
                            <label for="exampleInputEmail1">College Name</label>
                            <asp:TextBox ID="college_name" runat="server" class="form-control" placeholder="Enter Name Of College"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Valid Name Of College" ControlToValidate="college_name" Display="none" Font-Bold="True" ValidationGroup="admin" SetFocusOnError="true"></asp:RequiredFieldValidator>
                        </div>
                         <div class="form-group col-12 d-inline-block">
                            <label for="exampleInputPassword1">College Location</label>
                            <asp:TextBox ID="college_location" runat="server" placeholder="Enter College Location" class="form-control"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Valid college location" ControlToValidate="college_location" Display="none" Font-Bold="True" ValidationGroup="admin" SetFocusOnError="true" ></asp:RequiredFieldValidator>
                        </div>
                          <div class="form-group col-12 d-inline-block">
                            <label for="exampleInputPassword1">College Email</label>
                            <asp:TextBox ID="college_email" runat="server" placeholder="Enter College Email" class="form-control"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Valid college email" ControlToValidate="college_email" Display="none" Font-Bold="True" ValidationGroup="admin" SetFocusOnError="true" ></asp:RequiredFieldValidator>
                        </div>
                         <div class="form-group col-12 d-inline-block">
                            <label for="exampleInputPassword1">College Contact</label>
                            <asp:TextBox ID="college_contact" runat="server" placeholder="Enter College Contact" class="form-control"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Valid college Contact" ControlToValidate="college_contact" Display="none" Font-Bold="True" ValidationGroup="admin" SetFocusOnError="true" ></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-12 d-inline-block">
                            <label for="exampleInputPassword1">College Details</label>
                            <asp:TextBox ID="college_details" runat="server" placeholder="Enter College Details" class="form-control"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Valid college details" ControlToValidate="college_details" Display="none" Font-Bold="True" ValidationGroup="admin" SetFocusOnError="true" ></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="modal-footer bg-grey">
                        <asp:Button ID="submit" runat="server" Text="Submit" CssClass="btn btn-primary" CausesValidation="true" ValidationGroup="admin" />
                        <asp:Button ID="btnClose" runat="server" Text="Cancel" CssClass="btn btn-secondary" OnClientClick="closeModal();" />
                    </div>
                </div>
            </asp:Panel>
          

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

             <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="btnShowPopup"
                PopupControlID="pnlAdminForm" BackgroundCssClass="modal-background" />
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
              <script type="text/javascript">
                $(document).ready(function () {
                    // Initialize DataTable
                    $('#<%= UpdatePanel1.ClientID %>').DataTable({
                        dom: 'Bfrtip',
                        buttons: [
                            'copy', 'csv', 'excel', 'pdf', 'print'
                        ]
                    });

                    // Custom function to show modal
                    $('#<%= btnShowPopup.ClientID %>').click(function () {
                        $('#<%= pnlAdminForm.ClientID %>').show();
                    });
                });

                // Function to close the modal
                function closeModal() {
                    $('#<%= pnlAdminForm.ClientID %>').hide();
                }

                // Confirm delete action
                function message(button) {
                    return confirm("Are you sure you want to delete this record?");
                }
            </script>
               <script type="text/javascript">

    function showSuccessMessage(action) {
        Swal.fire({
            icon: 'success',
            title: 'Success!',
            text: 'Record has been ' + action + ' successfully.',
            showConfirmButton: false,
            timer: 1500
        });
    }

    function showErrorMessage(error) {
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Something went wrong! ' + error,
        });
    }

    // Confirmation before delete
    function confirmDelete(collegeId) {
        Swal.fire({
            title: 'Are you sure?',
            text: "You won't be able to revert this!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
            if (result.isConfirmed) {
                __doPostBack('DeletePost', collegeId);
            }
        });
        return false;  // Prevent default postback
    }
</script>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

