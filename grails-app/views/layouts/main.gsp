<html>
<head>
  <title><g:layoutTitle default="POM"/>
  </title>
  <link rel="stylesheet"
          href="${createLinkTo(dir: 'css', file: 'main.css')}"/>
  <link rel="shortcut icon"
          href="${createLinkTo(dir: 'images', file: 'favicon.ico')}"
          type="image/x-icon"/>
  <g:layoutHead/>
  <g:javascript library="application"/>
</head>
<body>
<div id="page">
  <g:render template="/common/topbar"/>
  <div id="header">
    <h1>ASC POM</h1>
  </div>
  <div id="content">
    <g:layoutBody/>
  </div>

  <div id="sidebar">
    <g:render template="/common/buddies"/>
  </div>

  <div id="footer">
    <g:render template="/common/footer"/>
  </div>
</div>
</body>
</html>