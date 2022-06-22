<%@ Page culture="en-IN" Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication7.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="gvemp" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="employee_id" HeaderText="employee Id" />
                    <asp:BoundField DataField="first_name" HeaderText="first_name" />
                     <asp:BoundField DataField="last_name" HeaderText="last_name" />
                    <asp:BoundField DataField="email" HeaderText="email" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="linkselect" Text="select" runat="server" CommandArgument='<% # Eval("employee_id")%>' OnClick="linkselect_click"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                </asp:GridView>
             <!-- 
                 <Columns>
                    <asp:BoundField DataField="first_name" HeaderText="first_name" />
                     <asp:BoundField DataField="last_name" HeaderText="last_name" />
                    <asp:BoundField DataField="address" HeaderText="email" />
                 </Columns>
                 -->
  
        </div>
       <!-- <asp:GridView ID="GridView19" runat="server" AutoGenerateColumns="False" DataKeyNames="job_id" DataSourceID="SqlDataSource1" Height="174px" Width="446px">
            <Columns>
                <asp:BoundField DataField="job_id" HeaderText="job_id" InsertVisible="False" ReadOnly="True" SortExpression="job_id" />
                <asp:BoundField DataField="job_title" HeaderText="job_title" SortExpression="job_title" />
                <asp:BoundField DataField="min_salary" HeaderText="min_salary" SortExpression="min_salary" />
                <asp:BoundField DataField="max_salary" HeaderText="max_salary" SortExpression="max_salary" />
            </Columns>
        </asp:GridView> -->

          <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="job_id" DataSourceID="SqlDataSource1" Height="174px" Width="446px">
            <Columns>
                <asp:BoundField DataField="job_id" HeaderText="Job Id" InsertVisible="False" ReadOnly="True" SortExpression="job_id" />
                <asp:BoundField DataField="job_title" HeaderText="Job Title" SortExpression="job_title" />
                <asp:BoundField DataField="min_salary" HeaderText="Min Salary" DataFormatString="{0:c}" SortExpression="min_salary" />
                <asp:BoundField DataField="max_salary" HeaderText="Max Salary" DataFormatString="{0:c2}" SortExpression="max_salary" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HRConnectionString %>" SelectCommand="SELECT * FROM [jobs]"></asp:SqlDataSource>

        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="dependent_id" DataSourceID="SqlDataSource3">
            <Columns>
         <asp:BoundField DataField="dependent_id" HeaderText="dependent_id" InsertVisible="False" visible="false" ReadOnly="True" SortExpression="dependent_id" />
                <asp:BoundField DataField="first_name" HeaderText="first_name" SortExpression="first_name" />
                <asp:BoundField DataField="last_name" HeaderText="Lastame" SortExpression="last_name" />
                <asp:BoundField DataField="relationship" HeaderText="Relationship" SortExpression="relationship" />
                <asp:BoundField DataField="employee_id" HeaderText="Employee Id" SortExpression="employee_id" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:HRConnectionString2 %>" SelectCommand="SELECT * FROM [dependents]"></asp:SqlDataSource>
        
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="employee_id" DataSourceID="SqlDataSource4" OnRowDataBound="GridView3_RowDataBound">
            <Columns>
                <asp:BoundField DataField="employee_id" HeaderText="employee_id" InsertVisible="False" ReadOnly="True" SortExpression="employee_id" />
                <asp:BoundField DataField="first_name" HeaderText="first_name" SortExpression="first_name" />
                <asp:BoundField DataField="last_name" HeaderText="last_name" SortExpression="last_name" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                <asp:BoundField DataField="phone_number" HeaderText="phone_number" SortExpression="phone_number" />
                <asp:BoundField DataField="hire_date" HeaderText="hire_date" SortExpression="hire_date" />
                <asp:BoundField DataField="job_id" HeaderText="job_id" SortExpression="job_id" />
                <asp:BoundField DataField="salary" HeaderText="salary" SortExpression="salary" />
                <asp:BoundField DataField="manager_id" HeaderText="manager_id" SortExpression="manager_id" />
                <asp:BoundField DataField="department_id" HeaderText="department_id" SortExpression="department_id" />
            </Columns>
            <RowStyle HorizontalAlign="Right" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:HRConnectionString %>" SelectCommand="SELECT * FROM [employees]"></asp:SqlDataSource>
    </form>
</body>
</html>