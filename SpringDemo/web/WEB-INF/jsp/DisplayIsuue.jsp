<%-- 
    Document   : DisplayIsuue
    Created on : Jun 12, 2013, 9:55:21 PM
    Author     : HR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Display Issue Table</title>

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
        <form>
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
                    <th>No</th>
                    <th <i class="icon-circle-arrow-up"> </i><i class="icon-circle-arrow-down"></i>&nbsp;Project Name</th> 
                    <th>Issue</th> 
                    <th>Client</th>
                    <th>Contact No</th>
                    <th>Category</th>
                    <th>Recommendations And Comments</th>
                    <th>Tools And Techniques</th>
                    </tr> 
                </thead> 
                <tbody>
                    <% int c = 0;%>
                    <c:forEach items="${listitems1}" var="oneitem">
                        <% c++;%>
                        <tr>
                        <td align="center">
                            <%= (c)%>
                        </td>
                        <td align="center">
                            <c:out value="${oneitem.pname}" />
                        </td>
                        <td align="center">
                            <c:out value="${oneitem.issue}" />
                        </td>
                        <td align="center">
                            <c:out value="${oneitem.cname}" />
                        </td>
                        <td align="center">
                            <c:out value="${oneitem.contactno}" />
                        </td>
                        <td align="center">
                            <c:out value="${oneitem.category}" />
                        </td>
                        <td align="center">
                            <c:out value="${oneitem.cmnt}" />
                        </td>
                        <td align="center">
                            <c:out value="${oneitem.tools}" />
                        </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </form>
    </body>
</html>