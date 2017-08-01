<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <s:url var="master_style" value="/Resources/css/masterManager.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
        <link href="${master_style}" rel="stylesheet" type="text/css"/>
        <title>Add Staff - Edenz Research Manager</title>
    </head>
    <body>
        <jsp:include page="include/menu.jsp" />
        <s:url var="updateStaff_url" value="/admin/updateStaff"/>
        <div class="container-fluid">
            <div class="col-md-8 col-md-offset-2 ">
                <h3 class="text-center well">Add Staff</h3>
                <f:form class="col-md-8 col-md-offset-2" action="${updateStaff_url}" modelAttribute="staff" method="POST">
                <div class="form-group">
                    <label for="firstName">Firstname</label>
                    <f:input path="first_name" class="form-control" id="firstName" />
                </div>
                <div class="form-group">
                    <label for="lastName">Lastname</label>
                    <f:input path="last_name" class="form-control" id="lastName" />
                </div>
                <div class="form-group">
                    <label for="department">Department</label>
                    <f:select path="department" class="form-control" >
                        <f:option value="select">Select Department</f:option>
                        <f:option value="English">English</f:option>
                        <f:option value="TESOL">TESOL</f:option>
                        <f:option value="Bussiness">Business</f:option>
                        <f:option value="Film">Film</f:option>
                        <f:option value="Digital Media">Digital Media</f:option>
                        <f:option value="Health">Health</f:option>
                        <f:option value="Technology">Technology</f:option>
                    </f:select>
                </div>
                <div class="form-group">
                    <label for="designation">Designation</label>
                    <f:input path="designation" class="form-control" id="designation" />
                </div>
                <div class="form-group">
                    <label for="profile">Staff Profile Url</label>
                    <f:input path="profile_url" class="form-control" id="profile" />
                </div>
                <div class="form-group">
                    <label for="profileImg">Profile Image</label>
                    <f:input path="" type="file" id="profileImg"/>
                </div>
                 <div class="form-group">
                    <label for="status">Status</label>
                    <f:select path="staff_status" class="form-control" >
                        <f:option value="Active">Active</f:option>
                        <f:option value="Disabled">Disabled</f:option>
                    </f:select>
                </div>

                <button type="submit" class="btn btn-primary btn-block" id="submit">Submit</button>

            </f:form>
            </div>
        </div>

        <!-- /.navbar-collapse --> 
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
        <!-- Include all compiled plugins (below), or include individual files as needed --> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript">
            $(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
    </body>
</html>
