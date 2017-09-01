

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib  uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <s:url var="master_style" value="/Resources/css/masterManager.css" />
        <s:url var="dashboard_stye" value="/Resources/css/dashboard.css" />
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="${master_style}" rel="stylesheet" type="text/css"/>
        <link href="${stylesheet}" rel="stylesheet" type="text/css" />
        
        <title>Admin Dashboard - Edenz Research Manager</title>
    </head>
    <body>
        <!--Menu-->
        <jsp:include page="include/menu.jsp" />
        <s:url var="document_image" value="/Resources/img/newuserdoc.png" />
        <s:url var="users_image" value="/Resources/img/users.png" />
        <main class="container-fluid">
            <div class="container">
                <div class="col-md-4" id="col-left">
                        <div class="col-md-12 dashboardnumbers well">
                            <h4 class="text-center">No. of Documents</h4>
                            <div class="col-md-12 text-center" id="documentImg">
                                <img  src="${document_image}" alt="documents">
                            </div>
                                <div class="col-md-12 text-center"> 
                                    <s:url var="docuuments_url" value="/admin/documents" />
                                    <a href="${docuuments_url}"><p style="font-size:40px">${documentCount}</p></a>
                                    
                                </div>
                        </div>
                        <div class="col-md-12 dashboardnumbers well">
                             <h4 class="text-center">Active Department Admins</h4>
                            <div id="activeUserImg" class="col-md-12 text-center" > 
                                <img src="${users_image}" alt="user"></div>
                            <div class="text-center col-md-12">
                               
                                <s:url var="users_url" value="/admin/userList" />
                                <a href="${users_url}"><p style="font-size:40px">${numberOfActiveUsers}</p></a>
                                    
                            </div>
                        </div>      
                </div>
                <div class="col-md-8" id="col-right">
                    <h4 class="text-center well">Recently Added</h4>
                    
                    <c:forEach var="documents" items="${documents}">
                        <div class="well documentContainer">
                            <h4>${documents.title}</h4>
                            <p>${documents.description}</p>
                            <small style="font-weight:bold;" class="alert alert-info">Department : ${documents.department}</small>
                            
                        </div>
                    </c:forEach>
                </div>
            </div>
        </main>
        <jsp:include page="include/footer.jsp" />
        <s:url var="mainJs" value="/Resources/js/script.js" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript">
            $(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
    </body>
</html>
