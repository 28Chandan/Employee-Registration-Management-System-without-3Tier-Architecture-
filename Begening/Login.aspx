<%@ Page Title="Login Page" Language="C#" MasterPageFile="~/PreLogIn.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Begening.Login" %>
<%--<%@ OutputCache Location="None" NoStore="true" VaryByParam="none" %>--%>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <style>

        #loginContainer {
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: lightpink;
            height: 100vh;
        }


        #loginBox {
            height: 450px;
            width: 350px;
            background-color: white;
            border: 2px solid black;
            border-radius: 8px;
        }

        #userName {
            font-size: 20px;
            font-weight: bold;
            padding-left: 4px;
            display: block;
        }


        #password {
            font-size: 20px;
            font-weight: bold;
            padding-left: 4px;
            display: block;
        }

        .submitButton{
            cursor:pointer;
        }
        
    </style>
    <div id="loginContainer">
        <div id="loginBox">

            <h1 style="text-align: center">Login page</h1>
                <div id="userNameContainer" style="padding-left: 15px">
                <label id="userName">User Name: </label>
                <asp:TextBox ID="userNameTxt" runat="server" Height="26px" Width="306px"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="RequiredFieldValidator7"
                    runat="server"
                    ForeColor="red"
                    Text="*"
                    ErrorMessage="enter the Username"
                    EnableClientScript="true"
                    Display="Dynamic"
                    ControlToValidate="userNameTxt">
                </asp:RequiredFieldValidator>
            </div>
            <br />

            <div id="passwordContainer" style="padding-left: 15px">
                <label id="password">Password: </label>
                <asp:TextBox ID="passwordTxt" runat="server" Height="26px" Width="306px" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="RequiredFieldValidator1"
                    runat="server"
                    ForeColor="red"
                    Text="*"
                    ErrorMessage="enter the password"
                    EnableClientScript="true"
                    Display="Dynamic"
                    ControlToValidate="passwordTxt">
                </asp:RequiredFieldValidator>
            </div>

            <asp:ValidationSummary 
                ID="ValidationSummary1" 
                ForeColor="Red" 
                ShowSummary="true" 

                HeaderText="check these values"  
                runat="server" />

            <asp:Label ID="LoginLabel" runat="server"></asp:Label>

            <br />
            <br />

            <div id="submitContainer" style="padding-left: 15px">
                <asp:Button ID="submitButton" class="submitButton" runat="server" Height="33px" Width="306px" Text="Submit" BackColor="#0066FF"  BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" OnClick="submitButton_Click" />
            </div>

            <br />
            <br />
            <h3 style="padding-left: 15px">Dont have an account? <a href="Registration.aspx">Sign in
                  <asp:Label ID="Label1" runat="server"></asp:Label>
            </a></h3>




        </div>


    </div>

</asp:Content>
