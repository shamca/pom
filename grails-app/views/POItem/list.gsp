
<%@ page import="com.ASC.POM.POItem" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'POItem.label', default: 'POItem')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'POItem.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="POItemDescription" title="${message(code: 'POItem.poitem_description.label', default: 'POI tem Description')}" />
                        
                            <g:sortableColumn property="costPerUnit" title="${message(code: 'POItem.costPerUnit.label', default: 'Cost Per Unit')}" />
                        
                            <g:sortableColumn property="extendedCost" title="${message(code: 'POItem.extendedCost.label', default: 'Extended Cost')}" />
                        
                            <th><g:message code="POItem.poheader.label" default="Poheader" /></th>
                        
                            <g:sortableColumn property="qty" title="${message(code: 'POItem.qty.label', default: 'qty')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${POItemInstanceList}" status="i" var="POItemInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${POItemInstance.id}">${fieldValue(bean: POItemInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: POItemInstance, field: "poitem_description")}</td>
                        
                            <td>${fieldValue(bean: POItemInstance, field: "cost_per_unit")}</td>
                        
                            <td>${fieldValue(bean: POItemInstance, field: "extended_cost")}</td>
                        
                            <td>${fieldValue(bean: POItemInstance, field: "poheader")}</td>
                        
                            <td>${fieldValue(bean: POItemInstance, field: "qty")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${POItemInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
