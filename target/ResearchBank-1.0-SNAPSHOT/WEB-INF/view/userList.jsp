
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <s:url var="master_style" value="/Resources/css/master.css" />
        <s:url var="userList_style" value="/Resources/css/userList.css" />
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
        <link href="${master_style}" rel="stylesheet" type="text/css"/>
        <title>Admin Users - Edenz Research Manager</title>
    </head>
    <body>
        <div class="container-fluid" id="titleContainer">
            <div class="row" id="titleInfo">
                <h3 class="text-left col-md-6">Research Bank Manager</h3>
                <div class="col-md-6" id="userInfo"><p class="pull-right">Super User</p></div>
            </div>
        </div>
        <jsp:include page="include/menu.jsp" />
        <div class="container-fluid">
            <div class="col-md-10 col-md-offset-1">
                <h3 class="text-left well">Admin Users</h3>
                <c:if test="${param.act eq 'sv'}">
                    <div class="alert alert-success text-center">
                        <a href="#" class="close" data-dismiss="alert">&times;</a>
                        <Strong >User Saved Successfully</strong>
                    </div>                
                </c:if>
                <c:if test="${param.act eq 'del'}">
                    <div class="alert alert-danger text-center">
                        <a href="#" class="close" data-dismiss="alert">&times;</a>                        
                        <Strong class="text-center">User Deleted </strong>
                    </div>                
                </c:if>
                <c:if test="${param.act eq 'u'}">
                    <div class="alert alert-success text-center">
                        <a href="#" class="close" data-dismiss="alert">&times;</a>
                        <Strong class="text-center">User Update Successfully</strong>
                    </div>
                </c:if>

                <table class="table table-hover">
                    <tr>
                        <th>USER ID</th>
                        <th>FIRST NAME</th>
                        <th>LAST NAME</th>
                        <th>DEPARTMENT</th>
                        <th>EMAIL</th>
                        <th>ROLE</th>
                        <th>STATUS</th>
                        <th>ACTION</th>
                    </tr>
                    <c:forEach var="user" items="${users}" varStatus="status">
                        <tr>
                            <td>${user.user_id}</td>
                            <td>${user.first_name}</td>
                            <td>${user.last_name}</td>
                            <td>${user.department}</td>
                            <td>${user.email}</td>
                            <td>${user.role}</td>
                            <td>${user.account_status}</td>
                            
                            <s:url var="delete_url" value="/admin/deleteUser" >
                                <s:param  name="userId" value="${user.user_id}"/>
                            </s:url>
                            <s:url var="edit_url" value="/admin/editUser" >
                                <s:param  name="userId" value="${user.user_id}"/>
                            </s:url>
                         
                            <td><a href="${edit_url}">Edit&nbsp;</a> |<a href="${delete_url}"> Delete</a></td>
                        </tr>
                    </c:forEach> 
                </table>
            </div>
        </div>
        <s:url var="mainJs" value="/Resources/js/script.js" />
        <s:url var="editableJs" value="/Resources/js/bootstrap-editable.min.js" />
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="${mainJs}"></script>
        <script src="${editableJs}"></script>
        <script type="text/javascript">
        $(function(){
            $('[data-toggle="tooltip"]').tooltip();   
        });
        </script>
    </body>
</html>
