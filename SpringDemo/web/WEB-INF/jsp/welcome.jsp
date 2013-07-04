<%--
Views should be stored under the WEB-INF folder so that
they are not accessible except through controller process.

This JSP is here to provide a redirect to the dispatcher
servlet but should be the only JSP outside of WEB-INF.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <link type="text/css" rel="stylesheet" href="bootstrap/bootstrap.css" />
        <link type="text/css" rel="stylesheet" href="bootstrap/bootstrap-responsive.css" />
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <form action="index.htm">
            <ul class="nav nav-pills">
                <li class="active" class="btn btn-primary">
                    <a href="welcome.htm">Home</a>
                </li>
            </ul>
            <table align="center">
                <tr>
                    <td>
                        <input class="btn btn-large btn-block btn-primary" type="submit" value="Click for Issue Log Entry">
                    </td>
                </tr>
                <tr>
                    <td>
                        <input class="btn btn-large btn-block btn-primary" type="button" value="Click for Issue Lesson Learned" onclick="window.location='Lesson.htm'">
                    </td>    

                </tr>
            </table>
        </form>
    </body>
</html>
