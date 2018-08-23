<!DOCTYPE html>
<html lang="en">
<head>
    <title>Reset Password</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css"
          rel="stylesheet" type="text/css"/>
    <script src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js"
            type="text/javascript"></script>
</head>

<body>
<hr>

<div class="container">
    <g:if test='${flash.message}'>
        <div class='alert alert-success'>${flash.message}</div>
    </g:if>
    <div class="row">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="text-center">
                            <h3><i class="fa fa-lock fa-4x"></i></h3>

                            <h2 class="text-center">Forgot Password?</h2>

                            <p>You can reset your password here.</p>

                            <div class="panel-body">

                                <form class="form" controller="user">
                                    <fieldset>
                                        <div class="form-group">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i
                                                        class="glyphicon glyphicon-envelope color-blue"></i></span>

                                                <input id="emailInput" name="emailInput" placeholder="email address"
                                                       class="form-control"
                                                       oninvalid="setCustomValidity('Please enter a valid email address!')"
                                                       onchange="try {
                                                           setCustomValidity('')
                                                       } catch (e) {
                                                       }" required="" type="email">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <g:actionSubmit class="btn btn-lg btn-primary btn-block" action="sendMail"
                                                            value="Reset Password"/>
                                        </div>
                                    </fieldset>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>