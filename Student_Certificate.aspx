<%@ Page Title="" Language="VB" MasterPageFile="~/website.master" AutoEventWireup="false" CodeFile="Student_Certificate.aspx.vb" Inherits="Student_Certificate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <div class="container">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
             <Triggers>
            <asp:PostBackTrigger ControlID="submit" />
        </Triggers>
            <ContentTemplate>
                <asp:Label ID="student_id" runat="server" Text="Label" Visible="false"></asp:Label>
                <asp:HiddenField ID="certificate_no" runat="server" />

                <!-- Certification Form -->
                <div class="card">
                   <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
    <h4 class="card-title text-white mb-0">Certification Master</h4>
    <asp:LinkButton ID="back" runat="server" PostBackUrl="~/Student_Details.aspx" CssClass="btn btn-light btn-sm">Back To Profile</asp:LinkButton>
</div>

                    <div class="card-body">
                        <div class="form-group">
                            <label for="certificate_name">Certificate Name</label>
                            <asp:TextBox ID="certificate_name" runat="server" class="form-control" placeholder="Enter Certificate Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Valid Name" ControlToValidate="certificate_name" Display="Dynamic" ValidationGroup="admin"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="certificate_description">Certificate Description</label>
                            <asp:TextBox ID="certificate_description" runat="server" class="form-control" placeholder="Enter Certificate Description"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Valid Description" ControlToValidate="certificate_description" Display="Dynamic" ValidationGroup="admin"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="c_upload">Certificate Upload</label>
                            <asp:FileUpload ID="c_upload" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Upload a File" ControlToValidate="c_upload" Display="Dynamic" ValidationGroup="admin"></asp:RequiredFieldValidator>
                        </div>
                        <asp:Label ID="c_name" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="card-footer">
                        <asp:Button ID="submit" runat="server" Text="Submit" CssClass="btn btn-primary" ValidationGroup="admin" />
                        <asp:Button ID="resetForm" runat="server" Text="Reset" CssClass="btn btn-secondary" OnClientClick="clearForm(); return false;" />
                    </div>
                </div>

                <!-- Data Table -->
                <div class="card mt-4">
                    <div class="card-header">
                        <h3 class="card-title">List Of All Certificates</h3>
                    </div>
                    <div class="card-body">
                        <asp:GridView ID="Example1" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="False" DataKeyNames="certificate_id" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="certificate_id" HeaderText="Certificate ID" ReadOnly="True" />
                                <asp:BoundField DataField="certificate_name" HeaderText="Certificate Name" />
                                <asp:BoundField DataField="certificate_description" HeaderText="Description" />
                                <asp:BoundField DataField="cp_name" HeaderText="Uploaded File" />
                                <asp:TemplateField HeaderText="Actions">
            <ItemTemplate>
                <asp:ImageButton ID="Edit1" runat="server" CommandName="Edit" 
                    ImageUrl="~/Admin/img/icons8-edit-40.png" Width="35px" Height="35px" 
                    ToolTip="Edit Certificate" OnClick="Edit1_Click" />
                &nbsp;&nbsp;
                <asp:ImageButton ID="Delete1" runat="server" CommandName="Delete" 
                    ImageUrl="~/Admin/img/bin.png" Width="35px" Height="35px" 
                    ToolTip="Delete Certificate" 
                    OnClientClick="return confirm('Are you sure you want to delete this record?');" />
            </ItemTemplate>
        </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:Charusat_ProjectConnectionString %>'
                SelectCommand="SELECT * FROM [Student_Certificate] WHERE ([sr_id] = @sr_id)"
                InsertCommand="INSERT INTO [Student_Certificate] ([certificate_name], [certificate_description], [cp_name], [sr_id]) VALUES (@certificate_name, @certificate_description, @cp_name, @sr_id)"
                UpdateCommand="UPDATE [Student_Certificate] SET [certificate_name] = @certificate_name, [certificate_description] = @certificate_description, [cp_name] = @cp_name, [sr_id] = @sr_id WHERE [certificate_id] = @certificate_id"
                DeleteCommand="DELETE FROM [Student_Certificate] WHERE [certificate_id] = @certificate_id">
                <InsertParameters>
                    <asp:Parameter Name="certificate_name" Type="String" />
                    <asp:Parameter Name="certificate_description" Type="String" />
                    <asp:Parameter Name="cp_name" Type="String" />
                    <asp:Parameter Name="sr_id" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="student_id" PropertyName="Text" DefaultValue="0" Name="sr_id" Type="Int32"></asp:ControlParameter>
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="certificate_name" Type="String" />
                    <asp:Parameter Name="certificate_description" Type="String" />
                    <asp:Parameter Name="cp_name" Type="String" />
                    <asp:Parameter Name="sr_id" Type="Int32" />
                    <asp:Parameter Name="certificate_id" Type="Int32"></asp:Parameter>
                </UpdateParameters>
                            <DeleteParameters>
                                <asp:Parameter Name="certificate_id" Type="Int32" />
                            </DeleteParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>

                <script>
                    function clearForm() {
                        document.getElementById('<%= certificate_name.ClientID %>').value = '';
                        document.getElementById('<%= certificate_description.ClientID %>').value = '';
                        document.getElementById('<%= c_upload.ClientID %>').value = '';
                    }
                </script>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
