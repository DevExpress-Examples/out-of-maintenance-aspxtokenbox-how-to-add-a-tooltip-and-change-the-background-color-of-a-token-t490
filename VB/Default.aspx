<%@ Page Language="VB" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .dxeToken {
            background-image: none;
        }
    </style>
    <script type="text/javascript">
        function AddTooltipToTokens(s, e) {
            var tokenCollection = s.GetTokenValuesCollection();
            for (var i = 0; i < tokenCollection.length; i++) {
                var tokenDescr = s.cpTokenDescriptions[tokenCollection[i]];
                var tokenElem = s.GetTokenHtmlElement(i);
                if (tokenElem.getAttribute('data-modified'))
                    continue;
                if (tokenDescr)
                    tokenElem.setAttribute("title", tokenDescr);
                var backColor = tokenCollection[i] % 2 == 0 ? 'red' : 'yellow';
                tokenElem.style.backgroundColor = backColor;
                tokenElem.setAttribute('data-modified', true);
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxTokenBox ID="ASPxTokenBox1" runat="server" ItemValueType="System.Int32" TextField="CategoryName" ValueField="CategoryID"
            DataSourceID="AccessDataSource1" OnItemRowPrepared="ASPxTokenBox1_ItemRowPrepared" OnDataBound="ASPxTokenBox1_DataBound">
                <ClientSideEvents Init="AddTooltipToTokens" ValueChanged="AddTooltipToTokens" EndCallback="AddTooltipToTokens" />
            </dx:ASPxTokenBox>
            <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT [CategoryID], [CategoryName], [Description] FROM [Categories]" />
        </div>
    </form>
</body>
</html>
