<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'POHeader.label', default: 'POHeader')}"/>
  <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>
<body>
<h1 style="margin-left:20px;">Welcome to POM!</h1>
<p style="margin-left:20px;width:80%">
  This application was built to manage purchase orders.
 </p><br/>
<p style="margin-left:20px;width:80%">
 Select a function: 
</p>
<br/>
<div class="dialog" style="margin-left:20px;width:60%;">
  <ul>
    <g:each var="c" in="${grailsApplication.controllerClasses}">
      <li class="controller"><a href="${c.logicalPropertyName}">
        ${c.fullName}</a></li>
    </g:each>
  </ul>
</div>
</body>
</html>