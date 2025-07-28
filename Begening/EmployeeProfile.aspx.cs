using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using MySql.Data.MySqlClient;
using HelperClass1;
namespace Begening
{
    public partial class employeeProfile : System.Web.UI.Page
    {
        //string constrng = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;
        string constrng = Helper.ConnectionString();
        MySqlConnection conn;//1


        protected void Page_Load(object sender, EventArgs e)
        {


            conn = new MySqlConnection(constrng);
            Helper.AvoidCacheRepeatation(Response);

            if (!IsPostBack)
            {


                //here i am fetching all the info of that emp from db
                string quary = "SELECT * FROM EMPLOYEES WHERE USERNAME = @username";
                //using (MySqlConnection conn = new MySqlConnection(constrng))
                //{11
                conn.Open();
                MySqlCommand cmd = new MySqlCommand(quary, conn);
                cmd.Parameters.AddWithValue("@username", Session["Username"]);
                MySqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    string FName = reader["FirstName"].ToString();
                    string LName = reader["LastName"].ToString();
                    string EMail = reader["EmailID"].ToString();
                    string Department = reader["Department"].ToString();
                    string Mobile = reader["MobileNumber"].ToString();
                    string Gender = reader["Gender"].ToString();
                    string Address = reader["Address"].ToString();

                    if (Session["Role"].ToString() == "Employee")
                    {
                        firstNameTxt.Text = FName;
                        lastNameTxt.Text = LName;
                        emailTxt.Text = EMail;
                        deptTxt.Text = Department;
                        mobileNumTxt.Text = Mobile;
                        RadioButtonList1.SelectedValue = Gender;
                        adressTxt.Text = Address;

                        firstNameTxt.Enabled = false;
                        lastNameTxt.Enabled = false;
                        emailTxt.Enabled = false;
                        deptTxt.Enabled = false;

                    }
                    else if (Session["Role"].ToString() == "HR1")
                    {

                        firstNameTxt.Text = FName;
                        lastNameTxt.Text = LName;
                        emailTxt.Text = EMail;
                        deptTxt.Text = Department;
                        mobileNumTxt.Text = Mobile;
                        RadioButtonList1.SelectedValue = Gender;
                        adressTxt.Text = Address;

                        firstNameTxt.Enabled = true;
                        lastNameTxt.Enabled = true;
                        emailTxt.Enabled = true;
                        deptTxt.Enabled = true;



                        //PlaceHolder ph = (PlaceHolder)Master.FindControl("Content2");
                        //if (ph != null)
                        //{
                        //    ph.Visible = false;
                        //}
                    }
                    reader.Close();
                }




            }
        }


        // if the employee has editted his profile then reflect it in the db
        protected void submitBtn_Click(object sender, EventArgs e)
        {
            try {
                if (Page.IsValid)
                {
                    string quary = "UPDATE EMPLOYEES SET MOBILENUMBER = @mobilenumber, ADDRESS= @address, GENDER = @gender WHERE USERNAME = @username";

                    //using (MySqlConnection conn = new MySqlConnection(constrng))
                    //{
                    conn.Open();
                    MySqlCommand cmd = new MySqlCommand(quary, conn);
                    if (Session["Username"] != null)
                    {
                        string USER = Session["Username"].ToString();
                        cmd.Parameters.AddWithValue("@username", USER);
                        cmd.Parameters.AddWithValue("@mobilenumber", mobileNumTxt.Text);
                        cmd.Parameters.AddWithValue("@gender", RadioButtonList1.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@address", adressTxt.Text);

                        int count = cmd.ExecuteNonQuery();
                        if (count > 0)
                        {
                            submitLbl.Text = "registration successful";
                            submitLbl.ForeColor = System.Drawing.Color.Green;

                        }
                        else
                        {
                            submitLbl.Text = "registration unsuccessful";
                            submitLbl.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                    else
                    {
                        Response.Redirect("Login.aspx");
                    }


                }
            }
            catch(Exception){
            
            }
        }

        protected void homeBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["Role"].ToString() == "Employee")
                {

                    //Session.Abandon();


                    Session.Clear();
                    Session.Abandon();
                    Response.Redirect("Login.aspx", true);
                    //Server.Transfer("Login.aspx", true);
                    Context.ApplicationInstance.CompleteRequest();


                }
                else if (Session["Role"].ToString() == "HR1")
                {

                    //Session.Clear();
                    //Session.Abandon();

                    Response.Redirect("HRProfile.aspx");
                    Context.ApplicationInstance.CompleteRequest();

                }
            }
            catch (Exception) {
            }

        }


        protected void Page_Unload(object sender, EventArgs e)
        {
            conn.Close();

        }



    }
}