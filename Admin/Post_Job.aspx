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
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" OnPreRender="UpdatePanel1_PreRender">
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
                            <label for="company_name">Select Company</label>
                            <asp:DropDownList ID="company_name" runat="server" CssClass="form-control" AutoPostBack="true"></asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label for="job_title">Select Job</label>
                            <asp:DropDownList ID="job_title" runat="server" CssClass="form-control"></asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label for="end_date">End Date</label>
                            <div class="input-group date" id="datetimepicker1" data-target-input="nearest">
                                <asp:TextBox ID="end_date" runat="server" CssClass="form-control datetimepicker-input" data-target="#datetimepicker1" placeholder="Select The Date"></asp:TextBox>
                                <div class="input-group-append" data-target="#datetimepicker1" data-toggle="datetimepicker">
                                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="admin" ForeColor="#FF3300" />
                    <div class="card-footer">
                        <asp:Button ID="submit" runat="server" Text="Submit" CssClass="btn btn-primary" CausesValidation="true" ValidationGroup="admin" />
                    </div>
                </div>
            </div>

            <div class="content">
                <div class="container-fluid">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Job Posted</h3>
                        </div>
                        <div class="card-body">
                            <asp:GridView ID="example1" runat="server" AutoGenerateColumns="False" DataKeyNames="post_id" DataSourceID="SqlDataSource1" CssClass="table table-bordered table-striped">
                                <Columns>
                                    <asp:BoundField DataField="post_id" HeaderText="Post ID" ReadOnly="True" SortExpression="post_id" />
                                    <asp:BoundField DataField="company_id" HeaderText="Company ID" SortExpression="company_id" />
                                    <asp:BoundField DataField="job_id" HeaderText="Job ID" SortExpression="job_id" />
                                    <asp:BoundField DataField="end_date" HeaderText="End Date" SortExpression="end_date" />
                                    <asp:BoundField DataField="company_name" HeaderText="Company Name" SortExpression="company_name" />
                                    <asp:BoundField DataField="job_title" HeaderText="Job Title" SortExpression="job_title" />
                                    <asp:TemplateField HeaderText="Actions" ItemStyle-Width="200px">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="Edit1" runat="server" CommandName="Edit1" OnClick="Edit1_Click" ToolTip="Edit" ImageUrl="img/pen.png" Width="35px" Height="35px" />
                                            &nbsp;&nbsp;
                                            <asp:ImageButton ID="del" runat="server" CommandName="del" OnClientClick="return message(this);" CommandArgument='<%# Eval("post_id") %>' ImageUrl="img/bin.png" Width="35px" Height="35px" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:Charusat_ProjectConnectionString %>' 
                                DeleteCommand="DELETE FROM [Post_Company] WHERE [post_id] = @post_id" 
                                InsertCommand="INSERT INTO [Post_Company] ([company_id], [job_id], [end_date], [company_name], [job_title]) VALUES (@company_id, @job_id, @end_date, @company_name, @job_title)" 
                                SelectCommand="SELECT * FROM [Post_Company]" 
                                UpdateCommand="UPDATE [Post_Company] SET [company_id] = @company_id, [job_id] = @job_id, [end_date] = @end_date, [company_name] = @company_name, [job_title] = @job_title WHERE [post_id] = @post_id">
                                <DeleteParameters>
                                    <asp:Parameter Name="post_id" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="company_id" Type="Int32" />
                                    <asp:Parameter Name="job_id" Type="Int32" />
                                    <asp:Parameter Name="end_date" DbType="Date" />
                                    <asp:Parameter Name="company_name" Type="String" />
                                    <asp:Parameter Name="job_title" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="company_id" Type="Int32" />
                                    <asp:Parameter Name="job_id" Type="Int32" />
                                    <asp:Parameter Name="end_date" DbType="Date" />
                                    <asp:Parameter Name="company_name" Type="String" />
                                    <asp:Parameter Name="job_title" Type="String" />
                                    <asp:Parameter Name="post_id" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
            </div>

            <!-- jQuery for DateTimePicker -->
            <script type="text/javascript">
                $(function () {
                    $('#datetimepicker1').datetimepicker({
                        format: 'YYYY-MM-DD',  // AM/PM format
                        minDate: moment()  // Disable past dates
                    });
                });

                // Refresh datetime picker on update panel update
                function refreshDateTimePicker() {
                    $('#datetimepicker1').datetimepicker({
                        format: 'YYYY-MM-DD',
                        minDate: moment()
                    });
                }

                // Call this function on UpdatePanel's Update event
                Sys.WebForms.PageRequestManager.getInstance().add_endRequest(refreshDateTimePicker);
            </script>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
