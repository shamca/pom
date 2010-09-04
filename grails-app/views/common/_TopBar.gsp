<%--
  Created by IntelliJ IDEA.
  User: mcarthurs
  Date: Jul 27, 2010
  Time: 12:08:25 PM
  To change this template use File | Settings | File Templates.
--%>


<div id="menu">
 <nobr>
 <g:if test="${session.user}">
 <b>${session.user?.firstName}&nbsp;${session.user?.lastName}</b> |
 <g:link controller="POUser" action="logout">Logout</g:link>
 </g:if>
 <g:else>
 <g:link controller="login" action="auth">Login</g:link>
 </g:else>
 </nobr>
</div>