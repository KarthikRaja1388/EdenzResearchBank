<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>       
<!--Nav bar-->
        <nav class="navbar navbar-inverse" id="navigation">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navItems" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <!--<a class="navbar-brand" href="#" id="logo">EDENZ</a>-->
                </div>
                <s:url var="index_url" value="/" />
                <s:url var="currentProjects_url" value="/currentProjects" />
                <s:url var="pastProjects_url" value="/pastProjects" />
                <s:url var="staffResearch_url" value="/staffResearch" />
                <s:url var="funding_url" value="/funding" />
                <s:url var="ideas_url" value="/ideas" />
                <div class="collapse navbar-collapse" id="navItems">
                    <ul class="nav navbar-nav">
                        <li><a href="${index_url}"><span class="glyphicon glyphicon-home"></span></a></li>
                        <li><a href="${currentProjects_url}">Current Projects</a></li>
                        <li><a href="${pastProjects_url}">Past Projects</a></li>
                        <li><a href="${staffResearch_url}">Staff Research</a></li>
                        <li><a href="${funding_url}">Funding</a></li>
                        <li><a href="${ideas_url}">Ideas</a></li>
                    </ul>
                    <s:url var="login_url" value="/loginApp"/>
                    <ul class="nav navbar-nav pull-right">
                        <li><a href="${login_url}"><span class="glyphicon glyphicon-user"></span>&nbsp;Login</a></li>
                    </ul>
                </div>
            </div>
        </nav>