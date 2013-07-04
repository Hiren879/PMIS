<%-- 
    Document   : Display
    Created on : May 23, 2013, 4:06:07 PM
    Author     : HR
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                        <th <i class="icon-circle-arrow-up"> </i><i class="icon-circle-arrow-down"></i>&nbsp;No.</th>
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
                    <% int c=0; %>
                    <c:forEach items="${listitems}" var="oneitem">
                        <% c++; %>
                        <tr>
                            <td align="center">
                                <%= (c) %>
                            </td>
                            <td align="center">
                                <c:out value="${oneitem.Pname}" />
                            </td>
                            <td align="center">
                                <c:out value="${oneitem.modulename}" />
                            </td>
                            <td align="center">
                                <c:out value="${oneitem.Cname}" />
                            </td>
                            <td align="center">
                                <c:out value="${oneitem.contactno}" />
                            </td>
                            <td align="center">
                                <c:out value="${oneitem.prepby}" />
                            </td>
                            <td align="center">
                                <c:out value="${oneitem.prepdate}" />
                            </td>
                            <td align="center">
                                <c:out value="${oneitem.issuecreatoindate}" />
                            </td>
                            <td align="center">
                                <c:out value="${oneitem.issueldesc}" />
                            </td>
                            <td align="center">
                                <c:out value="${oneitem.reason}" />
                            </td>
                            <td align="center">
                                <c:out value="${oneitem.event}" />
                            </td>
                            <td align="center">
                                <c:out value="${oneitem.correctiveeaction}" />
                            </td>
                            <td align="center">
                                <c:out value="${oneitem.timetaken}" />
                            </td>
                            <td align="center">
                                <c:out value="${oneitem.impact}" />
                            </td>
                            <td align="center">
                                <c:out value="${oneitem.remark}" />
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </form>
    </body>
</html>
<!--

-->