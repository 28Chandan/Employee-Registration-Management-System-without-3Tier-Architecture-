using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Data;
using HelperClass1;
namespace Begening
{
    public partial class HRProfile : System.Web.UI.Page
    {
        //string constrng = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;
        string constrng = Helper.ConnectionString();
        
        
        protected void Page_Load(object sender, EventArgs e)
        {
            Helper.AvoidCacheRepeatation(Response);
            if (!IsPostBack)
            {
                
                GridBindPending();
                GridBindAccepted();
                BindDepartment();
                count();
                GridBindRejected();
                GridView1.Columns[6].Visible = false;
                BindHRCount();
                HRCountGridView.Columns[2].Visible = true;
                HRVisibility();
            }
        }

        private void GridBindPending()
        {
            
            string quary = "SELECT EMPID,FIRSTNAME, LASTNAME, EMAILID, DEPARTMENT, RESUMEPATH, STATUS FROM EMPLOYEES WHERE STATUS = @status";
            using (MySqlConnection conn = new MySqlConnection(constrng))
            {
                conn.Open();
                MySqlCommand cmd = new MySqlCommand(quary, conn);
                cmd.Parameters.AddWithValue("@status", "Pending");
                MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }



        private void GridBindAccepted()
        {
            
            string quary = "SELECT EMPID, FIRSTNAME, LASTNAME, EMAILID, DEPARTMENT, RESUMEPATH, STATUS FROM EMPLOYEES WHERE STATUS = @status"  ;
            using (MySqlConnection conn = new MySqlConnection(constrng))
            {
                conn.Open();
                MySqlCommand cmd = new MySqlCommand(quary, conn);
                MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                cmd.Parameters.AddWithValue("@status", "Accept");
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView2.DataSource = dt;
                GridView2.DataBind();
            }
        }



        private void GridBindRejected()
        {

            string quary = "SELECT EMPID, FIRSTNAME, LASTNAME, EMAILID, DEPARTMENT, RESUMEPATH FROM EMPLOYEES WHERE STATUS = @status";
            using (MySqlConnection conn = new MySqlConnection(constrng))
            {
                conn.Open();
                MySqlCommand cmd = new MySqlCommand(quary, conn);
                cmd.Parameters.AddWithValue("@status", "Reject");
                MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView4.DataSource = dt;
                GridView4.DataBind();
            }
        }
        private void BindDepartment()
        {
            string quary = "SELECT DEPTID, DEPT FROM DEPARTMENT";
            using(MySqlConnection conn = new MySqlConnection(constrng))
            {
                conn.Open();
                MySqlCommand cmd = new MySqlCommand(quary, conn);
                MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView3.DataSource = dt;
                GridView3.DataBind();
            }
        }

        protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView2.EditIndex = e.NewEditIndex;
            GridBindAccepted();
        }

        protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(GridView2.DataKeys[e.RowIndex].Value.ToString());
            string firstName = ((TextBox)GridView2.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
            string lastName = ((TextBox)GridView2.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
            string emailID = ((TextBox)GridView2.Rows[e.RowIndex].Cells[3].Controls[0]).Text;
            string department = ((TextBox)GridView2.Rows[e.RowIndex].Cells[4].Controls[0]).Text;
            string quary = "UPDATE EMPLOYEES SET FIRSTNAME=@firstname, LASTNAME = @lastname, EMAILID=@emailID, DEPARTMENT=@department WHERE EMPID=@ID";
            using (MySqlConnection conn = new MySqlConnection(constrng))
            {
                conn.Open();
                MySqlCommand cmd = new MySqlCommand(quary, conn);
                cmd.Parameters.AddWithValue("@firstname", firstName);
                cmd.Parameters.AddWithValue("@lastname", lastName);
                cmd.Parameters.AddWithValue("@emailID", emailID);
                cmd.Parameters.AddWithValue("@department", department);
                cmd.Parameters.AddWithValue("@ID", id);

                int count = cmd.ExecuteNonQuery();
                if (count > 0)
                {
                    GridView2.EditIndex = -1;
                    GridBindAccepted();
                    //Response.Write("<script>alert('the data updated successfully')</script>");
                }
                else
                {
                    Response.Write("<script>alert('the data did not updated'); window.location.href='HRProfile.aspx';</script>");

                }

            }
        }

        protected void GridView2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
           
            GridView2.EditIndex = -1;
            GridBindAccepted();

        }

        protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView2.DataKeys[e.RowIndex].Value.ToString());
            string quary = "DELETE FROM EMPLOYEES WHERE EMPID=@empid";
            using(MySqlConnection conn = new MySqlConnection(constrng))
            {
                conn.Open();
                MySqlCommand cmd = new MySqlCommand(quary, conn);
                cmd.Parameters.AddWithValue("empid", id);
                int count = cmd.ExecuteNonQuery();
                if (count > 0)
                {
                    GridView2.EditIndex = -1;
                    GridBindAccepted();
                }

            }
        }


        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "Accept" || e.CommandName == "Reject" || e.CommandName=="Comments")
            {
                if (e.CommandName == "Accept")
                { 
                   
                    int cid = Convert.ToInt32(e.CommandArgument);
                    string quary2 = "UPDATE EMPLOYEES SET STATUS ='Accept' WHERE STATUS='Pending' AND EMPID=@empid";
                    using (MySqlConnection conn2 = new MySqlConnection(constrng))
                    {
                        conn2.Open();
                        MySqlCommand cmd2 = new MySqlCommand(quary2, conn2);
                        cmd2.Parameters.AddWithValue("@empid", cid);
                        int count = cmd2.ExecuteNonQuery();
                        if (count > 0)
                        {
                            GridBindPending();
                            GridBindAccepted();
                            //GridView1.Columns[6].Visible = false;
                        }
                    }
                }
                else if (e.CommandName == "Reject")
                {

                    if (GridView1.Columns[6].Visible == true)
                    {
                        GridView1.Columns[6].Visible = false;
                        CommentLbl.Visible = false;
                    }
                    else if (GridView1.Columns[6].Visible == false)
                    {
                        
                        GridView1.Columns[6].Visible = true;
                        CommentLbl.Visible = false;

                    }
                    

                    // Loop through all rows to hide all comment panels first
                    foreach (GridViewRow row in GridView1.Rows)
                    {
                        Panel commentPanel = (Panel)row.FindControl("commentPanel");
                        if (commentPanel != null)
                        {
                            commentPanel.Visible = false;
                        }
                    }

                    // Get the row index of the clicked row
                    int rowIndex = Convert.ToInt32(((GridViewRow)((Control)e.CommandSource).NamingContainer).RowIndex);
                    // Show the comment panel only for the clicked row
                    GridViewRow selectedRow = GridView1.Rows[rowIndex];
                    Panel selectedCommentPanel = (Panel)selectedRow.FindControl("commentPanel");
                    if (selectedCommentPanel != null)
                    {
                        selectedCommentPanel.Visible = true;
                    }
                    else
                    {
                        CommentLbl.Text = "";
                        selectedCommentPanel.Visible = false;
                    }
                    
                }

                else if (e.CommandName == "Comments")
                {
                    int rowIndex = Convert.ToInt32(((GridViewRow)((Control)e.CommandSource).NamingContainer).RowIndex);
                    // Show the comment panel only for the clicked row
                    GridViewRow selectedRow = GridView1.Rows[rowIndex];
                    //Panel selectedCommentPanel = (Panel)selectedRow.FindControl("commentPanel");
                    TextBox selectedCommentTxtBox = (TextBox)selectedRow.FindControl("commentTxt");

                    if (selectedCommentTxtBox.Text=="")
                    {
                        CommentLbl.Visible = true;
                        CommentLbl.Text = "The comment cannot be empty";
                        CommentLbl.ForeColor = System.Drawing.Color.Red;
                        selectedCommentTxtBox.BorderColor = System.Drawing.Color.Red;
                        
                        
                    }
                    else
                    {
                        CommentLbl.Text = "";
                        CommentLbl.Visible = false;
                        // selectedCommentPanel.BorderColor = System.Drawing.Color.Black;
                        int rowIndex1 = Convert.ToInt32(((GridViewRow)((Control)e.CommandSource).NamingContainer).RowIndex);
                        GridViewRow row = GridView1.Rows[rowIndex1];
                        string feedback = ((TextBox)row.FindControl("commentTxt")).Text;
                        string id = e.CommandArgument.ToString();

                        string quary1 = "UPDATE EMPLOYEES SET REJECT_REASON = @comment WHERE EMPID = @empid";
                        using (MySqlConnection conn = new MySqlConnection(constrng))
                        {
                            conn.Open();
                            MySqlCommand cmd = new MySqlCommand(quary1, conn);
                            cmd.Parameters.AddWithValue("@empid", id);
                            cmd.Parameters.AddWithValue("@comment", feedback.ToString());

                            int count = cmd.ExecuteNonQuery();

                            if (count > 0)
                            {
                                int cid3 = Convert.ToInt32(e.CommandArgument);
                                string quary2 = "UPDATE EMPLOYEES SET STATUS='Reject' WHERE EMPID=@empid";
                                using (MySqlConnection conn3 = new MySqlConnection(constrng))
                                {
                                    conn3.Open();
                                    MySqlCommand cmd3 = new MySqlCommand(quary2, conn3);
                                    cmd3.Parameters.AddWithValue("@empid", cid3);

                                    int count3 = cmd3.ExecuteNonQuery();
                                    //GridView1.Columns[6].Visible = true;
                                    GridBindRejected();
                                    GridView1.Columns[6].Visible = false;
                                    //GridBindPending();
                                    // GridView1.Columns[6].Visible = false;
                                }
                                GridBindPending();
                                GridBindRejected();
                            }




                        }

                    }


                }
                
            }
        }
        
        protected void submitDept_Click(object sender, EventArgs e)
        {
            string newDept = addDeptText.Text.ToUpper();
            if (newDept != "" )
            {
                string quary1 = "SELECT * FROM DEPARTMENT WHERE DEPT=@Dept";
                using (MySqlConnection conn1 = new MySqlConnection(constrng))
                {
                    conn1.Open();
                    MySqlCommand cmd1 = new MySqlCommand(quary1, conn1);
                    cmd1.Parameters.AddWithValue("@Dept", newDept);
                    MySqlDataReader reader1 = cmd1.ExecuteReader();
                    if (reader1.HasRows)
                    {
                        addDeptText.Text = "";
                        deptLabel.Text = "Entered department already exist";

                    }
                    else
                    {
                        deptLabel.Text = "";
                        string quary = "INSERT INTO DEPARTMENT (DEPT) VALUES (@newdept)";
                        using (MySqlConnection conn = new MySqlConnection(constrng))
                        {
                            conn.Open();
                            MySqlCommand cmd = new MySqlCommand(quary, conn);
                            cmd.Parameters.AddWithValue("@newdept", newDept);
                            cmd.ExecuteNonQuery();
                            addDeptText.Text = "";
                            BindDepartment();
                        }

                    }

                }
                
            }
            else
            {
                //addDeptText.Text = "";
                //deptLabel.Text = "Entered department already exist";
                deptLabel.Text = "Please enter the department";
            }

        }
    
     protected void count()
        {
            string quary = "SELECT COUNT(*) FROM EMPLOYEES WHERE STATUS='Accept' OR STATUS='Reject' OR STATUS='Pending'";
            using(MySqlConnection conn = new MySqlConnection(constrng))
            {
                conn.Open();
                MySqlCommand cmd = new MySqlCommand(quary, conn);
                object result=cmd.ExecuteScalar();
                totalCountLbl.Text = result.ToString();
            }


            string quary2 = "SELECT COUNT(*) FROM EMPLOYEES WHERE STATUS='Accept'";
            using (MySqlConnection conn = new MySqlConnection(constrng))
            {
                conn.Open();
                MySqlCommand cmd = new MySqlCommand(quary2, conn);
                object result = cmd.ExecuteScalar();
                totalAcceptedEmpCountLbl.Text = result.ToString();
            }


            string quary3 = "SELECT COUNT(*) FROM EMPLOYEES WHERE STATUS='Reject'";
            using (MySqlConnection conn = new MySqlConnection(constrng))
            {
                conn.Open();
                MySqlCommand cmd = new MySqlCommand(quary3, conn);
                object result = cmd.ExecuteScalar();
                totalRejectedEmpCountLbl.Text = result.ToString();
            }

            string quary4 = "SELECT COUNT(*) FROM EMPLOYEES WHERE STATUS='Pending'";
            using (MySqlConnection conn = new MySqlConnection(constrng))
            {
                conn.Open();
                MySqlCommand cmd = new MySqlCommand(quary4, conn);
                object result = cmd.ExecuteScalar();
                totalPendingEmpCountLbl.Text = result.ToString();
            }


            string quary5 = "SELECT COUNT(*) FROM DEPARTMENT;";
            using (MySqlConnection conn = new MySqlConnection(constrng))
            {
                conn.Open();
                MySqlCommand cmd = new MySqlCommand(quary5, conn);
                object result = cmd.ExecuteScalar();
                totalDeptCountLbl.Text = result.ToString();
            }

        }

        protected void GridView3_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView3.DataKeys[e.RowIndex].Value.ToString());
            string quary = "DELETE FROM DEPARTMENT WHERE DEPTID=@deptid";
            using (MySqlConnection conn = new MySqlConnection(constrng))
            {
                conn.Open();
                MySqlCommand cmd = new MySqlCommand(quary, conn);
                cmd.Parameters.AddWithValue("deptid", id);
                int count1 = cmd.ExecuteNonQuery();
                if (count1 > 0)
                {
                    GridView3.EditIndex = -1;
                    BindDepartment();
                    count();
                    
                }

            }
        }

        protected void BindHRCount()
        {
            string quary = "SELECT EMPID, USERNAME FROM EMPLOYEES WHERE ROLE='1'";
            using (MySqlConnection conn = new MySqlConnection(constrng))
            {
                conn.Open();
                MySqlCommand cmd = new MySqlCommand(quary, conn);
                MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                HRCountGridView.DataSource = dt;
                HRCountGridView.DataBind();
            }
        }

        protected void HRCountGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(HRCountGridView.DataKeys[e.RowIndex].Value.ToString());
            string quary1 = "SELECT COUNT(*) FROM EMPLOYEES WHERE ROLE='1'";
            using (MySqlConnection conn1 = new MySqlConnection(constrng))
            {   
                conn1.Open();
                chandan:
                MySqlCommand cmd1 = new MySqlCommand(quary1, conn1);
                object result = cmd1.ExecuteScalar();
                if (Convert.ToInt32(result) <= 1)
                {
                    HRCountGridView.Columns[2].Visible = false;
                }
                else
                {
                    string quary = "DELETE FROM EMPLOYEES WHERE EMPID=@empid";
                    using (MySqlConnection conn = new MySqlConnection(constrng))
                    {
                        conn.Open();
                        MySqlCommand cmd = new MySqlCommand(quary, conn);
                        cmd.Parameters.AddWithValue("empid", id);

                        int count1 = cmd.ExecuteNonQuery();
                        if (count1 > 0)
                        {
                            GridView3.EditIndex = -1;
                            BindHRCount();
                            goto chandan;
                            //HRVisibility();
                        }

                    }
                }
               
            }
        }

        protected void HRVisibility()
        {
            string quary1 = "SELECT COUNT(*) FROM EMPLOYEES WHERE ROLE='1'";
            using (MySqlConnection conn1 = new MySqlConnection(constrng))
            {
                conn1.Open();
            
                MySqlCommand cmd1 = new MySqlCommand(quary1, conn1);
                object result = cmd1.ExecuteScalar();
                if (Convert.ToInt32(result) <= 1)
                {
                    HRCountGridView.Columns[2].Visible = false;
                }
            }
        }

        protected void HRBtn_Click(object sender, EventArgs e)
        {
            string newHR = HRtxt.Text;
            string newHRPassword = HRPassWordtxt.Text;
            if(newHR!="" && newHRPassword!= ""){
                string quary1 = "SELECT * FROM EMPLOYEES WHERE USERNAME=@username AND ROLE='HR'";
                using (MySqlConnection conn1 = new MySqlConnection(constrng))
                {
                    conn1.Open();
                    MySqlCommand cmd1 = new MySqlCommand(quary1, conn1);
                    cmd1.Parameters.AddWithValue("@username", newHR);
                    MySqlDataReader reader = cmd1.ExecuteReader();
                    if (reader.HasRows)
                    {
                        HRPassWordtxt.Text = "";
                        addHRLabel.Text = "The HR Username already exist";

                    }
                    else
                    {
                        addHRLabel.Text = "";
                        string quary = "INSERT INTO EMPLOYEES (USERNAME,PASSWORD, ROLE) VALUES (@newHr,@password, (SELECT FROLE_ID FROM LDB1_ROLES WHERE FROLE_NAME=@rolename))";
                        using (MySqlConnection conn = new MySqlConnection(constrng))
                        {
                            conn.Open();
                            MySqlCommand cmd = new MySqlCommand(quary, conn);
                            cmd.Parameters.AddWithValue("@newHr", newHR);
                            cmd.Parameters.AddWithValue("@rolename", "HR");
                            cmd.Parameters.AddWithValue("@password", newHRPassword);
                            cmd.ExecuteNonQuery();
                            BindHRCount();
                            HRtxt.Text = "";
                            HRPassWordtxt.Text = "";
                            HRCountGridView.Columns[2].Visible = true;
                        }

                    }
                }
            }
            else
            {
                addHRLabel.Text = "Username and password cannot be blank";
            }
           
           
        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
             if (e.CommandName == "viewEmployee")
            {
                int cid = Convert.ToInt32(e.CommandArgument);
                string quary = "SELECT * FROM EMPLOYEES WHERE EMPID=@id";
                using (MySqlConnection conn = new MySqlConnection(constrng))
                {
                    conn.Open();
                    MySqlCommand cmd = new MySqlCommand(quary, conn);
                    cmd.Parameters.AddWithValue("@id", cid);
                    MySqlDataReader reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        reader.Read();
                        Session["Role"] ="HR1";
                        Session["Username"] = reader["Username"].ToString();
                        Response.Redirect("employeeProfile.aspx");
                        reader.Close();
                    }
                }

            }
        }

        protected void logOutAnchor_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
            //Server.Transfer("Login.aspx");
            //Context.ApplicationInstance.CompleteRequest();
        }
    }

}