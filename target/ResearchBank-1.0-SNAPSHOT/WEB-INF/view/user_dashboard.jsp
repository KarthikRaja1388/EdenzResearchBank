

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
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
        <link href="${master_style}" rel="stylesheet" type="text/css"/>
        <link href="${stylesheet}" rel="stylesheet" type="text/css" />
        
        <title>Department Admin Dashboard - Edenz Research Manager</title>
    </head>
    <body>
        <jsp:include page="include/menu.jsp" />
        <s:url var="document_image" value="/Resources/img/newuserdoc.png" />
        <s:url var="users_image" value="/Resources/img/users.png" />
        <main class="container-fluid" style="height: 100%">
                <div class="col-md-4" id="col-left">
                        <div class="col-md-12 dashboardnumbers well">
                            <h4 class="text-center">No. of Documents</h4>
                            <div class="col-md-12 text-center" id="documentImg">
                                <img  src="${document_image}" alt="documents">
                            </div>
                            <div class="col-md-12 text-center"> 
                                <p style="font-size: 40px">${documentCount}</p>
                            </div>
                        </div>
                    <br>
                        <div class="col-md-12 dashboardnumbers well">
                            <h4 class="text-center">Active Department Admins</h4>
                            <div id="activeUserImg" class="col-md-12 text-center" > 
                                <img src="${users_image}" alt="user"></div>
                            <div class="text-center col-md-12">
                                <p style="font-size:40px">${numberOfActiveUsers}</p>
                            </div>
                        </div>      
                    </div>
                <div class="col-md-8" id="col-right" style="height: 100%">
                   <h4 class="text-center well">Recently Added </h4>
                   <c:forEach var="depDocuments" items="${depDocument}">
                       <c:if test="${empty depDocuments}">
                                <div class="alert alert-warning">No Documents found</div>
                       </c:if>
                        <div class="well documentContainer">
                            <h4>${depDocuments.title}</h4>
                            <p>${depDocuments.description}</p>
                            
                        </div>
                    </c:forEach>
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
