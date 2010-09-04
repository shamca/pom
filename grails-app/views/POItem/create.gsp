

<%@ page import="com.ASC.POM.POItem" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'POItem.label', default: 'POItem')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${POItemInstance}">
            <div class="errors">
                <g:renderErrors bean="${POItemInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="poitem_description"><g:message code="POItem.poitem_description.label" default="POI tem Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: POItemInstance, field: 'poitem_description', 'errors')}">
                                    <g:textField name="poitem_description" value="${POItemInstance?.poitem_description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cost_per_unit"><g:message code="POItem.cost_per_unit.label" default="Cost Per Unit" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: POItemInstance, field: 'cost_per_unit', 'errors')}">
                                    <g:textField name="cost_per_unit" value="${fieldValue(bean: POItemInstance, field: 'cost_per_unit')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="extended_cost"><g:message code="POItem.extended_cost.label" default="Extended Cost" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: POItemInstance, field: 'extended_cost', 'errors')}">
                                    <g:textField name="extended_cost" value="${fieldValue(bean: POItemInstance, field: 'extended_cost')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="poheader"><g:message code="POItem.poheader.label" default="Poheader" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: POItemInstance, field: 'poheader', 'errors')}">
                                    <g:select name="poheader.id" from="${com.ASC.POM.POHeader.list()}" optionKey="id" value="${POItemInstance?.poheader?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="qty"><g:message code="POItem.qty.label" default="Qty" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: POItemInstance, field: 'qty', 'errors')}">
                                    <g:textField name="qty" value="${fieldValue(bean: POItemInstance, field: 'qty')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="recipient"><g:message code="POItem.recipient.label" default="Recipient" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: POItemInstance, field: 'recipient', 'errors')}">
                                    <g:textField name="recipient" value="${POItemInstance?.recipient}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
