<%@ Page Title="Registration" Language="C#" MasterPageFile="~/PreLogIn.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Begening.Registration" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <asp:Button ID="LogInBtn" CssClass="LogInBtn" runat="server" CausesValidation="false" Text="LogIn" OnClick="LogInBtn_Click" />


</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <style>
        .LogInBtn {
            font-size: 20px;
            background-color: aqua;
            height: 30px;
            width: 90px;
            display: flex;
            justify-content: center;
            align-items: center;
            border: 2px solid black;
            border-radius: 6px;
            margin-left: 950px;
        }

            .LogInBtn:hover {
                background-color: dimgray;
                color: white;
                cursor: pointer;
            }

        #registrationContainer {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 150vh;
            background-color: beige;
        }

        #registrationBox {
            height: auto;
            width: 920px;
            background-color: white;
            border: 2px solid black;
            border-radius: 8px;
        }

        .regItem {
            border-radius: 8px;
            background-color: #FCF5D8;
            Height: 35px;
            Width: 616px;
        }

        .UserDetails {
            display: inline-block;
            width: 150px; 
        }

        .deptddl {
            border: 2px solid black;
        }

        #submitContainer {
            display: flex;
            justify-content: center;
        }
    </style>

    <div id="form22">
        <div id="registrationContainer">

            <div id="registrationBox">
                <h1 style="text-align: center">User Registration</h1>

                <div id="firstNameContainer" style="padding-left: 15px">
                    <label id="firstName" class="UserDetails">First Name:&nbsp; </label>
                    <asp:TextBox ID="firstNameTxt" ClientIDMode="Static" AutoPostBack="false" CssClass="regItem" runat="server"></asp:TextBox>

                </div>

                <br />

                <div id="lastNameContainer" style="padding-left: 15px">
                    <label id="lastName" class="UserDetails">Last Name:&nbsp;&nbsp; </label>
                    <asp:TextBox ID="lastNameTxt" ClientIDMode="Static" CssClass="regItem" runat="server"></asp:TextBox>
                </div>

                <br />


                <div id="emailContainer" style="padding-left: 15px">
                    <label id="email" class="UserDetails">Email ID:</label>

                    <asp:TextBox ID="emailTxt" ClientIDMode="Static" CssClass="regItem" runat="server"></asp:TextBox>


                    <br />
                </div>


                <br />

                <div id="usernameContainer" style="padding-left: 15px">
                    <label id="username" class="UserDetails">Username:&nbsp;&nbsp; </label>
                    <asp:TextBox ID="usernameTxt" ClientIDMode="Static" CssClass="regItem" runat="server"></asp:TextBox>
                </div>

                <br />

                <div id="passwordContainer" style="padding-left: 15px">
                    <label id="Password" class="UserDetails">Password:</label>

                    <asp:TextBox ID="passwordTxt" ClientIDMode="Static" CssClass="regItem" runat="server" TextMode="Password"></asp:TextBox>

                    <br />
                </div>
                <br />

                <div id="confirmPasswordContainer" style="padding-left: 15px">
                    <label id="confirmPassword" class="UserDetails">Confirm Password: </label>
                    <asp:TextBox ID="confirmPasswordTxt" ClientIDMode="Static" CssClass="regItem" runat="server" TextMode="Password"></asp:TextBox>


                </div>

                <br />

                <div id="deptContainer" style="padding-left: 15px">
                    <label id="dept" class="UserDetails">Department: </label>
                    <asp:DropDownList ID="deptddl" ClientIDMode="Static" CssClass="regItem" runat="server"></asp:DropDownList>

                </div>

                <br />

                <div id="resumeContainer" style="padding-left: 15px">
                    <label id="resume" class="UserDetails">Upload Your Resume: </label>
                    <asp:FileUpload ID="resumeUpload" ClientIDMode="Static" runat="server" />

                </div>
                <br />
                <asp:Label ID="submitLbl" runat="server"></asp:Label>

                <div id="ErrorLogs" style="color: red;">
                </div>

                <br />
                <br />
                <div id="submitContainer" style="padding-left: 15px">


                    <asp:Button ID="submitButton" runat="server" Height="33px" Width="363px" Text="Submit" BackColor="green" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" OnClick="submitButton_Click" OnClientClick="return validations();" />
                    <asp:Button ID="Button1" runat="server" Text="Clear" Width="369px" BackColor="Red" BorderColor="Black" Height="33px" OnClientClick="resetForm(); return false;" />
                </div>
                <br />
                <br />

            </div>
        </div>
    </div>
    <script src="/JavaScript/Script.js"></script>




</asp:Content>
