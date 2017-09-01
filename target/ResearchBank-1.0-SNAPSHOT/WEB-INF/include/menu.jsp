<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib  uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${sessionScope.role eq 'Admin'}">
        <div class="container-fluid" id="titleContainer">
            <div class="row" id="titleInfo">
                <h3 class="text-left col-md-6">Research Bank Manager</h3>
                <div class="col-md-6" id="userInfo"><p class="pull-right col-md-4"> Welcome ${currentUser}(${userRole}) </p></div>
            </div>
        </div>
<nav class="navbar navbar-inverse" id="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navItems" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <!-- URL's for icons-->
            <s:url var="dashboard" value="/Resources/img/dashboard.png" />

            <s:url var="addUser" value="/Resources/img/add-user.png" />
            <s:url var="editUser" value="/Resources/img/edit-user.png" />
            <s:url var="addDoc" value="/Resources/img/add-docs.png" />
            <s:url var="editDoc" value="/Resources/img/edit-docs.png" />
            <s:url var="addStaff" value="/Resources/img/add-group.png" />    
            <s:url var="editStaff" value="/Resources/img/edit-group.png" />
            <s:url var="addResearch" value="/Resources/img/addResearch.png" />
            <s:url var="editResearch" value="/Resources/img/editResearch.png" />
            <s:url var="logout" value="/Resources/img/logout-32.png" />

            <!--URL's for anchor tags-->
            <s:url var="dashboard_url" value="/admin/dashboard"/>
            <s:url var="addUser_url" value="/admin/addUser"/>
            <s:url var="editUser_url" value="/admin/userList"/>
            <s:url var="addDoc_url" value="/admin/addDocument" />
            <s:url var="editDoc_url" value="/admin/documents" />
            <s:url var="addStaff_url" value="/admin/addStaffPage" />
            <s:url var="editStaff_url" value="/admin/staff" />
            <s:url var="addProject_url" value="/admin/addProjects" />
            <s:url var="projects_url" value="/admin/Projects" />
            <s:url var="logout_url" value="/admin/logout" />
            
            
            <div class="collapse navbar-collapse" id="navItems">
                <ul class="nav navbar-nav">
                    <li><a href="${dashboard_url}" data-toggle="tooltip" data-placement="bottom" title="Dashboard"><img src="${dashboard}" alt="Dashboard"/></a></li>
                    <li><a href="${addUser_url}" data-toggle="tooltip" data-placement="bottom" title="Add Admin User"><img src="${addUser}" alt="add user"></a></li>
                    <li><a href="${editUser_url}" data-toggle="tooltip" data-placement="bottom" title="Edit Admin User"><img src="${editUser}" alt="edit user"></a></li>
                    <li><a href="${addDoc_url}" data-toggle="tooltip" data-placement="bottom" title="Add Publications"><img src="${addDoc}" alt="add documents"></a></li>
                    <li><a href="${editDoc_url}" data-toggle="tooltip" data-placement="bottom" title="Edit Publications"><img src="${editDoc}" alt="edit documents"></a></li>
                    <li><a href="${addStaff_url}" data-toggle="tooltip" data-placement="bottom" title="Add Staff"><img src="${addStaff}" alt="edit documents"></a></li>
                    <li><a href="${editStaff_url}" data-toggle="tooltip" data-placement="bottom" title="Edit Staff"><img src="${editStaff}" alt="edit documents"></a></li>
                    <li><a href="${addProject_url}" data-toggle="tooltip" data-placement="bottom" title="Add Current/past Researches"><img src="${addResearch}" alt="Add Researches"></a></li>
                    <li><a href="${projects_url}" data-toggle="tooltip" data-placement="bottom" title="Edit Current/past Researches"><img src="${editResearch}" alt="Edit Researches"></a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="${logout_url}" data-toggle="tooltip" data-placement="bottom" title="Logout" id="logout"><img src="${logout}" alt="logout"></a></li>
                </ul>
            </div>
        </nav>
</c:if>

<c:if test="${sessionScope.role eq 'Department Admin'}">
        <div class="container-fluid" id="titleContainer">
            <div class="row" id="titleInfo">
                <h3 class="text-left col-md-6">Research Bank Manager</h3>
                <div class="col-md-6" id="userInfo"><p class="pull-right">Welcome ${currentUser} (${userRole})</p></div>
            </div>
        </div>
<nav class="navbar navbar-inverse" id="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navItems" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <!-- URL's for icons-->
            <s:url var="dashboard" value="/Resources/img/dashboard.png" />

            <s:url var="addDoc" value="/Resources/img/add-docs.png" />
            <s:url var="editDoc" value="/Resources/img/edit-docs.png" />
            <s:url var="logout" value="/Resources/img/logout-32.png" />

            <!--URL's for anchor tags-->
            <s:url var="dashboard_url" value="/depAdmin/dashboard"/>
            <s:url var="addDoc_url" value="/depAdmin/addDocument" />
            <s:url var="editDoc_url" value="/depAdmin/depDocuments" />
            <s:url var="logout_url" value="/depAdmin/logout" />

            <div class="collapse navbar-collapse" id="navItems">
                <ul class="nav navbar-nav">
                    <li><a href="${dashboard_url}" data-toggle="tooltip" data-placement="bottom" title="Dashboard"><img src="${dashboard}" alt="Dashboard"/></a></li>
                    <li><a href="${addDoc_url}" data-toggle="tooltip" data-placement="bottom" title="Add Publications"><img src="${addDoc}" alt="add documents"></a></li>
                    <li><a href="${editDoc_url}" data-toggle="tooltip" data-placement="bottom" title="Edit Publications"><img src="${editDoc}" alt="edit documents"></a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="${logout_url}" data-toggle="tooltip" data-placement="bottom" title="Logout" id="logout"><img src="${logout}" alt="logout"></a></li>
                </ul>
            </div>
        </nav>
</c:if>