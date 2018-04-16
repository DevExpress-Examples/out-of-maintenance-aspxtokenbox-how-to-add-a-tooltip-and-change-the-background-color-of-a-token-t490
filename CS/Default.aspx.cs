using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{

    protected void ASPxTokenBox1_ItemRowPrepared(object sender, DevExpress.Web.ListBoxItemRowPreparedEventArgs e)
    {
        e.Row.ToolTip = e.Item.GetFieldValue("Description").ToString();
    }

    protected void ASPxTokenBox1_DataBound(object sender, EventArgs e)
    {
        var tokenBox = (ASPxTokenBox)sender;
        Dictionary<object, object> tokenDescription =  tokenBox.Items.Cast<ListEditItem>().ToDictionary(g => g.Value, g => g.GetFieldValue("Description"));
        tokenBox.JSProperties["cpTokenDescriptions"] = tokenDescription;
    }
}