<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"><!--Bootstrap-->
        <s:url var="login_style" value="/Resources/css/login.css" />
        <link href="${login_style}" rel="stylesheet" type="text/css"/>
        <title>Edenz Research Bank Manager - Login</title>
    </head>

    <s:url var="bg_img" value="/Resources/img/LoginBg.jpeg" />
    <body background="${bg_img}">
        <nav class="navbar navbar-inverse navbar-fixed-top" id="navbar">
            <h3 class="text-left" id="navTitle">Edenz Research Bank Manager</h3>
        </nav>
        <section>
            <div class="row">
                <div id="formContainer" class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2 col-xs-8 col-xs-offset-2">
                    <div class="col-md-10 col-md-offset-1 col-sm-10 col-sm-offset-1 col-xs-10 col-xs-offset-1 text-center" id="formHeader">Login</div>
                    <s:url var="login_url" value="/login" />
                    <c:if test="${error != null}">
                        <div class="col-md-10 col-md-offset-1 col-sm-10 col-sm-offset-1 col-xs-10 col-xs-offset-1 text-center">
                            <p class="error">${error}</p>
                        </div>
                    </c:if>
                    <f:form action="${login_url}" method="post" modelAttribute="login" class="col-md-10 col-md-offset-1 col-sm-10 col-sm-offset-1 col-xs-10 col-xs-offset-1" id="loginForm">
                        <div class="form-group form-spacing">
                            <f:input type="text" path="loginName" class="form-control" placeholder="Email" />
                        </div>       	
                        <div class="form-group form-spacing">
                            <f:password path="password" class="form-control" placeholder="Password" />
                        </div>
                        <button class="form-control btn btn-primary form-spacing" type="submit">Log in</button>
                    </f:form> 
                    <div class="col-md-10 col-md-offset-1 col-sm-10 col-sm-offset-1 col-xs-10 col-xs-offset-1 text-center" id="forgotPasswordLink">
                        <small><a href="">Forgot password</a></small>
                    </div>
                </div> 
            </div>  
        </section>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </body>
</html>
