<%@ Page Title="" Language="VB" MasterPageFile="~/Admin.master" AutoEventWireup="false" CodeFile="Admin_Master.aspx.vb" Inherits="Admin_Master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager> 
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
                    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Admin Master</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
              <li class="breadcrumb-item active">Admin Master</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
                <!-- Form-->
                <div class="col-md-6">
            <!-- general form elements -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Admin Master</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form>
                <div class="card-body">
                  <div class="form-group">
                    <label for="exampleInputEmail1">Admin Name</label>
                    <asp:TextBox ID="user_name" runat="server" class="form-control" placeholder="Enter Name"></asp:TextBox>

                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">Password</label>
                    <asp:TextBox ID="user_password" runat="server"  placeholder="Enter Password" class="form-control" TextMode="Password"></asp:TextBox>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputFile">User Type</label>
<asp:DropDownList ID="user_type" runat="server" CssClass="form-control">

                    <asp:ListItem ReadOnly="true">Select Type</asp:ListItem>
                    <asp:ListItem>Admin</asp:ListItem>
                    <asp:ListItem>User</asp:ListItem>
                </asp:DropDownList>
                  </div>
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Submit</button>
                </div>
              </form>
            </div>
            <!-- /.card -->


          </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

