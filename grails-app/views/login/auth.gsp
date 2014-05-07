<html>
<head>
	<meta name='layout' content='main'/>
	<title><g:message code="springSecurity.login.title"/></title>
</head>

<body>

<g:if test='${flash.message}'>
    <div class='login_message'>${flash.message}</div>
</g:if>

<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">
            <g:message code="springSecurity.login.header"/>
        </h3>
    </div>
    <div class="panel-body">

        <form class="form-horizontal" role="form" action='${postUrl}' method='POST' id='loginForm'>
            <div class="form-group">
                <label for="username" class="col-sm-2 control-label">
                    <g:message code="springSecurity.login.username.label"/>
                </label>
                <div class="col-sm-10">
                    <input type='text' class='form-control' name='j_username' id='username' value="${params?.username}"/>
                </div>
            </div>

            <div class="form-group">
                <label for="password" class="col-sm-2 control-label">
                    <g:message code="springSecurity.login.password.label"/>
                </label>
                <div class="col-sm-10">
                    <input type='password' class='form-control' name='j_password' id='password'/>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <div class="checkbox">
                        <label>
                            <input type='checkbox' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
                            <g:message code="springSecurity.login.remember.me.label"/>
                        </label>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-primary">${message(code: "springSecurity.login.button")}</button>
                </div>
            </div>
        </form>

    </div>
</div>

<r:script>
	<!--
	(function() {
		document.forms['loginForm'].elements['j_username'].focus();
	})();
	// -->
</r:script>
</body>
</html>
