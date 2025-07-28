<%@ Page Title="Home" Language="C#" MasterPageFile="~/PreLogIn.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Begening.home" %>
<%@ OutputCache Duration="40" VaryByParam="none" %>
 
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        #homePageConatainer {
            background-color: pink;
            height: 250vh;
        }

        #firstLine {
            height: auto;
            background-color: #0D6EFD;
            border: 2px solid black;
        }

        #firstHeadingInsideFirstLine {
            font-size: 60px;
            color: white;
            font-weight: bolder;
            text-align: center;
            margin-bottom: 0px;
        }

        #secondHeadingInsideFirstLine {
            color: white;
            font-weight: bolder;
            text-align: center;
            margin-top: 0px;
        }

        .loginBtn {
            margin-left: 600px;
            margin-bottom: 20px;
            /*transition: all 2s ease-in;*/
            background-color: White;
            border: 2px solid black;
            font-weight: bold;
            Font-Size: 25px;
            Color: Black;
            Height: 43px;
            Width: 235px;
        }

            .loginBtn:hover {
                background-color: dimgray;
                color: white;
                cursor: pointer;
            }





        #secondLine {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        #Boxes {
            display: flex;
            flex-direction: row;
            justify-content: space-around;
        }

        #Boxes2 {
            display: flex;
            flex-direction: row;
            justify-content: space-around;
        }

        .threeBoxes {
            margin-right: 20px;
            border: 2px solid black;
            background-color: pink;
            height: 100px;
            width: 380px;
            border-radius: 8px;
        }

        .threeBoxes2 {
            margin-right: 20px;
            border: 2px solid black;
            background-color: pink;
            height: 300px;
            width: 380px;
        }

        #fourthLine {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        .Image1 {
            height: 220px;
            width: 140px;
            object-fit: contain;
            display: flex;
            justify-content: center;
            text-align: center;
        }

        .imgDiv {
            display: flex;
            justify-content: center;
            text-align: center;
        }
    </style>

    <div id="homePageContainer" class="homePageConatainer">
        <div id="firstLine">
            <h1 id="firstHeadingInsideFirstLine">Welcome to Vegam Employee Portal </h1>
            <h2 id="secondHeadingInsideFirstLine">Empowering Smart Manufacturing Through You</h2>
            <br />
            <asp:Button ID="loginBtn" CssClass="loginBtn" runat="server" Text="Login"
                OnClick="loginBtn_Click" ToolTip="login button" />
        </div>

        <div id="secondLine">
            <h1 style="margin-bottom: 0px;">About Vegam Solutions </h1>
            <h2 style="text-align: center; font-size: 20px; font-weight: 300">Vegam Solutions is a global digital manufacturing company offering real-time factory visibility, insights, and control solutions. We innovate for efficiency and excellence in every aspect of your manufacturing process.</h2>

        </div>


        <div id="thirdLine">
            <h1 style="text-align: center">Our Core Solutions</h1>
            <div id="Boxes">
                <div id="firstBox" style="margin-left: 70px; margin-right: 70px; display: flex; flex-direction: column; justify-content: center" class="threeBoxes">
                    <h4 style="text-align: center; font-size: 20px; color: dodgerblue; margin-bottom: 10px;">Smart Manufacturing</h4>
                    <p style="text-align: center; margin-top: 1px">Digitize your shop floor for real-time data-driven decisions.</p>
                    <br />
                </div>
                <div id="secondBox" style="margin-left: 170px; margin-right: 70px; display: flex; flex-direction: column; justify-content: center" class="threeBoxes">
                    <h4 style="text-align: center; font-size: 20px; color: dodgerblue; margin-bottom: 10px;">IoT Integrations</h4>
                    <p style="text-align: center; margin-top: 1px">Connect assets and monitor them with intelligent IoT layers.</p>
                    <br />
                </div>
                <div id="thirdBox" style="margin-left: 170px; margin-right: 70px; display: flex; flex-direction: column; justify-content: center" class="threeBoxes">
                    <h4 style="text-align: center; font-size: 20px; color: dodgerblue; margin-bottom: 10px;">Analytics & Insights</h4>
                    <p style="text-align: center; margin-top: 1px">Access actionable KPIs, downtime data, and predictive reports.</p>
                    <br />
                </div>
            </div>
        </div>


        <div id="fourthLine">
            <h1 style="margin-bottom: 0px;">Our Work Culture</h1>
            <h2 style="text-align: center; font-size: 20px; font-weight: 300">We foster innovation, collaboration, and continuous learning. Our team works globally, shares knowledge, and thrives together.</h2>

        </div>

        <div id="fifthLine" style="height: auto">
            <h1 style="text-align: center">Leadership at vegam</h1>
            <div id="Boxes2">
                <div id="firstBox2" style="margin-left: 70px; margin-right: 70px; display: flex; flex-direction: column; justify-content: center" class="threeBoxes2">
                    <div id="div11" class="imgDiv" style="border: 2px solid black; flex: 7">
                        <asp:Image ImageUrl="Images/CEO.jpg" ID="Image1" CssClass="Image1" runat="server" />
                    </div>
                    <div id="div21" style="border: 2px solid black; flex: 3">
                        <h5 style="margin-bottom: 0px; text-align: center; font-size: 20px; font-weight: bolder; margin-top: 0px">Subramanyam Kasibhat</h5>
                        <p style="margin-top: 0px; text-align: center;">The chief executive officer(CEO)</p>
                    </div>

                </div>
                <div id="secondBox2" style="margin-left: 170px; margin-right: 70px; display: flex; flex-direction: column; justify-content: center" class="threeBoxes2">
                    <div id="div12" class="imgDiv" style="border: 2px solid black; flex: 7">
                        <asp:Image ImageUrl="Images/CTO.jpg" ID="Image2" CssClass="Image1" runat="server" />
                    </div>
                    <div id="div22" style="border: 2px solid black; flex: 3">
                        <h5 style="margin-bottom: 0px; font-size: 20px; font-weight: bolder; text-align: center; margin-top: 0px">Savita Kasibhat </h5>
                        <p style="margin-top: 0px; text-align: center;">The Chief Technology Officer (CTO)</p>
                    </div>

                </div>
                <div id="thirdBox2" style="margin-left: 170px; margin-right: 70px; display: flex; flex-direction: column; justify-content: center" class="threeBoxes2">
                    <div id="div13" class="imgDiv" style="border: 2px solid black; flex: 7; justify-content: center; align-items: center">
                        <asp:Image ImageUrl="Images/anant.jpg" ID="Image3" CssClass="Image1" runat="server" />
                    </div>
                    <div id="div23" style="border: 2px solid black; flex: 3">
                        <h5 style="margin-bottom: 0px; font-size: 20px; font-weight: bolder; text-align: center; margin-top: 0px">Anant Kolhar</h5>
                        <p style="margin-top: 0px; text-align: center;">Vice President - Strategy & Operations</p>
                    </div>

                </div>
            </div>
        </div>
        <br />
        <br />

    </div>
</asp:Content>
