

<%@ page import="com.ASC.POM.POHeader" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'POHeader.label', default: 'POHeader')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1>Edit PO # ${fieldValue(bean: POHeaderInstance, field: 'po_number')}</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${POHeaderInstance}">
            <div class="errors">
                <g:renderErrors bean="${POHeaderInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${POHeaderInstance?.id}" />
                <g:hiddenField name="version" value="${POHeaderInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>

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


                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="poitems"><g:message code="POHeader.poitems.label" default="Poitems" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: POHeaderInstance, field: 'poitems', 'errors')}">

<ul>
<g:each in="${POHeaderInstance?.poitems?}" var="p">
    <li><g:link controller="POItem" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="POItem" action="create" params="['POHeader.id': POHeaderInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'POItem.label', default: 'POItem')])}</g:link>

                                </td>
                            </tr>







                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
