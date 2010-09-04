
<%@ page import="com.ASC.POM.POUser" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'POUser.label', default: 'POUser')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'POUser.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="firstName" title="${message(code: 'POUser.firstName.label', default: 'First Name')}" />
                        
                            <g:sortableColumn property="lastName" title="${message(code: 'POUser.lastName.label', default: 'Last Name')}" />
                        
                            <g:sortableColumn property="userId" title="${message(code: 'POUser.userId.label', default: 'User Id')}" />
                        
                            <g:sortableColumn property="userName" title="${message(code: 'POUser.userName.label', default: 'User Name')}" />
                        
                            <g:sortableColumn property="userPw" title="${message(code: 'POUser.userPw.label', default: 'User Pw')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${POUserInstanceList}" status="i" var="POUserInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${POUserInstance.id}">${fieldValue(bean: POUserInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: POUserInstance, field: "firstName")}</td>
                        
                            <td>${fieldValue(bean: POUserInstance, field: "lastName")}</td>
                        
                            <td>${fieldValue(bean: POUserInstance, field: "userId")}</td>
                        
                            <td>${fieldValue(bean: POUserInstance, field: "userName")}</td>
                        
                            <td>${fieldValue(bean: POUserInstance, field: "userPw")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${POUserInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
