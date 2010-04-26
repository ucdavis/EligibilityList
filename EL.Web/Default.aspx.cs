using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using EL.BLL;


public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Init(object sender, EventArgs e)
    {
        // Initialization stuff
    }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        StringBuilder s = new StringBuilder("Hello ");
        s.Append(ActionTypeBLL.GetByID(1).Name);

        Response.Write(s.ToString());
    }
}
