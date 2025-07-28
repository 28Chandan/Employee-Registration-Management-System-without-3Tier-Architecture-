using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;
using HelperClass1;
namespace Begening
{
    public partial class Login : System.Web.UI.Page
    {
        //string constrng = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;
        string constrng = Helper.ConnectionString();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Helper.AvoidCacheRepeatation(Response);
                userNameTxt.Text = "";
                passwordTxt.Text = "";
            }
        }




        protected void submitButton_Click(object sender, EventArgs e)
        {
            //THIS SNIPPET IS WRITTEN FOR HR LOGIN
            string quary1 = "SELECT * FROM EMPLOYEES WHERE USERNAME = @hr_username AND PASSWORD=@hr_password";

            using (MySqlConnection conn1 = new MySqlConnection(constrng))
            {
                conn1.Open();
                MySqlCommand cmd1 = new MySqlCommand(quary1, conn1);
                cmd1.Parameters.AddWithValue("@hr_username", userNameTxt.Text);
                cmd1.Parameters.AddWithValue("@hr_password", passwordTxt.Text);
                cmd1.Parameters.AddWithValue("@role", "1");
                MySqlDataReader reader1 = cmd1.ExecuteReader();
                if (reader1.HasRows)
                {
                    reader1.Read();
                    if (Convert.ToInt32(reader1["Role"]) == 1)
                    {
                        Session["Role"] = "HR";
                        Response.Redirect("HRProfile.aspx");
                        reader1.Close();
                        return;
                    }
                    else
                    {

                        reader1.Read();
                        if (reader1["Status"].ToString() == "Reject")
                        {
                            LoginLabel.Text = $"Your application was rejected, due to: {reader1["REJECT_REASON"].ToString()}, you can re-register";
                            LoginLabel.ForeColor = System.Drawing.Color.Red;
                        }
                        else if (reader1["Status"].ToString() == "Pending")
                        {
                            LoginLabel.Text = "Your application is in Pending state, wait for HR approval";
                            LoginLabel.ForeColor = System.Drawing.Color.Red;
                        }
                        else
                        {
                            Session["Role"] = "Employee";
                            Session["Username"] = userNameTxt.Text;
                            Response.Redirect("EmployeeProfile.aspx");
                            reader1.Close();
                        }

                    }
                }

                else
                {

                    LoginLabel.Text = "the username or the password is wrong";
                    LoginLabel.ForeColor = System.Drawing.Color.Red;
                }



                //LoginLabel.Text = "the username or the password is wrong";
                //LoginLabel.ForeColor = System.Drawing.Color.Red;

                //THIS IS FOR EMPLOYEE LOGIN




            }
        }




    }
}


//THIS IS FOR EMPLOYEE LOGIN

//AND (Status='Pending' OR Status ='Reject' OR Status ='Accept')
//string quary2 = "SELECT * FROM EMPLOYEES WHERE USERNAME =@username AND PASSWORD = @password";
//using(MySqlConnection conn2 = new MySqlConnection(constrng))
//{
//    conn2.Open();
//    MySqlCommand cmd2 = new MySqlCommand(quary2, conn2);
//    cmd2.Parameters.AddWithValue("@username", userNameTxt.Text);
//    cmd2.Parameters.AddWithValue("@password", passwordTxt.Text);
//    MySqlDataReader reader = cmd2.ExecuteReader();
//    if (reader.HasRows)
//    {
//        reader.Read();
//        if (reader["Status"].ToString() == "Reject")
//        {
//            LoginLabel.Text = $"Your application was rejected, due to: {reader["REJECT_REASON"].ToString()}, you can re-register";
//            LoginLabel.ForeColor = System.Drawing.Color.Red;
//        }
//        else if(reader["Status"].ToString() == "Pending")
//        {
//            LoginLabel.Text = "Your application is in Pending state, wait for HR approval";
//            LoginLabel.ForeColor = System.Drawing.Color.Red;
//        }
//        else
//        {
//            Session["Role"] = "Employee";
//            Session["Username"] = userNameTxt.Text;
//            Response.Redirect("EmployeeProfile.aspx");
//        }
//        reader.Close();
//    }
//    else
//    {
//        LoginLabel.Text = "the username or the password is wrong";
//        LoginLabel.ForeColor = System.Drawing.Color.Red;
//    }
//}



