    <%@ Page Title="" Language="VB" MasterPageFile="~/website.master" AutoEventWireup="false" CodeFile="Company_Information.aspx.vb" Inherits="Company_Information" %>


    <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <asp:TextBox ID="post_id" runat="server" Visible="false"></asp:TextBox>
        <asp:TextBox ID="company_id" runat="server" Visible="false"></asp:TextBox>
        <asp:TextBox ID="job_id" runat="server" Visible="false"></asp:TextBox>
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>               <!-- Hero Area Start-->
            <div class="slider-area ">
            <div class="single-slider section-overly slider-height2 d-flex align-items-center" data-background="assets/img/hero/about.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-cap text-center">
                                <h2><%# Eval("job_title") %></h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
            <!-- Hero Area End -->
            <!-- job post company Start -->
            <div class="job-post-company pt-120 pb-120">
                <div class="container">
                    <div class="row justify-content-between">
                        <!-- Left Content -->
                        <div class="col-xl-7 col-lg-8">
                            <!-- job single -->
                            <div class="single-job-items mb-50">
                                <div class="job-items">
                                    <div class="company-img company-img-details">
                                        <a href="#"><img src="<%# ("Admin/img/Logos/") + Eval("job_logo") %>" alt="" style="width:100px;height:50px"></a>
                                    </div>
                                    <div class="job-tittle">
                                        <a href="#">
                                            <h4><%# Eval("company_name") %></h4>
                                        </a>
                                        <ul>
                                            <li><i class="fas fa-building"></i>
    <%# Eval("company_industry") %></li>
                                            <li><i class="fas fa-map-marker-alt"></i><%# Eval("company_state") %>, <%# Eval("company_country") %></li>
                                            <li>₹ <%# Eval("job_package") %></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                              <!-- job single End -->
                       
                            <div class="job-post-details">
                                <div class="post-details1 mb-50">
                                    <!-- Small Section Tittle -->
                                    <div class="small-section-tittle">
                                        <h4>Job Description</h4>
                                    </div>
                                    <p><%# Eval("job_description") %></p>
                                </div>
                                <div class="post-details2  mb-50">
                                     <!-- Small Section Tittle -->
                                    <div class="small-section-tittle">
                                        <h4>Required Knowledge, Skills, and Abilities</h4>
                                    </div>
                                   <ul>
                                       <li><%# Eval("job_requirements") %></li>
                                   
                                   </ul>
                                </div>
                                <div class="post-details2  mb-50">
                                     <!-- Small Section Tittle -->
                                    <div class="small-section-tittle">
                                        <h4>Education + Experience</h4>
                                    </div>
                                   <ul>
                                       <li>3 or more years of professional design experience</li>
                                       <li>Direct response email experience</li>
                                       <li>Ecommerce website design experience</li>
                                       <li>Familiarity with mobile and web apps preferred</li>
                                       <li>Experience using Invision a plus</li>
                                   </ul>
                                </div>
                            </div>

                        </div>
                        <!-- Right Content -->
                        <div class="col-xl-4 col-lg-4">
                            <div class="post-details3  mb-50">
                                <!-- Small Section Tittle -->
                               <div class="small-section-tittle">
                                   <h4>Job Overview</h4>
                               </div>
                              <ul>
                                  <li>End date : <span><%# Eval("end_date") %></span></li>
                                  <li>City : <span><%#Eval("company_address") %>, <%# Eval("company_city") %></span></li>
                                  <li>State : <span><%# Eval("company_state") %>, <%# Eval("company_zipcode") %></span></li>
                                  <li>Country : <span><%# Eval("company_country") %></span></li>
                                  <li>Job nature : <span><%# Eval("job_type") %></span></li>
                                  <li>Salary :  <span>₹ <%# Eval("job_package") %></span></li>
                              
                              </ul>
                             <div class="apply-btn2">
                                 <asp:LinkButton ID="Apply" runat="server" CssClass="btn" CommandName="ApplyJob">Apply Now</asp:LinkButton>


                             
                             </div>
                           </div>
                            <div class="post-details4  mb-50">
                                <!-- Small Section Tittle -->
                               <div class="small-section-tittle">
                                   <h4>Company Information</h4>
                               </div>
                                  <span><%# Eval("company_name") %></span>
                                  <p><%# Eval("company_description") %></p>
                                <ul>
                               
                                    <li>Web : <span><%# Eval("company_website") %></span></li>
                                    <li>Email: <span><%# Eval("company_email") %></span></li>
                                    <li>Contact: <span><%# Eval("company_phone") %></span></li>
                                </ul>
                           </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- job post company End -->
            </ItemTemplate>
        </asp:Repeater>
        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Charusat_ProjectConnectionString %>'
        SelectCommand="SELECT pc.*, cd.*, jm.*
                       FROM Post_Company pc
                       INNER JOIN Company_Details cd ON pc.company_id = cd.company_id
                       INNER JOIN Job_Master jm ON pc.job_id = jm.job_id
                       WHERE pc.post_id = @post_id AND cd.company_id = @company_id AND jm.job_id = @job_id">
        <SelectParameters>
            <asp:ControlParameter ControlID="post_id" PropertyName="Text" Name="post_id" Type="Int32" />
            <asp:ControlParameter ControlID="company_id" PropertyName="Text" Name="company_id" Type="Int32" />
            <asp:ControlParameter ControlID="job_id" PropertyName="Text" Name="job_id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:Charusat_ProjectConnectionString %>' DeleteCommand="DELETE FROM [Company_Registration] WHERE [reg_id] = @reg_id" InsertCommand="INSERT INTO [Company_Registration] ([company_id], [job_id], [post_id], [company_name], [job_title], [student_name], [student_id], [student_email], [register_date], [student_phone]) VALUES (@company_id, @job_id, @post_id, @company_name, @job_title, @student_name, @student_id, @student_email, @register_date, @student_phone)" SelectCommand="SELECT * FROM [Company_Registration]" UpdateCommand="UPDATE [Company_Registration] SET [company_id] = @company_id, [job_id] = @job_id, [post_id] = @post_id, [company_name] = @company_name, [job_title] = @job_title, [student_name] = @student_name, [student_id] = @student_id, [student_email] = @student_email, [register_date] = @register_date, [student_phone] = @student_phone WHERE [reg_id] = @reg_id">
            <DeleteParameters>
                <asp:Parameter Name="reg_id" Type="Int32"></asp:Parameter>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="company_id" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="job_id" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="post_id" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="company_name" Type="String"></asp:Parameter>
                <asp:Parameter Name="job_title" Type="String"></asp:Parameter>
                <asp:Parameter Name="student_name" Type="String"></asp:Parameter>
                <asp:Parameter Name="student_id" Type="String"></asp:Parameter>
                <asp:Parameter Name="student_email" Type="String"></asp:Parameter>
                <asp:Parameter DbType="Date" Name="register_date"></asp:Parameter>
                <asp:Parameter Name="student_phone" Type="String"></asp:Parameter>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="company_id" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="job_id" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="post_id" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="company_name" Type="String"></asp:Parameter>
                <asp:Parameter Name="job_title" Type="String"></asp:Parameter>
                <asp:Parameter Name="student_name" Type="String"></asp:Parameter>
                <asp:Parameter Name="student_id" Type="String"></asp:Parameter>
                <asp:Parameter Name="student_email" Type="String"></asp:Parameter>
                <asp:Parameter DbType="Date" Name="register_date"></asp:Parameter>
                <asp:Parameter Name="student_phone" Type="String"></asp:Parameter>
                <asp:Parameter Name="reg_id" Type="Int32"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>
    </asp:Content>

