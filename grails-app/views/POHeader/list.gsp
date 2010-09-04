
<%@ page import="com.ASC.POM.POHeader" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'POHeader.label', default: 'POHeader')}" />
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

                          <g:sortableColumn property="id" title="${message(code: 'POHeader.id.label', default: 'Id')}" />

                            <g:sortableColumn property="po_number" title="${message(code: 'POHeader.po_number.label', default: 'PO #')}" />
                        
                            <g:sortableColumn property="title" title="${message(code: 'POHeader.title.label', default: 'Title')}" />

                            <g:sortableColumn property="vendor" title="${message(code: 'POHeader.vendor.label', default: 'Vendor')}" />

                            <g:sortableColumn property="justification" title="${message(code: 'POHeader.justification.label', default: 'Justification')}" />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${POHeaderInstanceList}" status="i" var="POHeaderInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td><g:link action="show" id="${POHeaderInstance.id}">${fieldValue(bean: POHeaderInstance, field: "id")}</g:link></td>

                            <td>${fieldValue(bean: POHeaderInstance, field: "po_number")}</td>

                            <td>${fieldValue(bean: POHeaderInstance, field: "title")}</td>

                            <td>${fieldValue(bean: POHeaderInstance, field: "vendor")}</td>

                            <td>${fieldValue(bean: POHeaderInstance, field: "justification")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${POHeaderInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
