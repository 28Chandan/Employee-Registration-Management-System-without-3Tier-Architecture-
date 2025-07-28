<%@ Page Title="About" Language="C#" MasterPageFile="~/PreLogIn.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Begening.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .aboutPageConatainer {
            background-color: beige;
            height: 120vh;
            display:flex;
            justify-content:center;
            align-items:center;
            flex-direction:column;
             

        }
        p{
            font-size:20px;
        }
    </style>
    <div id="aboutPageContainer" class="aboutPageConatainer">
        <h1>Hello everyone, welcome to about page</h1>
        <div id="imgContainer">
            <asp:Image ImageUrl="Images/flowchart.png" ID="Image1" runat="server" />
        </div>
        <div  id="paraContainer">
            <p>Vegam Solutions has been at the forefront of the digital transformation in manufacturing for over two decades, focusing on creating smarter and safer plants through human-centric digital solutions. Our mission emphasizes empowering operators, believing that satisfied employees drive efficiency and profitability across enterprises of all sizes. The company fosters a culture of continuous innovation, rigorously testing new technologies to address diverse customer challenges, from large-scale operations to standalone units. This customer-centric approach has led Vegam to develop comprehensive solution frameworks that integrate seamlessly into various business landscapes.</p>
            <p>With the advent of Gen AI, Vegam is proud to introduce the world’s first collaborative AI for manufacturing—a system that seamlessly integrates Cognitive Systems, Agentic AI, and Physical AI to enhance shop floor operations. This next-generation AI empowers factories to interact naturally with its employees, make intelligent decisions in real-time, and execute tasks autonomously, driving efficiency and adaptability like never before.</p>
            <p>Committed to sustainability and eco-friendly practices, Vegam also engages in initiatives like supporting young women’s education and aiding startups through financial support and resource sharing.</p>
        </div>
    </div>

</asp:Content>
