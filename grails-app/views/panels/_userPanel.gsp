<div class="panel panel-default">
    <div class="panel-heading">
        <h4 class="panel-title">
            <sec:ifLoggedIn>
                <sec:username/>
            </sec:ifLoggedIn>
            <sec:ifNotLoggedIn>
                Login
            </sec:ifNotLoggedIn>
        </h4>
    </div>

    <div class="panel-body">
        <sec:ifLoggedIn>
            <g:link controller="logout">Logout</g:link>
        </sec:ifLoggedIn>
        <sec:ifNotLoggedIn>
            <g:link controller="login" action="auth">Login</g:link> | Register
        </sec:ifNotLoggedIn>
    </div>
</div>
