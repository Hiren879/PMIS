<%-- 
    Document   : Lesson
    Created on : Jun 10, 2013, 2:44:02 PM
    Author     : HR
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.fin.db.dbutility.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Issue Lesson Learned</title>

        <script>
            $(document).ready(function() {
                $('.datepicker').datepicker();
            })
        </script>
        <link type="text/css" rel="stylesheet" href="bootstrap/bootstrap.css" />
        <link type="text/css" rel="stylesheet" href="bootstrap/bootstrap-responsive.css" />
        <link type="text/css" rel="stylesheet" href="bootstrap/datepicker.css" />

        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/bootstrap-datepicker.js"></script>

        <script src="js/jqBootstrapValidation.js"></script>
        <script src="js/Ajax.js"></script>
        <script src="js/collectdata.js"></script>

        <script>
            $(document).ready(function() {
                $('.datepicker').datepicker();
            });
        </script>

        <script>
            $(function () { $("input,select,textarea").not("[type=submit]").jqBootstrapValidation(); } );
        </script>

        <script>
            function projname(){
            <%int cnt = 0;
                DBConnection db;
                String pname = request.getParameter("name");
                db = new DBConnection();
                ResultSet rs1 = db.querys("select Pname from projectsummery");
            %>
                }
        </script>


    </head>
    <body onload="projname()">
        <form class="form-horizontal" id="form1" name="form1" method="POST" action="submit.htm?cmdAction=submitlesson">


            <ul class="nav nav-pills">
                <li class="active">
                    <a href="welcome.htm">Home</a>
                </li>
                <li class="active">
                    <a href="lessonDisplay.htm">Show Data</a>
                </li>
            </ul>

            <table border="0">
                <tr align="center">
                    <td>
                        <div class="control-group">
                            <label class="control-label">Project*</label>
                            <div class="controls">
                                <select name="pname" id="pname" onblur="showProjectInfo()" />
                                <% while (rs1.next()) {%>
                                <option id="<% cnt++;%>"> 
                                    <% out.println(rs1.getString(1));
                                        }%>
                                </option>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="control-group">
                            <label class="control-label">Issue</label>
                            <div class="controls" id="1">
                                <select name="issue" id="issue">
                                    <option>

                                    </option>
                                </select>
                            </div>
                        </div>
                    </td>
                <tr align="center">
                    <td>
                        <div class="control-group">
                            <label class="control-label">Client*</label>
                            <div class="controls">
                                <input type="text" name="cname" required id="cname" />
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="control-group">
                            <label class="control-label">Contact No</label>
                            <div class="controls">
                                <input type="number" data-validation-number-message="Only Digits are allowed" name="cno" id="cno" />
                            </div>
                        </div>
                    </td>
                </tr>
                <tr align="center">
                    <td>
                        <div class="control-group">
                            <label class="control-label">Prepared By*</label>
                            <div class="controls">
                                <select name="prepby" id="prepby">
                                    <option id="1">Jay</option>
                                    <option id="2">Akshay</option>
                                    <option id="3">Ajay</option>
                                    <option id="4">Purav</option>
                                    <option id="5">Ankit</option>
                                </select>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="control-group">
                            <label class="control-label">Prepared Date*</label>
                            <div class="controls">
                                <input type="text" class="datepicker" placeholder="Click Here to add DATE !" required name="pdate" id="pdate">
                            </div>
                        </div>
                    </td>
                </tr>
                <tr align="center">
                    <td>
                        <div class="control-group">
                            <label class="control-label">Issue Creation Date*</label>
                            <div class="controls">
                                <input type="text" class="datepicker" placeholder="Click Here to add DATE !" required name="idate" id="idate">
                            </div>
                        </div>
                    </td>
                </tr>
                <tr align="center">
                    <td>
                        <div class="control-group">
                            <label class="control-label">Recommendations And Comments*</label>
                            <div class="bs-docs-example form-inline" class="controls">
                                <textarea rows="3" style="width: 183px; height: 57px;" required name="comments" id="idesc"></textarea>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="control-group">
                            <label class="control-label">Tools And Techniques*</label>
                            <div class="bs-docs-example form-inline" class="controls">
                                <textarea rows="3" style="width: 183px; height: 57px;" required name="tandt" id="reason"></textarea>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr align="center">
                    <td>    
                        <div>
                            <input class="btn btn-primary" type="Submit" name="Submit" title="Submit" value="Submit" id="Submit"/>
                        </div>
                    </td>
                    <td>    
                        <div>
                            <input type="reset" class=" btn btn-info" value="Reset Form">
                        </div>
                    </td>
                </tr>
            </table>
        </form>
        <div id="grid">

        </div>
    </body>
</html>

