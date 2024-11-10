<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Register.aspx.vb" Inherits="login_form_20_Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CHARUSAT | Best Private University in Gujarat</title>
    <link rel="icon" type="image" href="../../logo.png">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="css/style.css">
</head>
<body class="img js-fullheight" style="background-image: url(images/CDPC.png);">
    <form id="form1" runat="server">

    	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 col-lg-4">
					<div class="login-wrap p-0">
		      	<h3 class="mb-2 text-center">Registration Page</h3>
		      	
		      		<div class="form-group">
		      			
                          <asp:TextBox ID="student_f_name" runat="server" required  class="form-control" placeholder="First Name"></asp:TextBox>
		      		</div>
                        <div class="form-group">
		      			
                          <asp:TextBox ID="student_l_name" runat="server" required  class="form-control" placeholder="Last Name"></asp:TextBox>
		      		</div>
                        <div class="form-group">
		      			
                          <asp:TextBox ID="student_id" runat="server" required  class="form-control" placeholder="Student Id Number"></asp:TextBox>
		      		</div>
                        <div class="form-group">
		      			
                          <asp:TextBox ID="student_email" runat="server" required  class="form-control" placeholder="Student Charusat Email"></asp:TextBox>
		      		</div>
                        <div class="form-group">
		      			
                          <asp:TextBox ID="student_phone" runat="server" required  class="form-control" placeholder="Phone Number"></asp:TextBox>
		      		</div>

	            <div class="form-group">
	              
<asp:TextBox ID="student_password" runat="server" class="form-control" placeholder="Enter The Password" TextMode="Password"></asp:TextBox>
	              <span toggle="#student_password" class="fa fa-fw fa-eye-slash field-icon toggle-password"></span>
	            </div>
                        	            <div class="form-group">
	              
<asp:TextBox ID="student_c_password" runat="server" class="form-control" placeholder="Enter The Password again" TextMode="Password"></asp:TextBox>
	              <span toggle="#student_c_password" class="fa fa-fw fa-eye-slash field-icon toggle-password"></span>
	            </div>
	            <div class="form-group">
            <asp:Button ID="Login" runat="server" Text="Register" class="form-control btn submit px-3" />
	            	
	            </div>
                        <asp:Label ID="lbl_msg" runat="server" Text=""></asp:Label>
	           <div class="w-50 text-md-right" >
                   <asp:LinkButton ID="Register" runat="server" style="color: #fff;background-color:transparent;border:none;margin-left:300px;" PostBackUrl="Login.aspx">Login</asp:LinkButton>
                   				
								</div>
	          

		      </div>
				</div>
			</div>
		</div>
	</section>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:Charusat_ProjectConnectionString %>' DeleteCommand="DELETE FROM [Student_Registration] WHERE [sr_id] = @sr_id" InsertCommand="INSERT INTO [Student_Registration] ([student_f_name], [student_l_name], [student_id], [student_email], [student_phone], [student_password]) VALUES (@student_f_name, @student_l_name, @student_id, @student_email, @student_phone, @student_password)" SelectCommand="SELECT * FROM [Student_Registration]" UpdateCommand="UPDATE [Student_Registration] SET [student_f_name] = @student_f_name, [student_l_name] = @student_l_name, [student_id] = @student_id, [student_email] = @student_email, [student_phone] = @student_phone, [student_password] = @student_password WHERE [sr_id] = @sr_id">
            <DeleteParameters>
                <asp:Parameter Name="sr_id" Type="Int32"></asp:Parameter>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="student_f_name" Type="String"></asp:Parameter>
                <asp:Parameter Name="student_l_name" Type="String"></asp:Parameter>
                <asp:Parameter Name="student_id" Type="String"></asp:Parameter>
                <asp:Parameter Name="student_email" Type="String"></asp:Parameter>
                <asp:Parameter Name="student_phone" Type="String"></asp:Parameter>
                <asp:Parameter Name="student_password" Type="String"></asp:Parameter>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="student_f_name" Type="String"></asp:Parameter>
                <asp:Parameter Name="student_l_name" Type="String"></asp:Parameter>
                <asp:Parameter Name="student_id" Type="String"></asp:Parameter>
                <asp:Parameter Name="student_email" Type="String"></asp:Parameter>
                <asp:Parameter Name="student_phone" Type="String"></asp:Parameter>
                <asp:Parameter Name="student_password" Type="String"></asp:Parameter>
                <asp:Parameter Name="sr_id" Type="Int32"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>
	<script src="js/jquery.min.js"></script>
  <script src="js/popper.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/main.js"></script>
    </form>
</body>
</html>
