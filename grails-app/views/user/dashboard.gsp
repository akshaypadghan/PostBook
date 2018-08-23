<!DOCTYPE html>
<html lang="en">
<head>
  <title>DashBoard</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css" rel="stylesheet" type="text/css" />
  <script src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js"  type="text/javascript"></script>
  <asset:stylesheet src="dashboard.css"/>
  <asset:javascript src="dashboard.js"/>
</head>
<body>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><g:img dir="images" file="pb.png" height="60px" width="60px" padding="0px" groubackground-color="white"/></a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li class="active"><g:link controller='user' action='dashBoard'>Home</g:link></li>
                <li class="active"><g:link controller='post' action='showCount'>PostCount</g:link></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" data-toggle="dropdown" class="dropdown-toggle glyphicon glyphicon-user"><b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><g:link controller="user" action="editProfile" >  &nbsp;&nbsp;&nbsp; Hello,  ${session.user}</g:link></li>
                        <li>
                            <form name="logout" method="POST" action="${createLink(controller:'logout') }">
                                &nbsp;&nbsp;<input class="btn btn-success" type="submit" value="logout"></form>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container-fluid text-center" >
    <div class="row content">
        <div class="col-sm-2 sidenav"  id="groupsList" >
            <h4>Your Groups</h4>
            <hr>
            <g:each in="${user_groups}" var="v_groups">
                <li id="${v_groups.id}">
                    <g:link controller="userGroup" action="groupInfo" id="${v_groups.id}">${v_groups.title}</g:link>
                </li>
            </g:each>
        </br>
            <g:form controller="userGroup">
                <g:actionSubmit value="Create New Group" action="createGroup" class="btn btn-warning"/>
            </g:form>

        </div>
        <div class="col-sm-8 text-left" id="wrapper">

            <g:form>
                <h3>Post What's on Your Mind...(max 1000 characters)</h3>
                <textarea name="description" id="description" minlength="10" maxlength="1000" rows="6" cols="88"></textarea>
                <g:actionSubmit value="Post" action="createPost" class="btn btn-primary"/>
                <div class="form-group">
                    <label for="groupList">Groups:</label></br>
                    <select id="groupList" name="groupList" multiple="multiple">
                <g:each in="${user_groups}" var="user_group">
                    <option id="${user_group}">${user_group.title}</option>
                </g:each>
                </select>
                <g:actionSubmit value="Post to Group" controller="user" action="createPostForGroup" class="btn btn-success"/>
                </div>

            </g:form>
            <hr>
            <h3>Post Related to You....</h3>

            <g:each in="${posts}" var="post">
                <g:render template="post" model="['post':post]"/>
            </g:each>

        </div>

        <div class="col-sm-2 sidenav">
            <div class="well">
                <p>ADS</p>
            </div>
            <div class="well">
                <p>ADS</p>
            </div>
        </div>
    </div>
</div>
<footer class="container-fluid text-center">
    <p>This site is designed and developed by Akshay Padghan</p>
</footer>

</body>
</html>
