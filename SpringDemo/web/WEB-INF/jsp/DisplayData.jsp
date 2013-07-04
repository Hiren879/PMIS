<%-- 
    Document   : DisplayData
    Created on : Jun 9, 2013, 5:36:35 PM
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

        <link type="text/css" rel="stylesheet" href="/SpringDemo/bootstrap/bootstrap.css" />
        <link type="text/css" rel="stylesheet" href="/SpringDemo/bootstrap/bootstrap-responsive.css" />

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
            rs = db.querys("SELECT i.PID,i.modulename,i.issuecreatoindate,i.issueldesc,i.reason,i.event,i.correctiveeaction,i.timetaken,i.impact,i.remark,p.Pname,p.Cname,p.contactno,p.prepby,p.prepdate from issuelog i right join projectsummery p on i.PID=p.PID");

        %>
        <form>
            <ul class="nav nav-pills">
                <li >
                    <a href="welcome.htm">Home</a>
                </li>
                <li class="active">
                    <a href="DisplayData.htm">Show Data</a>
                </li>
                <li>
                    <a href="index.htm">Back</a>
                </li>
            </ul>
            <table class="table" id="table_my_table">
                <thead> 
                    <tr bgcolor="SKY BLUE" style="color: white"> 
                        <th <i class="icon-circle-arrow-up"></i><i class="icon-circle-arrow-down"></i>&nbsp;No</th>
                        <th>Project Name</th> 
                        <th>Module Name</th> 
                        <th>Client</th>
                        <th>Contact No</th>
                        <th>Prepared By</th>
                        <th>Prepared Date</th>
                        <th>Issue Creation Date</th>
                        <th>Issue Description</th>
                        <th>Reason</th>
                        <th>Event</th>
                        <th>Corrective Action</th>
                        <th>Time Taken</th>
                        <th>Impact</th>
                        <th>Remark</th>
                    </tr> 
                </thead> 
                <tbody>

                    <%
                        int c = 0;
                        while (rs.next()) {
                            c++;%>
                    <tr>
                        <td align="center">
                            <%=(c)%>
                        </td>
                        <td align="center">
                            <%=rs.getString("Pname")%>
                        </td>
                        <td align="center">
                            <% if (rs.getString("modulename") == null) {
                                %>
                                ---
                                <%}else{
                                    out.println(rs.getString("modulename"));
                                }%>
                        </td>
                        <td>
                            <%=rs.getString("Cname")%>
                        </td>
                        <td>
                            <%=rs.getString("contactno")%>
                        </td>
                        <td>
                            <%=rs.getString("prepby")%>
                        </td>
                        <td>
                            <%=rs.getString("prepdate")%>
                        </td>
                        <td>
                            <%=rs.getString("issuecreatoindate")%>
                        </td>
                        <td>
                            <%=rs.getString("issueldesc")%>
                        </td>
                        <td>
                            <%=rs.getString("reason")%>
                        </td>
                        <td>
                            <%=rs.getString("event")%>
                        </td>
                        <td>
                            <%=rs.getString("correctiveeaction")%>
                        </td>
                        <td>
                            <%=rs.getString("timetaken")%>
                        </td>
                        <td>
                            <%=rs.getString("impact")%>
                        </td>
                        <td>
                            <%=rs.getString("remark")%>
                        </td>
                    </tr>
                    <% }%>
                </tbody>
            </table>
        </form>
    </body>
</html>
