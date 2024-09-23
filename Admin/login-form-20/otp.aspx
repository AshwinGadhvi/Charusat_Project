<%@ Page Language="VB" AutoEventWireup="false" CodeFile="otp.aspx.vb" Inherits="login_form_20_otp" %>

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
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Charusat CDPC & TPO  Dashboard</h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-6 col-lg-4">
					<div class="login-wrap p-0">
		      	<h3 class="mb-4 text-center">Admin Login</h3>

		      		<div class="form-group">
<asp:TextBox ID="otp" runat="server" class="form-control" placeholder="Otp" required></asp:TextBox>

		      		</div>

	            <div class="form-group">
                <asp:Button ID="submit" runat="server" Text="Confirm" class="form-control btn submit px-3" />
	            	
	            </div>



		      </div>
				</div>
			</div>
		</div>
	</section>

	<script src="js/jquery.min.js"></script>
  <script src="js/popper.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/main.js"></script>
    </form>
</body>
</html>
