<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Edit User - Edenz Research Bank Manager</title>

        <s:url var="master_style" value="/Resources/css/masterManager.css" />

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
        <link href="${master_style}" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <jsp:include page="include/menu.jsp" />
        <div class="container-fluid">
            <div class="col-md-8 col-md-offset-2 ">
            <h3 class="text-center well">Edit Admin Details</h3>
            <s:url var="update_url" value="/admin/updateUser" >
                <s:param name="userId" value="${user_id}" />
            </s:url>
            <p>${update_error}</p>

            <f:form class="col-md-8 col-md-offset-2" action="${update_url}" method="post" modelAttribute="user" >
                <div class="form-group">
                    <label for="firstName">Firstname</label>
                    <f:input path="first_name"  class="form-control" id="firstName" />
                </div>
                <div class="form-group">
                    <label for="lastName">Lastname</label>
                    <f:input path="last_name"  class="form-control" id="lastName" />
                </div>
                <div class="form-group">
                    <label for="department">Department</label>
                    <f:select path="department" class="form-control" >
                        <f:option value="select Department" />
                        <f:option value="English" />
                        <f:option value="Business" />
                        <f:option value="Film" />
                        <f:option value="Digital Media" />
                        <f:option value="Health" />
                        <f:option value="Technology" />
                    </f:select>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <f:input type="email" path="email" class="form-control" id="email" />
                </div>
                <div class="form-group">
                    <label for="role">Role</label>
                    <f:select path="role" class="form-control" id="role">
                        <f:option value="Department Admin" />
                        <f:option value="Admin" />
                    </f:select>
                </div>
                <div class="form-group">
                    <label for="department">Status</label>
                    <f:select class="form-control" path="account_status">
                        <f:option value="Active" />
                        <f:option value="Disabled" />
                    </f:select>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary form-control">Submit</button>
                </div>
            </f:form>
            </div>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript">
            $(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
    </body>
</html>
