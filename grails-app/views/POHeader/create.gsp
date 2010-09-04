

<%@ page import="com.ASC.POM.POHeader" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'POHeader.label', default: 'POHeader')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1>New PO</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${POHeaderInstance}">
            <div class="errors">
                <g:renderErrors bean="${POHeaderInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="po_number"><g:message code="POHeader.po_number.label" default="PO Number" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: POHeaderInstance, field: 'po_number', 'errors')}">
                                    <g:textField name="po_number" value="${fieldValue(bean: POHeaderInstance, field: 'po_number')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="title"><g:message code="POHeader.title.label" default="Title" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: POHeaderInstance, field: 'title', 'errors')}">
                                    <g:textField name="title" value="${POHeaderInstance?.title}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="vendor"><g:message code="POHeader.vendor.label" default="Vendor" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: POHeaderInstance, field: 'vendor', 'errors')}">
                                    <g:textField name="vendor" value="${POHeaderInstance?.vendor}" />
                                </td>
                            </tr>
                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="justification"><g:message code="POHeader.justification.label" default="Justification" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: POHeaderInstance, field: 'justification', 'errors')}">
                                <g:textField name="justification" value="${POHeaderInstance?.justification}" />
                            </td>
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="fiscalYear"><g:message code="POHeader.fiscalYear.label" default="Fiscal Year" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: POHeaderInstance, field: 'fiscalYear', 'errors')}">
                                <g:datePicker name="fiscalYear" precision="year" value="${POHeaderInstance?.fiscalYear}"  />
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
