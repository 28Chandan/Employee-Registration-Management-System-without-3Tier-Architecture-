<%@ Page Title="HR Profile" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/PostLogIn.Master" AutoEventWireup="true" CodeBehind="HRProfile.aspx.cs" Inherits="Begening.HRProfile" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div id="LogOutDiv" style="margin-left: 950px">
        <%--<a id="logOutAnchor" href="Login.aspx">LogOut</a>--%>
        <asp:Button ID="logOutAnchor" CssClass="logOutAnchor" CausesValidation="false" runat="server" Text="Log Out" OnClick="logOutAnchor_Click" />
    </div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .logOutAnchor {
            /* background-color: aqua;
            border-color: aqua;
            border: 0px solid aqua;
            border-radius: 0px;
            
            font-size: 20px;*/
            /* background-color: aqua;*/
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

            .logOutAnchor:hover {
                background-color: dimgray;
                background-color: #374151;
                color: white;
                cursor: pointer;
            }

        /*     #LogOutDiv {
            font-size: 20px;
            background-color: aqua;
            height: 25px;
            width: 110px;
            display: flex;
            justify-content: center;
            align-items: center;
            border: 2px solid black;
            border-radius: 6px;
            cursor: pointer;
            margin-right: 25px;
        }

            #LogOutDiv:hover {
                background-color: dimgray;
                background-color: #374151;
                color: white;
                cursor: pointer;
            }*/


        .HDDivs {
            height: auto;
            margin-bottom: 10px;
            background-color: beige;
            padding-left: 30px;
            display: flex;
            justify-content: space-around;
            align-items: center;
        }

        #HRDashboard {
            height: 200px;
        }

        #ARButton {
            background-color: green;
        }

        #pending {
            display: flex;
            flex-direction: column;
        }

        #approved {
            display: flex;
            flex-direction: column;
        }

        #rejected {
            display: flex;
            flex-direction: column;
        }

        #departments {
            display: flex;
            flex-direction: column;
        }

        #HRCount {
            display: flex;
            flex-direction: column;
        }

        #addDivContainer {
            display: flex;
            flex-direction: row;
        }

        #HRDashboardContainer {
            display: flex;
            flex-direction: row;
        }

        .countDivs {
            border: 2px solid black;
            margin-right: 80px;
            height: 100px;
            width: 200px;
            border-radius: 10px;
            background-color: pink;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .labels {
            Height: 50px;
            Width: 50px;
            border: 2px solid black;
            color: white;
            font-size: 25px;
            font-weight: bolder;
            background-color: black;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 10px;
        }

        .HRBtn {
            margin-left: 74px;
        }

        .centered-grid {
            margin: 0 auto;
        }

            .centered-grid td,
            .centered-grid th {
                text-align: center;
            }

        #GridView1 {
            margin-left: 50px;
        }

        #GridView2 {
            margin-left: 50px;
        }

        input[type="submit"] {
            cursor: pointer;
        }

        button {
            cursor: pointer;
        }

        
    </style>
    <div id="HRContainer">
        <h1 style="text-align:center">Welcome to HR DashBoard</h1>


        <div id="HRDashboard" class="HDDivs">

            <div id="HRDashboardContainer">
                <div style="display: flex; flex-direction: column;">
                    <h4 style="margin-left: 70px; margin-bottom: 0px;">Total Count</h4>
                    <div id="totalEmpCount" class="countDivs">
                        <asp:Label ID="totalCountLbl" CssClass="labels" runat="server"></asp:Label>
                    </div>
                </div>

                <div style="display: flex; flex-direction: column;">
                    <h4 style="margin-left: 0px; margin-bottom: 0px;">Total Accepted Employee Count</h4>
                    <div id="totalAcceptedEmpCount" class="countDivs">
                        <asp:Label ID="totalAcceptedEmpCountLbl" CssClass="labels" runat="server"></asp:Label>
                    </div>
                </div>


                <div style="display: flex; flex-direction: column;">
                    <h4 style="margin-left: 0px; margin-bottom: 0px;">Total Rejected Employee Count</h4>
                    <div id="totalRejectedEmpCount" class="countDivs">
                        <asp:Label ID="totalRejectedEmpCountLbl" CssClass="labels" runat="server"></asp:Label>
                    </div>
                </div>

                <div style="display: flex; flex-direction: column;">
                    <h4 style="margin-left: 0px; margin-bottom: 0px;">Total Pending Employee Count</h4>
                    <div id="totalPendingEmpCount" class="countDivs">
                        <asp:Label ID="totalPendingEmpCountLbl" CssClass="labels" runat="server"></asp:Label>
                    </div>
                </div>

                <div style="display: flex; flex-direction: column;">
                    <h4 style="margin-left: 0px; margin-bottom: 0px;">Total Department Count</h4>
                    <div id="totalDeptCount" class="countDivs">
                        <asp:Label ID="totalDeptCountLbl" CssClass="labels" runat="server"></asp:Label>
                    </div>
                </div>
            </div>


        </div>


        <div id="pending" class="HDDivs">
            <h1>List of Pending Employees</h1>
            
            <asp:UpdatePanel ID="updComments" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:Label ID="CommentLbl" runat="server" ></asp:Label>
                    <asp:GridView ID="GridView1" CssClass="centered-grid" AutoGenerateColumns="False" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" OnRowCommand="GridView1_RowCommand" Height="19px" Width="1417px">
                        <Columns>
                            <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                            <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                            <asp:BoundField DataField="EmailID" HeaderText="Email ID" />
                            <asp:BoundField DataField="Department" HeaderText="Department" />

                            <asp:TemplateField HeaderText="Resume">
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Images/resumeIcon.png" NavigateUrl='<%# Eval("ResumePath") %>'>Resume</asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:Button ID="AcceptButton" runat="server" BackColor="Green" CommandName="Accept" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" CommandArgument='<%# Eval("empID") %>' Text="Accept" />
                                    <asp:Button ID="RejectButton" runat="server" BackColor="Red" CommandName="Reject" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" CommandArgument='<%# Eval("empID") %>' Text="Reject" />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Comments">
                                <ItemTemplate>
                                    <asp:Panel ID="commentPanel" runat="server" Visible="false">
                                        <asp:TextBox ID="commentTxt" runat="server" TextMode="MultiLine" Rows="3" Columns="20"></asp:TextBox>
                                        <asp:Button ID="commentSubmitButton" runat="server" Text="Submit" CommandArgument='<%# Eval("empID") %>' CommandName="Comments" />
                                    </asp:Panel>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FFF1D4" />
                        <SortedAscendingHeaderStyle BackColor="#B95C30" />
                        <SortedDescendingCellStyle BackColor="#F1E5CE" />
                        <SortedDescendingHeaderStyle BackColor="#93451F" />
                    </asp:GridView>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowCommand" />
                </Triggers>
            </asp:UpdatePanel>





            <br />
            <br />
        </div>

        <div id="approved" class="HDDivs">
            <h1>List of Approved Employees</h1>
            <br />
            <br />

            <asp:UpdatePanel ID="updGridView2" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:GridView ID="GridView2" CssClass="centered-grid" AutoGenerateColumns="False" runat="server"
                        BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px"
                        CellPadding="3" CellSpacing="2" DataKeyNames="empID"
                        OnRowEditing="GridView2_RowEditing"
                        OnRowUpdating="GridView2_RowUpdating"
                        OnRowCancelingEdit="GridView2_RowCancelingEdit"
                        OnRowDeleting="GridView2_RowDeleting"
                        OnRowCommand="GridView2_RowCommand"
                        Height="299px" Width="1417px">
                        <Columns>
                            <asp:BoundField DataField="empID" HeaderText="Employee ID" ReadOnly="True" SortExpression="empID" />
                            <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                            <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                            <asp:BoundField DataField="EmailID" HeaderText="Email ID" />
                            <asp:BoundField DataField="Department" HeaderText="Department" />

                            <asp:TemplateField HeaderText="Resume">
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" BackColor="#FF6600" BorderColor="Black"
                                        BorderStyle="Solid" ForeColor="White"
                                        NavigateUrl='<%# Eval("ResumePath") %>'>Resume</asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:CommandField ButtonType="Button" HeaderText="Action" ShowEditButton="True" />
                            <asp:CommandField ButtonType="Image" HeaderText="Delete User"
                                ShowDeleteButton="True" ShowHeader="True" DeleteImageUrl="~/Images/delete.png">
                                <ControlStyle />
                            </asp:CommandField>

                            <asp:TemplateField HeaderText="View Employee">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/imageBtn.png"
                                        CommandArgument='<%# Eval("empID") %>' CommandName="viewEmployee" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>

                        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FFF1D4" />
                        <SortedAscendingHeaderStyle BackColor="#B95C30" />
                        <SortedDescendingCellStyle BackColor="#F1E5CE" />
                        <SortedDescendingHeaderStyle BackColor="#93451F" />
                    </asp:GridView>
                </ContentTemplate>

                <Triggers>

                    <asp:AsyncPostBackTrigger ControlID="GridView2" EventName="RowCommand" />
                </Triggers>
            </asp:UpdatePanel>


            <%--<asp:GridView ID="GridView2" CssClass="centered-grid" AutoGenerateColumns="False" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="empID" OnRowEditing="GridView2_RowEditing" OnRowUpdating="GridView2_RowUpdating" OnRowCancelingEdit="GridView2_RowCancelingEdit" OnRowDeleting="GridView2_RowDeleting" Height="299px" Width="1417px" OnRowCommand="GridView2_RowCommand">
                <Columns>
                    <asp:BoundField DataField="empID" HeaderText="Employee_ID" ReadOnly="True" SortExpression="empID" />
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" />
                    <asp:BoundField DataField="EmailID" HeaderText="EmailID" />
                    <asp:BoundField DataField="Department" HeaderText="Department" />

                    <asp:TemplateField HeaderText="ResumePath">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server" BackColor="#FF6600" BorderColor="Black" BorderStyle="Solid" ForeColor="White" NavigateUrl='<%# Eval("ResumePath") %>'>Resume</asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:CommandField ButtonType="Button" HeaderText="Action" ShowEditButton="True" />
                    <asp:CommandField ButtonType="Image" HeaderText="Delete_user" ShowDeleteButton="True" ShowHeader="True" DeleteImageUrl="~/Images/delete.png">
                        <ControlStyle />
                    </asp:CommandField>
                    <asp:TemplateField HeaderText="View Employee">
                        <ItemTemplate>

                            <asp:ImageButton ID="ImageButton1" ImageUrl="~/Images/imageBtn.png" CommandArgument='<%# Eval("empID") %>' CommandName="viewEmployee" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                <SortedDescendingHeaderStyle BackColor="#93451F" />

            </asp:GridView>--%>
            <br />
            <br />
        </div>

        <div id="rejected" class="HDDivs">
            <h1>List of Rejected Employees</h1>
            <br />
            <br />



            <asp:GridView ID="GridView4" CssClass="centered-grid" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" Height="299px" Width="1417px" CellSpacing="2" DataKeyNames="empID">
                <Columns>
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                    <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                    <asp:BoundField DataField="EmailID" HeaderText="Email ID" />
                    <asp:BoundField DataField="Department" HeaderText="Department" />
                    <asp:TemplateField HeaderText="Resume">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink2" runat="server" BackColor="Orange" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" ForeColor="White" NavigateUrl='<%# Eval("ResumePath") %>'>Resume</asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                <SortedDescendingHeaderStyle BackColor="#93451F" />
            </asp:GridView>
            <br />
            <br />
        </div>

        <div id="departments" class="HDDivs">
            <h1 style="text-align: center">List of Departments</h1>
            <br />
            <br />
            <%--<div id="addDivContainer">
                <asp:TextBox ID="addDeptText" runat="server" Height="47px" Width="1066px"></asp:TextBox>
                <asp:Button ID="submitDept" runat="server" Text="Add" BackColor="Green" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" Font-Size="20px" ForeColor="White" Height="50px" OnClick="submitDept_Click" Width="130px" />
            </div>
            <br />
            <asp:Label ID="deptLabel" runat="server" ForeColor="red"></asp:Label>
            <br />
            <br />
            <asp:GridView ID="GridView3" CssClass="centered-grid" runat="server" AutoGenerateColumns="False" CellPadding="3" DataKeyNames="deptID" Width="469px" OnRowDeleting="GridView3_RowDeleting" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2">
                <Columns>
                    <asp:BoundField DataField="deptID" HeaderText="Dept_ID" ReadOnly="True" SortExpression="deptID" />
                    <asp:BoundField DataField="dept" HeaderText="Department" />
                    <asp:CommandField ButtonType="Image" HeaderText="Delete Department" ShowDeleteButton="True" ShowHeader="True" DeleteImageUrl="~/Images/delete.png">
                        <ControlStyle />
                    </asp:CommandField>
                </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                <SortedDescendingHeaderStyle BackColor="#93451F" />
            </asp:GridView>--%>



            <asp:UpdatePanel ID="updDept" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div id="addDivContainer">
                        <asp:TextBox ID="addDeptText" runat="server" Height="47px" Width="1066px" />
                        <asp:Button ID="submitDept" runat="server" Text="Add"
                            BackColor="Green" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px"
                            Font-Bold="True" Font-Size="20px" ForeColor="White" Height="50px"
                            OnClick="submitDept_Click" Width="130px" />
                    </div>
                    <br />
                    <asp:Label ID="deptLabel" runat="server" ForeColor="red" />
                    <br />
                    <br />
                    <asp:GridView ID="GridView3" CssClass="centered-grid" runat="server"
                        AutoGenerateColumns="False" CellPadding="3" DataKeyNames="deptID"
                        Width="469px" OnRowDeleting="GridView3_RowDeleting"
                        BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None"
                        BorderWidth="1px" CellSpacing="2">
                        <Columns>
                            <asp:BoundField DataField="deptID" HeaderText="Dept ID" ReadOnly="True" SortExpression="deptID" />
                            <asp:BoundField DataField="dept" HeaderText="Department" />
                            <asp:CommandField ButtonType="Image" HeaderText="Delete Department"
                                ShowDeleteButton="True" ShowHeader="True" DeleteImageUrl="~/Images/delete.png" />
                        </Columns>
                        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FFF1D4" />
                        <SortedAscendingHeaderStyle BackColor="#B95C30" />
                        <SortedDescendingCellStyle BackColor="#F1E5CE" />
                        <SortedDescendingHeaderStyle BackColor="#93451F" />
                    </asp:GridView>
                </ContentTemplate>
                <Triggers>

                    <asp:AsyncPostBackTrigger ControlID="submitDept" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="GridView3" EventName="RowDeleting" />
                </Triggers>
            </asp:UpdatePanel>

            <br />
            <br />

        </div>



        <div id="HRCount" class="HDDivs">
            <h1 style="text-align: center">List of HRs</h1>
            <br />
            <br />
            <asp:UpdatePanel ID="updHR" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div id="addHRDivContainer">
                        <label>Username: </label>
                        <asp:TextBox ID="HRtxt" runat="server"
                            Height="47px" Width="500px"
                            BackColor="#FCF5D8" BorderColor="Black"
                            BorderStyle="Solid" BorderWidth="2px"
                            ForeColor="Black" />

                        <br />
                        <label>Password : </label>
                        <asp:TextBox ID="HRPassWordtxt" runat="server"
                            Height="47px" Width="500px"
                            TextMode="Password"
                            BackColor="#FCF5D8" BorderColor="Black"
                            BorderStyle="Solid" BorderWidth="2px"
                            ForeColor="Black" />

                        <br />
                        <br />
                        
                        <asp:Button ID="HRBtn" CssClass="HRBtn" runat="server" Text="Add"
                            BackColor="Green" BorderColor="Black"
                            BorderStyle="Solid" BorderWidth="2px"
                            Font-Bold="True" Font-Size="20px"
                            ForeColor="White" Height="50px" Width="130px"
                            OnClick="HRBtn_Click" />

                        <br />
                        <br />
                        <asp:Label ID="addHRLabel" runat="server" ForeColor="Red" />
                        <br />
                        <br />

                        <asp:GridView ID="HRCountGridView" CssClass="centered-grid" runat="server"
                            AutoGenerateColumns="False" CellPadding="3" Height="221px"
                            OnRowDeleting="HRCountGridView_RowDeleting" Width="485px"
                            DataKeyNames="empID"
                            BackColor="#DEBA84" BorderColor="#DEBA84"
                            BorderStyle="None" BorderWidth="1px" CellSpacing="2">
                            <Columns>
                                <asp:BoundField DataField="empID" HeaderText="HR ID" />
                                <asp:BoundField DataField="Username" HeaderText="HR Name" />
                                <asp:CommandField ButtonType="Image" HeaderText="Delete"
                                    ShowDeleteButton="True" DeleteImageUrl="~/Images/delete.png" />
                            </Columns>

                            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#FFF1D4" />
                            <SortedAscendingHeaderStyle BackColor="#B95C30" />
                            <SortedDescendingCellStyle BackColor="#F1E5CE" />
                            <SortedDescendingHeaderStyle BackColor="#93451F" />
                        </asp:GridView>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="HRBtn" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="HRCountGridView" EventName="RowDeleting" />
                </Triggers>
            </asp:UpdatePanel>


            <br />
            <br />

        </div>
    </div>

</asp:Content>
