<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bug Tracking-Lesson Learned System</title>

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
        <script>
            $(document).ready(function() {
                $('.datepicker').datepicker();
            });
        </script>

        <script>
            $(function () { $("input,select,textarea").not("[type=submit]").jqBootstrapValidation(); } );
        </script>


    </head>
    <body>
        <form class="form-horizontal" id="form1" name="form1" method="POST" action="submit.htm?cmdAction=submit">
            <ul class="nav nav-pills">
                <li class="active">
                    <a href="welcome.htm">Home</a>
                </li>
                <li class="active">
                    <a href="DisplayData.htm">Show Data</a>
                </li>
            </ul>
            <table border="0">
                <tr align="center">
                    <td>
                        <div class="control-group">
                            <label class="control-label">Project*</label>
                            <div class="controls">
                                <input type="text" name="pname" required id="pname" />
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="control-group">
                            <label class="control-label">Module Name*</label>
                            <div class="controls">
                                <select name="mname" id="mname">
                                    <option id="1">LogIn</option>
                                    <option id="2">LogOut</option>
                                    <option id="3">Transaction Module</option>
                                    <option id="4">Account Module</option>
                                    <option id="5">Sales Module</option>
                                </select>
                            </div>
                        </div>
                    </td>
                </tr>

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
                        <div class="control-group"  >
                            <label class="control-label ">Prepared By*</label>
                            <div class="controls">
                                <select name="prepby" id="prepby" required>
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

                <tr>
                    <td>
                        <div class="control-group"  >
                            <label class="control-label ">Category*</label>
                            <div class="controls">
                                <select name="category" id="category" required>
                                    <option id="1">Comm MGT</option>
                                    <option id="2">HR MGT</option>
                                    <option id="3">Finance MGT</option>
                                    <option id="4">IT Dept</option>
                                </select>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr align="center">
                    <td>
                        <div class="control-group">
                            <label class="control-label">Issue Description</label>
                            <div class="bs-docs-example form-inline" class="controls">
                                <textarea rows="3" style="width: 183px; height: 57px;" required name="idesc" id="idesc"></textarea>
                            </div>
                        </div>
                    </td>

                    <td>
                        <div class="control-group">
                            <label class="control-label">Reason</label>
                            <div class="bs-docs-example form-inline" class="controls">
                                <textarea rows="3" style="width: 183px; height: 57px;" required name="reason" id="reason"></textarea>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr align="center">
                    <td>
                        <div class="control-group">
                            <label class="control-label">Event</label>
                            <div class="controls">
                                <input type="text" name="event" id="event" />
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="control-group">
                            <label class="control-label">Corrective Action</label>
                            <div class="controls">
                                <input type="text" name="caction" id="caction" />
                            </div>
                        </div>
                    </td>
                </tr>
                <tr align="center">
                    <td>
                        <div class="control-group">
                            <label class="control-label">Time Taken(Hr.)</label>
                            <div class="controls">
                                <input type="number" data-validation-number-message="Only Digits are allowed" name="time" id="time" value="0" />
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="control-group">
                            <label class="control-label">Impact</label>
                            <div class="controls">
                                <input type="text" name="impt" id="impt" />
                            </div>
                        </div>
                    </td>
                </tr>

                <tr align="center">
                    <td>
                        <div class="control-group">
                            <label class="control-label">Remark</label>
                            <div class="controls">
                                <input type="text" name="remark" id="remark" />
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
                            <input type="reset" class=" btn btn-info" value="Reset">
                        </div>
                    </td>
                </tr>

            </table>
        </form>
        <div id="grid">

        </div>
    </body>
</html>

<!--
onclick="callajax('submit.htm?cmdAction=submit','grid');"



Email

<label class="control-label" for="inputIcon">Email address</label>
                            <div class="controls">
                                <div class="input-prepend">
                                    <span class="add-on"><i class="icon-envelope"></i></span>
                                    <input class="span2" id="inputIcon" type="email" name="email">
                                </div>
                            </div>
-->
