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
        <title>Add Document - Edenz Research Manager</title>
    </head>
    <body>
        <jsp:include page="include/menu.jsp" />
        <div class="container-fluid">
            <div class="col-md-8 col-md-offset-2">
                <s:url var="saveDoc_url" value = "/admin/saveProjects" />
                <s:url var="upload_url" value="/admin/upload" />
                <h3 class="text-center well">Add Projects</h3>
                <f:form class="col-md-8 col-md-offset-2" action="${saveDoc_url}"  method="post" modelAttribute="command" id="projectForm">
                    <div class="form-group">
                        <label for="title">Title</label>
                        <f:input path="title" class="form-control" id="formTitle" required="required"/>
                        <span id="titleError" class="text-danger"></span>                          
                    </div>
                    <div class="form-group">
                        <label for="citation">Citation</label>
                        <f:textarea path="citation" class="form-control" id="formCitation" required="required"/>
                        <span id="citationError" class="text-danger"></span>  
                    </div>
                    <div class="form-group">
                        <label for="description">Description</label>
                        <f:textarea path="description" class="form-control" rows="6" id="formDescription" required="required"/>
                        <span id="descriptionError" class="text-danger"></span>                                                  
                    </div>
                    <div class="form-group">
                        <label>Department</label>
                        <f:select path="department" name="department" class="form-control" id="formDepartment" required="required">
                            <f:option value="select department" />
                            <f:option value="Business" />
                            <f:option value="English" />
                            <f:option value="Education" />
                            <f:option value="Health" />
                            <f:option value="Technology" />
                        <span id="departmentError" class="text-danger"></span>                          
                      </f:select>
                    </div>
                    <div class="form-group">
                        <label for="author_one">Author 1</label>
                        <f:input path="author_one" type="text" class="form-control" id="formAuthor_one" placeholder="Firstname, Lastname;" required="required"/>
                        <span id="authorOneError" class="text-danger"></span>                                                
                    </div>
                    <div class="form-group">
                        <label for="author_two">Author 2</label>
                        <f:input path="author_two" type="text" class="form-control" id="formAuthor_two" placeholder="Firstname, Lastname;"/>
                    </div>
                    <div class="form-group">
                        <label for="author_three">Author 3</label>
                        <f:input path="author_three" type="text" class="form-control" id="formAuthor_three" placeholder="Firstname, Lastname;"/>
                    </div>
                    <div class="form-group">
                        <label for="author_four">Author 4</label>
                        <f:input path="author_four" type="text" class="form-control" id="formAuthor_four" placeholder="Firstname, Lastname"/>
                    </div>
                    <div class="form-group">
                        <label for="project_status">Project Status</label>
                        <f:select path="project_status" type="text" class="form-control" id="project_status" required="required">
                            <f:option value="Current">Current</f:option>
                            <f:option value="Past">Past</f:option>
                        </f:select>
                    </div>
                    
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary form-control">Submit</button>
                    </div>
                </f:form>
            </div>
        </div>
                

         <s:url var="validate" value="/Resources/js/documentValidation.js" />

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="${validate}"></script>
        <script type="text/javascript">
            $(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
    </body>
</html>
