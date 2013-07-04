
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<%@page import="java.util.Map"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.fin.db.dbutility.DBConnection"%>
<%@page import="java.util.HashMap"%>
<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@page import="java.sql.SQLException"%>

<%
    int cnt = 0;
    DBConnection db;
    String pname = request.getParameter("name");
    db = new DBConnection();
    ResultSet rs = db.querys("select issueldesc from issuelog i INNER join projectsummery p on (i.PID= p.PID) where Pname = '" + pname + "'");
%>
<html>
    <head></head>
    <body>
        <select id="issuename" name="issuename">
            <option id="noissue">
                NO ISSUE
            </option>
            <% while (rs.next()) {%>
            <option id="<% cnt++; %>"> 
                <% out.println(rs.getString(1));
                    }%>
            </option>
            
        </select>
    </body>    
</html>
