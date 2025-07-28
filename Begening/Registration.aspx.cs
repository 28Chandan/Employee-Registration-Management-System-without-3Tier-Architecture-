using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.IO;
using System.Threading;
using HelperClass1;
namespace Begening
{
    public partial class Registration : System.Web.UI.Page
    {
        //string constrng = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;
        string constrng = Helper.ConnectionString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)

            {
                string quary = "SELECT DEPTID, DEPT FROM DEPARTMENT";
                using (MySqlConnection conn = new MySqlConnection(constrng))
                {
                    conn.Open();
                    MySqlCommand cmd = new MySqlCommand(quary, conn);
                    deptddl.DataSource = cmd.ExecuteReader();
                    deptddl.DataValueField = "deptID";
                    deptddl.DataTextField = "dept";
                    deptddl.DataBind();
                    deptddl.Items.Insert(0, "Select");
                }
            }
        }
        protected void Clear()
        {
            lastNameTxt.Text = "";
            emailTxt.Text = "";
            usernameTxt.Text = "";
            passwordTxt.Text = "";
            deptddl.SelectedItem.Text = "";

        }


        protected void LogInBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
        protected void submitButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)

            {
                if (resumeUpload.HasFile)
                {
                    string filExt = Path.GetExtension(resumeUpload.FileName).ToLower();
                    int fileSize = resumeUpload.PostedFile.ContentLength;
                    int maxSize = 2 * 1024 * 1024;
                    if (filExt == ".docx" || filExt == ".doc" || filExt == ".pdf" && fileSize <= maxSize)
                    {
                        string fileName = Path.GetFileName(resumeUpload.FileName);
                        string filepath = "~/Resumes/" + fileName;
                        resumeUpload.SaveAs(Server.MapPath(filepath));



                        string status = "Pending";
                        string quary8 = "SELECT * FROM EMPLOYEES WHERE USERNAME=@username";
                        using (MySqlConnection conn = new MySqlConnection(constrng))
                        {

                            conn.Open();
                            MySqlCommand cmd = new MySqlCommand(quary8, conn);
                            cmd.Parameters.AddWithValue("@username", usernameTxt.Text);
                            MySqlDataReader reader8 = cmd.ExecuteReader();
                            if (reader8.HasRows)
                            {
                                reader8.Read();

                                // if the employee was rejected previously
                                if (reader8["Status"].ToString() == "Reject")
                                {

                                    string userID = reader8["empID"].ToString();
                                    string quary9 = "UPDATE EMPLOYEES SET STATUS='Pending' WHERE EMPID=@empid";
                                    using (MySqlConnection conn9 = new MySqlConnection(constrng))
                                    {
                                        conn9.Open();
                                        MySqlCommand cmd5 = new MySqlCommand(quary9, conn9);
                                        cmd5.Parameters.AddWithValue("@empid", userID);
                                        int count = cmd5.ExecuteNonQuery();

                                        if (count > 0)
                                        {
                                            Clear();
                                            Response.Write("<script>alert('Registration successful, wait for HR approval'); window.location.href='Login.aspx'</script>");
                                            //Response.Redirect("Login.aspx");

                                        }

                                    }
                                }


                                //if the employee is in the pending status
                                else if (reader8["Status"].ToString() == "Pending")
                                {
                                    Clear();
                                    Response.Write("<script>alert('Your Registration is in the pending state wait for HR approval'); window.location.href='Login.aspx'</script>");

                                }

                                //if employee already got accepted and hes trynna re-register
                                else
                                {
                                    Clear();
                                    Response.Write("<script>alert('You have already been approved, just log-in through your credentials'); window.location.href='Login.aspx'</script>");
                                }
                                reader8.Close();

                            }

                            //if the employee username doesnt exist in the db
                            else
                            {
                                //add here
                                string todo = "INSERT INTO EMPLOYEES(FIRSTNAME, LASTNAME, EMAILID, USERNAME, PASSWORD, DEPARTMENT,RESUMEPATH, STATUS, ROLE) VALUES (@firstName, @lastName, @emailID, @username, @password, @department, @resumePath, @status, (SELECT FROLE_ID FROM LDB1_ROLES WHERE FROLE_NAME='Employee'))";

                                using (MySqlConnection conn1 = new MySqlConnection(constrng))
                                {

                                    //string fileName = Path.GetFileName(resumeUpload.FileName);
                                    //string filepath = "~/Resumes/" + fileName;
                                    conn1.Open();
                                    MySqlCommand cmd1 = new MySqlCommand(todo, conn1);
                                    cmd1.Parameters.AddWithValue("@firstName", firstNameTxt.Text);
                                    cmd1.Parameters.AddWithValue("@lastName", lastNameTxt.Text);
                                    cmd1.Parameters.AddWithValue("@emailID", emailTxt.Text);
                                    cmd1.Parameters.AddWithValue("@username", usernameTxt.Text);
                                    cmd1.Parameters.AddWithValue("@password", passwordTxt.Text);
                                    cmd1.Parameters.AddWithValue("@department", deptddl.SelectedItem.Text);
                                    cmd1.Parameters.AddWithValue("@resumePath", filepath);
                                    cmd1.Parameters.AddWithValue("@status", status);

                                    int count = cmd1.ExecuteNonQuery();
                                    if (count > 0)
                                    {
                                        Clear();
                                        Response.Write("<script>alert('Registration successful, wait for HR approval'); window.location.href='Login.aspx'</script>");
                                        //Response.Redirect("Login.aspx");
                                        //
                                        //
                                        //Thread.Sleep(3000);

                                        //Response.Redirect("Login.aspx");
                                    }
                                    else
                                    {
                                        Clear();
                                        Response.Write("<script>alert('Registration unsuccessful, try later');window.location.href='Registration.aspx' </script>");
                                        //Response.Redirect("Registration.aspx");
                                    }
                                }


                            }
                        }

                    }
                    else
                    {
                        submitLbl.Text = "Uploaded file should be in pdf or doc format and its size shouldn't exceed than 2MB";
                        submitLbl.ForeColor = System.Drawing.Color.Red;
                    }


                }
                else
                {
                    submitLbl.Text = "choose the file";
                    submitLbl.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

    }

}

