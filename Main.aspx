<%@ Page Title="" Language="VB" MasterPageFile="~/website.master" AutoEventWireup="false" CodeFile="Main.aspx.vb" Inherits="Main" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="featured-job-area feature-padding">
            <div class="container">
                <!-- Section Tittle -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-tittle text-center">
                            <span>Recent Job</span>
                            <h2>Featured Job</h2>

                        </div>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-xl-10">
                        <!-- single-job-content -->

                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                     <asp:HiddenField ID="hdnJobId" Value='<%# Eval("job_id") %>' runat="server" />
        <asp:HiddenField ID="hdnCompanyId" Value='<%# Eval("company_id") %>' runat="server" />
   
                        <div class="single-job-items mb-30">
                                    <div class="job-items">
                                <div class="company-img">
                                    <a href="#"><img src="<%# ("Admin/img/Logos/") + Eval("job_logo") %>" alt="" style="width:100px;height:50px"></a>
                                </div>
                                <div class="job-tittle">
                                    <a href="#"><h4><%# Eval("company_name") %></h4></a>
                                    <ul>
                                        <li><%# Eval("job_title") %></li>
<li><i class="fas fa-map-marker-alt"></i><%# Eval("job_location") %></li><li>₹ <%# Eval("job_package") %></li>
                                    </ul>
                                </div>
                            </div>
                                    <div class="items-link f-right">
                                        <asp:LinkButton ID="job_type" runat="server" class="btn" style="height:35px;display:flex;justify-content:center;align-items:center;" 
    CommandArgument='<%# Eval("post_id") %>'><%# Eval("job_type") %>
</asp:LinkButton>

                                
                                
    <asp:Literal ID="litPostedTime" runat="server" Text='<%# CalculatePostedTime(Eval("end_date")) %>'></asp:Literal>

                            </div>

                        </div>
                                </ItemTemplate>
                                
                            </asp:Repeater>

                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:Charusat_ProjectConnectionString %>"
    SelectCommand="SELECT pc.*, cd.*, jm.*
                    FROM Post_Company pc
                    INNER JOIN Company_details cd ON pc.company_id = cd.company_id
                    INNER JOIN Job_Master jm ON pc.job_id = jm.job_id
                    WHERE pc.end_date >= @CurrentDate">
    <SelectParameters>
        <asp:Parameter Name="CurrentDate" Type="DateTime" />
    </SelectParameters>
</asp:SqlDataSource>
                            
                        
                    </div>
                </div>
            </div>
        </section>
</asp:Content>

