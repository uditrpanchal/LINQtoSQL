using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LNSQWebApp1
{
    public partial class Customer1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindGrid();
        }

        public void BindGrid()
        {
            using(CustomerDataContext context = new CustomerDataContext())
            {
                var customers = (from c in context.Customers
                                 orderby c.FirstName,c.LastName
                                 select new
                                 {
                                     CustomerID = c.CustomerID,
                                     FirstName = c.FirstName,
                                     LastName = c.LastName,
                                     BirthDate = c.BirthDate,
                                     Email = c.Email,
                                     Address = c.Address
                                 }
                                 );
                GridView1.DataSource = customers.ToList();
                GridView1.DataBind();
            }
            
        }

        public void ClearControls()
        {
            hdnCustomerID.Value = "0";
            txtFirstName.Text = string.Empty;
            txtLastName.Text = string.Empty;
            txtBirthDate.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtAddress.Text = string.Empty;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            using(CustomerDataContext context = new CustomerDataContext())
            {
                if(Convert.ToInt32(hdnCustomerID.Value) > 0)
                {
                    Int64 CustomerID = Convert.ToInt64(hdnCustomerID.Value);
                    Customer obj = (from c in context.Customers
                                    where c.CustomerID == CustomerID
                                    select c).SingleOrDefault();

                    obj.FirstName = txtFirstName.Text.Trim();
                    obj.LastName = txtLastName.Text.Trim();
                    obj.BirthDate = DateTime.ParseExact(this.txtBirthDate.Text, "{0:dd/MM/yyyy}", null);
                    obj.Email = txtEmail.Text.Trim();
                    obj.Address = txtAddress.Text.Trim();

                    context.SubmitChanges();
                    BindGrid();
                    ClearControls();
                    
                }
                else
                {
                    Customer obj = new Customer();

                    obj.FirstName = txtFirstName.Text.Trim();
                    obj.LastName = txtLastName.Text.Trim();
                    obj.BirthDate = DateTime.ParseExact(this.txtBirthDate.Text, "dd/MM/yyyy", null);
                    obj.Email = txtEmail.Text.Trim();
                    obj.Address = txtAddress.Text.Trim();

                    context.Customers.InsertOnSubmit(obj);
                    context.SubmitChanges();
                    BindGrid();
                    ClearControls();

                }
            }
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            hdnCustomerID.Value = ((HiddenField)GridView1.SelectedRow.FindControl("hdnCustomerID")).Value;
            txtFirstName.Text = ((LinkButton)GridView1.SelectedRow.FindControl("lnkFirstName")).Text;
            txtLastName.Text = ((Label)GridView1.SelectedRow.FindControl("lblLastName")).Text;
            txtBirthDate.Text = ((Label)GridView1.SelectedRow.FindControl("lblBirthDate")).Text;
            txtEmail.Text = ((Label)GridView1.SelectedRow.FindControl("lblEmail")).Text;
            txtAddress.Text = ((Label)GridView1.SelectedRow.FindControl("lblAddress")).Text;
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "EDT")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                hdnCustomerID.Value = ((HiddenField)GridView1.Rows[rowIndex].FindControl("hdnCustomerID")).Value;
                txtFirstName.Text = ((LinkButton)GridView1.Rows[rowIndex].FindControl("lnkFirstName")).Text;
                txtLastName.Text = ((Label)GridView1.Rows[rowIndex].FindControl("lblLastName")).Text;
                txtBirthDate.Text = ((Label)GridView1.Rows[rowIndex].FindControl("lblBirthDate")).Text;
                txtEmail.Text = ((Label)GridView1.Rows[rowIndex].FindControl("lblEmail")).Text;
                txtAddress.Text = ((Label)GridView1.Rows[rowIndex].FindControl("lblAddress")).Text;

            }
            else if(e.CommandName == "DLT")
            {
                using(CustomerDataContext context = new CustomerDataContext())
                {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                hdnCustomerID.Value = ((HiddenField)GridView1.Rows[rowIndex].FindControl("hdnCustomerID")).Value;

                Int64 CustomerID = Convert.ToInt64(hdnCustomerID.Value);

                    Customer obj = (from c in context.Customers
                                    where c.CustomerID == CustomerID
                                    select c).SingleOrDefault();

                    context.Customers.DeleteOnSubmit(obj);
                    context.SubmitChanges();

                    BindGrid();
                    ClearControls();
                }
            }
        }

       
    }
}