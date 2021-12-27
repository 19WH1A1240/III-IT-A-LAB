<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<%

String result="";
String username=request.getParameter("username");
String password=request.getParameter("password");
String phonenumber=request.getParameter("phone");
String address=request.getParameter("address");
String city="";
String state="";
String country="";
try
{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wp","root","12345");
PreparedStatement ps=con.prepareStatement("insert into customer values(?,?,?,?,?,?,?)");
ps.setString(1,username);
ps.setString(2,password);
ps.setString(3,phonenumber);
ps.setString(4,address);
ps.setString(5,city);
ps.setString(6,state);
ps.setString(7,country);
int r=ps.executeUpdate();
if(r==0)
out.println("failure");	
else
result="Admin Registered Successfully";
con.close();}
catch (Exception e)
{
	System.out.println(e);
	
}
%>

<div style="text-align:center">
		<form action="register.html">
		 <h1><%=result%></h1><br>
		<input type="submit" value="Go To registration Page">
		</form><br><br>
</div>
