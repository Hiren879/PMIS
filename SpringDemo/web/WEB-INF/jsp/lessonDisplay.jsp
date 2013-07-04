<%-- 
    Document   : Display
    Created on : May 23, 2013, 4:06:07 PM
    Author     : HR
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.fin.db.dbutility.DBConnection"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>

<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Display Table</title>

        <link type="text/css" rel="stylesheet" href="bootstrap/bootstrap.css" />
        <link type="text/css" rel="stylesheet" href="bootstrap/bootstrap-responsive.css" />

        <script type="text/javascript" src="js/jquery-latest.js"></script>
        <script type="text/javascript" src="js/jquery.tablesorter.min.js"></script> 

        <script defer="defer">
            $(document).ready(function() 
            { 
                $("#table_my_table").tablesorter(); 
            } 
        ); 
        </script>
    </head>

    <body>
        <%
            DBConnection db;
            db = new DBConnection();
            ResultSet rs = null;
            rs = db.querys("SELECT p.Pname,p.Cname,p.contactno,p.Cname,i.issueldesc,l.PID,l.category,l.randc,l.tandt FROM projectsummery as p left join lessonlearned as l on l.PID = p.PID left join issuelog as i on i.PID = p.PID");

        %>
        <ul class="nav nav-pills">
            <li >
                <a href="welcome.htm">Home</a>
            </li>
            <li class="active">
                <a href="lessonDisplay.htm">Show Data</a>
            </li>
            <li>
                <a href="Lesson.htm">Back</a>
            </li>
        </ul>
        <table class="table" id="table_my_table">
            <thead> 
                <tr bgcolor="SKY BLUE" style="color: white"> 
                    <th <i class="icon-circle-arrow-up"></i><i class="icon-circle-arrow-down"></i>&nbsp;No</th>
                    <th>Project Name</th> 
                    <th>Issue</th> 
                    <th>Client</th>
                    <th>Contact No</th>
                    <th>Category</th>
                    <th>Recommendation And Comments</th>
                    <th>Tools And Technology</th>

                </tr> 
            </thead> 
            <tbody>
                <% int c=0;
                while (rs.next()) { c++; %>
                <tr>
                    <td align="center">
                        <%= (c) %>
                    </td>
                    <td align="center">
                        <%=rs.getString("Pname")%>
                    </td>
                    <td align="center">
                        <% if (rs.getString("issueldesc") == null) {
                                %>
                                NO ISSUE
                                <%}else{
                                    out.println(rs.getString("issueldesc"));
                                }%>
                    </td>
                    <td align="center">
                        <%=rs.getString("Cname")%>
                    </td>
                    <td align="center">
                        <%=rs.getString("contactno")%>
                    </td>
                    <td align="center">
                        <%=rs.getString("category")%>
                    </td>
                    <td align="center">
                        <%=rs.getString("randc")%>
                    </td >
                    <td align="center">
                        <%=rs.getString("tandt")%>
                    </td>
                    <% }%>
            </tbody>
        </table>
    </form>
</body>
</html>
<!--

-->