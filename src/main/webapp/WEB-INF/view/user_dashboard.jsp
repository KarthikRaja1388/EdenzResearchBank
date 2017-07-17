

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib  uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <s:url var="master_style" value="/Resources/css/master.css" />
        <s:url var="dashboard_stye" value="/Resources/css/dashboard.css" />
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
        <link href="${master_style}" rel="stylesheet" type="text/css"/>
        <link href="${stylesheet}" rel="stylesheet" type="text/css" />
        
        <title>Department Admin Dashboard - Edenz Research Manager</title>
    </head>
    <body>
        <div class="container-fluid" id="titleContainer">
            <div class="row" id="titleInfo">
                <h3 class="text-left col-md-6">Research Bank Manager</h3>
                <div class="col-md-6" id="userInfo"><p class="pull-right">User Name</p></div>
            </div>
        </div>
        <jsp:include page="include/menu.jsp" />
        <s:url var="document_image" value="/Resources/img/newuserdoc.png" />
        <s:url var="users_image" value="/Resources/img/users.png" />
        <main class="container-fluid">
            <div class="container">
                <div class="col-md-4" id="col-left">
                    <div class="row">
                        <div class="col-md-6 dashboardnumbers">
                            <div class="col-md-12 text-center" id="documentImg">
                                <img  src="${document_image}" alt="documents">
                            </div>
                            <div class="col-md-12 text-center"> <strong>1245</strong><br> No.Of.Documents </div>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-6 dashboardnumbers">
                            <div id="activeUserImg" class="col-md-12 text-center" > 
                                <img src="${users_image}" alt="user"></div>
                            <div class="text-center col-md-12">
                                <strong>150</strong><br> No.Of.Active users 
                            </div>
                        </div>      
                    </div>
                </div>
                <div class="col-md-8" id="col-right">
                    <div class="row">
                        <h3>Recently added documents</h3>
                        <div class="recentlyAddedDocuments">
                            <h4>Estimation of Internet Node Location by Latency Measurements</h4>
                            <p>Komosny, D., Voznak, M., Ganeshan, K., and Sathu, H. (2015). Estimation of Internet Node Location by Latency Measurements - The Underestimation Problem. Information Technology and Control, 2015, vol. 44, no. 3, pp. 279-286. ISSN: 1392- 124X.</p>
                        </div><br>
                        <div class="recentlyAddedDocuments">
                            <h4> IETF 6LoWPAN and Sensor Networking</h4>
                            <p>Cervenka, V., Komosny, D., and Ganeshan, K. (2011). IETF 6LoWPAN and Sensor Networking. 6th International Conference on Teleinformatics. Brno University of Technology, Dolni Morava, Czech Republic. 2 - 4 February, 2011. pp 69-73.</p>
                        </div><br>
                        <div class="recentlyAddedProjects">
                            <h4> Topology aware feedback transmission for real-time control protocol</h4>
                            <p>Burget, R., Komosny, D., and Ganeshan, K. (2012). Topology aware feedback transmission for real-time control protocol. Journal of Network and Computer Applications. 35/2 : 723-730. </p>
                        </div>
                    </div>
                </div>
            </div>
        </main>
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
