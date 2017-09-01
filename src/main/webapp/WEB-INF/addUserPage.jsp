
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <s:url var="master_style" value="/Resources/css/masterManager.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
        <link href="${master_style}" rel="stylesheet" type="text/css"/>
        <title>Add Department Admin User - Edenz Research Manager</title>
    </head>
        <jsp:include page="include/menu.jsp" />
        <s:url var="addUser_action" value="/admin/saveuser" />
        <div class="container-fluid">
            <div class="col-md-8 col-md-offset-2 ">
                <h3 class="text-center well">Add Department Admin User</h3>
                <f:form class="col-md-8 col-md-offset-2" action="${addUser_action}"  modelAttribute="command" method="GET">
                    <div class="form-group">
                        <label>First Name :</label>
                        <f:input path="first_name" placeholder="FirstName" class="form-control" required="required"/>
                    </div>
                    <div class="form-group">
                        <label>Last Name :</label>
                        <f:input path="last_name" placeholder="LastName" class="form-control" required="required"/>
                    </div>
                    <div class="form-group">
                        <label>Department :</label>
                        <f:select path="department" name="department" class="form-control" required="required">
                            <f:option value="select department" />
                            <f:option value="Business" />
                            <f:option value="English" />
                            <f:option value="Technology" />
                        </f:select>
                    </div>
                    <div class="form-group">
                        <label>Email :</label>
                        <f:input path="email" placeholder="Email" class="form-control" required="required"/>
                    </div>
                    <div class="form-group">
                        <label>Password :</label>
                        <f:password path="password" placeholder="Password" class="form-control" required="required"/>
                    </div><br>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary form-control">Submit</button>
                    </div>
                </f:form>
            </div>
        </div>
        <s:url var="mainJs" value="/Resources/js/script.js" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="${mainJs}"></script>
        <script type="text/javascript">
        $(function(){
            $('[data-toggle="tooltip"]').tooltip();   
        });
        </script>
    </body>
</html>
