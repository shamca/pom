
<%@ page import="com.ASC.POM.POItem" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'POItem.label', default: 'POItem')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="POItem.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: POItemInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="POItem.POItemDescription.label" default="POI tem Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: POItemInstance, field: "poitem_description")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="POItem.cost_per_unit.label" default="Cost Per Unit" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: POItemInstance, field: "cost_per_unit")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="POItem.extended_cost.label" default="Extended Cost" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: POItemInstance, field: "extended_cost")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="POItem.poheader.label" default="Poheader" /></td>
                            
                            <td valign="top" class="value"><g:link controller="POHeader" action="show" id="${POItemInstance?.poheader?.id}">${POItemInstance?.poheader?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="POItem.qty.label" default="Qty" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: POItemInstance, field: "qty")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="POItem.recipient.label" default="Recipient" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: POItemInstance, field: "recipient")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${POItemInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
