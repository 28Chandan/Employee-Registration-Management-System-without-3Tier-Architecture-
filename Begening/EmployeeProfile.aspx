<%@ Page Title="Employee Profile" MaintainScrollPositionOnPostback="true" Language="C#" MasterPageFile="~/PostLogIn.Master" AutoEventWireup="true" CodeBehind="EmployeeProfile.aspx.cs" Inherits="Begening.employeeProfile" %>
<%--<%@ OutputCache Location="None" NoStore="true" VaryByParam="none" %>--%>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:UpdatePanel ID="updLogOutBtn" runat="server"><ContentTemplate>

                     
    <asp:Button ID="logOutBtn" CausesValidation="false" class="logOutBtn" runat="server" Text="Log Out" OnClick="homeBtn_Click" />

        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="logOutBtn" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <%--<body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
        <script>
            function noBack() {
                window.history.forward();
            }
        </script>--%>

        <style>
           /* .logOutBtn {
                font-size: 20px;
                background-color: aqua;
                height: 25px;
                width: 90px;
                display: flex;
                justify-content: center;
                align-items: center;
                border: 2px solid black;
                border-radius: 6px;
                margin-left: 950px;
                cursor: pointer;
            }*/

            .logOutBtn {
            margin-left: 950px;
            font-size: 20px;
            background-color: #14B8A6;
            height: 30px;
            width: 110px;
            display: flex;
            justify-content: center;
            align-items: center;
            border: 2px solid #0f766e;
            border-radius: 6px;
            margin-right: 25px;
            cursor: pointer;
        }

            .logOutBtn:hover {
                background-color: dimgray;
                background-color: #374151;
                color: white;
                cursor: pointer;
            }

            #employeeProfileContainer {
                display: flex;
                justify-content: center;
                align-items: center;
                background-color: beige;
                height: 120vh;
            }

            #employeeProfileBox {
                height: 650px;
                width: 90%;
                background-color: white;
                border: 2px solid black;
                border-radius: 8px;
            }



            .lines {
                height: 80px;
                margin-bottom: 10px;
                background-color: #FCF5D8;
                padding-left: 30px;
                display: flex;
                justify-content: space-around;
                align-items: center;
            }

            #thirdLine {
                height: 80px;
                margin-bottom: 10px;
                background-color: #FCF5D8;
                padding-left: 160px;
            }

            .textBoxes {
                border-radius: 8px;
                Height: 31px;
                Width: 184px;
            }

            .adressTxt {
                border-radius: 8px;
            }

            #FourthLine {
                padding-left: 160px;
            }

            .submitBtn {
                border-radius: 8px;
                cursor: pointer;
            }
        </style>
        <div id="employeeProfileContainer">
            <div id="employeeProfileBox">
                <h1 style="text-align: center">Employee Profile Page</h1>

                <div id="firstLine" class="lines">
                    <div id="firstNameDiv">
                        <label>First Name </label>
                        <br />
                        <asp:TextBox ID="firstNameTxt" CssClass="textBoxes" runat="server"></asp:TextBox>
                    </div>
                    <div id="lastNameDiv">
                        <label>Last Name </label>
                        <br />
                        <asp:TextBox ID="lastNameTxt" CssClass="textBoxes" runat="server"></asp:TextBox>
                    </div>
                    <div id="emailDiv">
                        <label>Email ID</label><br />
                        <asp:TextBox ID="emailTxt" CssClass="textBoxes" runat="server"></asp:TextBox>
                    </div>
                </div>


                <div id="secondLine" class="lines">
                    <div id="mobileNumDiv">
                        <label>Mobile Number </label>
                        <br />
                        <asp:TextBox ID="mobileNumTxt" CssClass="textBoxes" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ForeColor="Red" ControlToValidate="mobileNumTxt" runat="server" ErrorMessage="Please enter a valid 10-digit mobile number starting with 6, 7, 8, or 9." Text="*" ValidationExpression="^[6-9]\d{9}$"></asp:RegularExpressionValidator>
                    </div>
                    <div id="genderDiv">
                        <label>Gender</label><br />
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                            <asp:ListItem>Other</asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Text="*" ForeColor="Red" ControlToValidate="RadioButtonList1" ErrorMessage="Please enter the gender"></asp:RequiredFieldValidator>
                    </div>
                    <div id="deptDiv">
                        <label>Department</label><br />
                        <asp:TextBox ID="deptTxt" CssClass="textBoxes" runat="server"></asp:TextBox>
                    </div>
                </div>


                <div id="thirdLine">

                    <label>Address</label><br />
                    <asp:TextBox ID="adressTxt" class="adressTxt" runat="server" Height="57px" Width="654px" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" TextMode="MultiLine"></asp:TextBox>

                </div>
                <br />


                <div id="FourthLine">

                    <asp:Button ID="submitBtn" CssClass="submitBtn" runat="server" Text="Submit" Height="49px" Width="270px" BackColor="#006600" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" OnClick="submitBtn_Click" />
                    <asp:Label ID="submitLbl" runat="server"></asp:Label>
                    <asp:ValidationSummary ID="ValidationSummary1" HeaderText="Check these fields" ForeColor="red" runat="server" />
                </div>


            </div>


        </div>
    <%--<script type="text/javascript">
      if (window.performance && window.performance.navigation.type === 2) {
        // This is a back/forward navigation, force reload
        window.location.reload();
    }
    </script>--%>
</asp:Content>