//string constrng = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;
//string status = "Pending";


//for duplication of users
//string quary6 = "SELECT * FROM employees WHERE Username=@username";
//using (MySqlConnection conn6 = new MySqlConnection(constrng))
//{
//    conn6.Open();
//    MySqlCommand cmd6 = new MySqlCommand(quary6, conn6);
//    cmd6.Parameters.AddWithValue("@username", usernameTxt.Text);
//    MySqlDataReader reader = cmd6.ExecuteReader();
//    if (reader.HasRows)
//    {

//rough


//you started from here

//for duplication of users
//string quary8 = "SELECT * FROM employees WHERE Username=@username";
//using (MySqlConnection conn = new MySqlConnection(constrng))
//{

//    conn.Open();
//    MySqlCommand cmd = new MySqlCommand(quary8, conn);
//    cmd.Parameters.AddWithValue("@username", usernameTxt.Text);
//    MySqlDataReader reader8 = cmd.ExecuteReader();
//    if (reader8.HasRows)
//    {
//        reader8.Read();

//        // if the employee was rejected previously
//        if (reader8["Status"].ToString() == "Reject")
//        {

//            string userID = reader8["empID"].ToString();
//            string quary9 = "UPDATE employees SET Status='Pending' WHERE empID=@empid";
//            using (MySqlConnection conn9 = new MySqlConnection(constrng))
//            {
//                conn9.Open();
//                MySqlCommand cmd5 = new MySqlCommand(quary9, conn9);
//                cmd5.Parameters.AddWithValue("@empid", userID);
//                int count = cmd5.ExecuteNonQuery();

//                if (count > 0)
//                {
//                    Clear();
//                    Response.Write("<script>alert('Registration successful, wait for HR approval'); window.location.href='Login.aspx'</script>");
//                    //Response.Redirect("Login.aspx");

//                }

//            }
//        }

//        //if the employee is in the pending status
//        else if (reader8["Status"].ToString() == "Pending")
//        {
//            Clear();
//            Response.Write("<script>alert('Your Registration is in the pending state wait for HR approval'); window.location.href='Login.aspx'</script>");

//        }

//        //if employee already got accepted and hes trynna re-register
//        else
//        {
//            Clear();
//            Response.Write("<script>alert('You have already been approved, just log-in through your credentials'); window.location.href='Login.aspx'</script>");
//        }





//    }

//    //if the employee username doesnt exist in the db
//    else
//    {
//        //add here
//        string todo = "INSERT INTO employees(FirstName, LastName, EmailID, Username, Password, Department,ResumePath, Status, ROLE) VALUES (@firstName, @lastName, @emailID, @username, @password, @department, @resumePath, @status, (SELECT FROLE_ID FROM LDB1_ROLES WHERE FROLE_NAME='Employee'))";

//        using (MySqlConnection conn1 = new MySqlConnection(constrng))
//        {

//            string fileName = Path.GetFileName(resumeUpload.FileName);
//            string filepath = "~/Resumes/" + fileName;
//            conn1.Open();
//            MySqlCommand cmd1 = new MySqlCommand(todo, conn1);
//            cmd1.Parameters.AddWithValue("@firstName", firstNameTxt.Text);
//            cmd1.Parameters.AddWithValue("@lastName", lastNameTxt.Text);
//            cmd1.Parameters.AddWithValue("@emailID", emailTxt.Text);
//            cmd1.Parameters.AddWithValue("@username", usernameTxt.Text);
//            cmd1.Parameters.AddWithValue("@password", passwordTxt.Text);
//            cmd1.Parameters.AddWithValue("@department", deptddl.SelectedItem.Text);
//            cmd1.Parameters.AddWithValue("@resumePath", filepath);
//            cmd1.Parameters.AddWithValue("@status", status);

//            int count = cmd1.ExecuteNonQuery();
//            if (count > 0)
//            {
//                Clear();
//                Response.Write("<script>alert('Registration successful, wait for HR approval'); window.location.href='Login.aspx'</script>");
//                //Response.Redirect("Login.aspx");
//                //
//                //
//                //Thread.Sleep(3000);

