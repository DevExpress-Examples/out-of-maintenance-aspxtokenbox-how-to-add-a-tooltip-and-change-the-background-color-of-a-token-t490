Imports DevExpress.Web
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls

Partial Public Class _Default
	Inherits System.Web.UI.Page

	Protected Sub ASPxTokenBox1_ItemRowPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ListBoxItemRowPreparedEventArgs)
		e.Row.ToolTip = e.Item.GetFieldValue("Description").ToString()
	End Sub

	Protected Sub ASPxTokenBox1_DataBound(ByVal sender As Object, ByVal e As EventArgs)
		Dim tokenBox = DirectCast(sender, ASPxTokenBox)
		Dim tokenDescription As Dictionary(Of Object, Object) = tokenBox.Items.Cast(Of ListEditItem)().ToDictionary(Function(g) g.Value, Function(g) g.GetFieldValue("Description"))
		tokenBox.JSProperties("cpTokenDescriptions") = tokenDescription
	End Sub
End Class