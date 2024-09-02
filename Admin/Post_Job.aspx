<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="false" CodeFile="Post_Job.aspx.vb" Inherits="Admin_Post_Job" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <!-- DataTables -->
    <link rel="stylesheet" href="plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">

    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.39.0/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.39.0/js/tempusdominus-bootstrap-4.min.js"></script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        <Scripts>
        </Scripts>
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            
            <asp:HiddenField ID="post_id" runat="server" />

                        <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1>Post Company</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                                <li class="breadcrumb-item active">Post Company</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </section>

             <div class="col-md-6">
                <div class="card card-primary">
                    <div class="card-header">
                        <h3 class="card-title">Post Company</h3>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Select Company</label>
                            <asp:DropDownList ID="company_name" runat="server" CssClass="form-control" AutoPostBack="true"></asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Select Job</label>
                            <asp:DropDownList ID="job_title" runat="server" CssClass="form-control"></asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputFile">End Date</label>
                             <div class="input-group date" id="datetimepicker1" data-target-input="nearest">
    <asp:TextBox ID="end_date" runat="server" class="form-control datetimepicker-input" data-target="#datetimepicker1" placeholder="Select The Date"></asp:TextBox>
    <div class="input-group-append" data-target="#datetimepicker1" data-toggle="datetimepicker">
        <div class="input-group-text"><i class="fa fa-calendar"></i></div>
    </div>
</div> 
                        </div>
                    </div>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="admin" ForeColor="#FF3300" />
                    <div class="card-footer">
                        <asp:Button ID="submit" runat="server" Text="submit" CssClass="btn btn-primary" CausesValidation="true" ValidationGroup="admin" />
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
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