//                //Response.Redirect("Login.aspx");
//            }
//            else
//            {
//                Clear();
//                Response.Write("<script>alert('Registration unsuccessful, try later');window.location.href='Registration.aspx' </script>");
//                //Response.Redirect("Registration.aspx");
//            }
//        }


//    }
//}


//rough






//submitLbl.Text = "the username already exists";
//Clear();
//Thread.Sleep(3000);

//Response.Write("<script>alert('the username already exist');</script>");
//Response.Redirect("Registration.aspx");

//else
//{
//string todo = "INSERT INTO employees(FirstName, LastName, EmailID, Username, Password, Department,ResumePath, Status, ROLE) VALUES (@firstName, @lastName, @emailID, @username, @password, @department, @resumePath, @status, (SELECT FROLE_ID FROM LDB1_ROLES WHERE FROLE_NAME='Employee'))";

//using (MySqlConnection conn1 = new MySqlConnection(constrng))
//{

//    string fileName = Path.GetFileName(resumeUpload.FileName);
//    string filepath = "~/Resumes/" + fileName;
//    conn1.Open();
//    MySqlCommand cmd1 = new MySqlCommand(todo, conn1);
//    cmd1.Parameters.AddWithValue("@firstName", firstNameTxt.Text);
//    cmd1.Parameters.AddWithValue("@lastName", lastNameTxt.Text);
//    cmd1.Parameters.AddWithValue("@emailID", emailTxt.Text);
//    cmd1.Parameters.AddWithValue("@username", usernameTxt.Text);
//    cmd1.Parameters.AddWithValue("@password", passwordTxt.Text);
//    cmd1.Parameters.AddWithValue("@department", deptddl.SelectedItem.Text);
//    cmd1.Parameters.AddWithValue("@resumePath", filepath);
//    cmd1.Parameters.AddWithValue("@status", status);

//    int count = cmd1.ExecuteNonQuery();
//    if (count > 0)
//    {
//        Clear();
//        Response.Write("<script>alert('Registration successful, wait for HR approval'); window.location.href='Login.aspx'</script>");
//        //Response.Redirect("Login.aspx");
//        //
//        //
//        //Thread.Sleep(3000);

//        //Response.Redirect("Login.aspx");
//    }
//    else
//    {
//        Clear();
//        Response.Write("<script>alert('Registration unsuccessful, try later');window.location.href='Registration.aspx' </script>");
//        //Response.Redirect("Registration.aspx");
//    }
//}


//}



//rough



//else
//{
//    using (MySqlConnection conn1 = new MySqlConnection(constrng))
//    {

//        string fileName = Path.GetFileName(resumeUpload.FileName);
//        string filepath = "~/Resumes/" + fileName;
//        conn1.Open();
//        MySqlCommand cmd1 = new MySqlCommand(todo, conn1);
//        cmd1.Parameters.AddWithValue("@firstName", firstNameTxt.Text);
//        cmd1.Parameters.AddWithValue("@lastName", lastNameTxt.Text);
//        cmd1.Parameters.AddWithValue("@emailID", emailTxt.Text);
//        cmd1.Parameters.AddWithValue("@username", usernameTxt.Text);
//        cmd1.Parameters.AddWithValue("@password", passwordTxt.Text);
//        cmd1.Parameters.AddWithValue("@department", deptddl.SelectedItem.Text);
//        cmd1.Parameters.AddWithValue("@resumePath", filepath);
//        cmd1.Parameters.AddWithValue("@status", status);

//        int count = cmd1.ExecuteNonQuery();
//        if (count > 0)
//        {
//            Response.Write("<script>alert('Registration successful, wait for HR approval');</script>");
//            //Response.Redirect("Login.aspx");
//            //
//            //
//            //Thread.Sleep(3000);
//            //Response.Redirect("Login.aspx");
//        }
//        else
//        {
//            Response.Write("<script>alert('Registration unsuccessful');</script>");
//            //Response.Redirect("Registration.aspx");
//        }
//    }
//}









//for updation of rejected users
//string quary = "SELECT * FROM employees WHERE Username=@username AND Status='Reject'";
//using (MySqlConnection conn = new MySqlConnection(constrng))
//{

//    conn.Open();
//    MySqlCommand cmd = new MySqlCommand(quary, conn);
//    cmd.Parameters.AddWithValue("@username", usernameTxt.Text);
//    MySqlDataReader reader = cmd.ExecuteReader();
//    if (reader.Read())
//    {
//        string userID = reader["empID"].ToString();
//        string quary5 = "UPDATE employees SET Status='Pending' WHERE empID=@empid";
//        using (MySqlConnection conn5 = new MySqlConnection(constrng))
//        {
//            conn5.Open();
//            MySqlCommand cmd5 = new MySqlCommand(quary5, conn5);
//            cmd5.Parameters.AddWithValue("@empid", userID);
//            int count = cmd5.ExecuteNonQuery();

//            if (count > 0)
//            {
//                Response.Write("<script>alert('Registration successful, wait for HR approval');</script>");
//                //Response.Redirect("Login.aspx");

//            }

//        }

//    }
//}





