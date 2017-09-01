
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <s:url var="master_style" value="/Resources/css/masterManager.css" />
        <s:url var="userList_style" value="/Resources/css/userList.css" />

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
        <link href="${master_style}" rel="stylesheet" type="text/css"/>
        <title>Research List - Edenz Research Manager</title>
    </head>
    <body>
        <jsp:include page="include/menu.jsp" />
        <div class="container-fluid">
            <div class="col-md-12">
                <h3 class="text-left well">Researches</h3>
                <c:if test="${param.act eq 'sv'}">
                    <div class="alert alert-success text-center">
                        <a href="#" class="close" data-dismiss="alert">&times;</a>
                        <Strong >Document Saved Successfully</strong>
                    </div>                
                </c:if>
                <c:if test="${param.act eq 'del'}">
                    <div class="alert alert-danger text-center">
                        <a href="#" class="close" data-dismiss="alert">&times;</a>                        
                        <Strong class="text-center">Document Deleted </strong>
                    </div>                
                </c:if>
                <c:if test="${param.act eq 'u'}">
                    <div class="alert alert-success text-center">
                        <a href="#" class="close" data-dismiss="alert">&times;</a>
                        <Strong class="text-center">Document Updated Successfully</strong>
                    </div>
                </c:if>

                <table class="table table-hover table-striped">
                    <tr>
                        <th>PROJECT ID</th>
                        <th>TITLE</th>
                        <th>DEPARTMENT</th>
                        <th>AUTHOR 1</th>
                        <th>AUTHOR 2</th>
                        <th>AUTHOR 3</th>
                        <th>AUTHOR 4</th>
                        <th>STATUS</th>
                        <th>ACTION</th>
                    </tr>
                    <c:forEach var="project" items="${projects}" varStatus="status">
                        <tr>
                            <td>PRO${project.project_id}</td>
                            <td><div style="height: 80px;overflow:hidden;">${project.title}</div></td>
                            <td>${project.department}</td>
                            <td>${project.author_one}</td>
                            <td>${project.author_two}</td>
                            <td>${project.author_three}</td>
                            <td>${project.author_four}</td>
                            <td>${project.project_status}</td>
                            
                            <s:url var="delete_url" value="/admin/deleteProjects" >
                                <s:param  name="projectId" value="${project.project_id}"/>
                            </s:url>
                            <s:url var="edit_url" value="/admin/editProjects" >
                                <s:param  name="projectId" value="${project.project_id}"/>
                            </s:url>
                            <td><a href="${edit_url}">Edit&nbsp;</a> |<a href="${delete_url}"> Delete</a></td>
                        </tr>
                        <tr>
                            <c:if test="${project.title eq ''}">
                            <tr>
                                <td colspan="10">No documents found</td>
                            </tr>
                            </c:if>
                        </c:forEach>
                    </table>
                </div>
            </div>
            <s:url var="mainJs" value="/Resources/js/script.js" />

            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
            <script src="${mainJs}"></script>
            <script type="text/javascript">
                $(function () {
                    $('[data-toggle="tooltip"]').tooltip();
                });
            </script>
        </body>
    </html>
