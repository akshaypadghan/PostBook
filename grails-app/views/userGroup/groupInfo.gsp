<!DOCTYPE html>
<html lang="en">
<head>
    <title>${userGroup.title}</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <asset:stylesheet src="groupInfo.css"/>
</head>

<body>

<div>
    <!---------------------------navigation bar-------------------------->
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#"><g:img dir="images" file="pb.png" height="40px" width="60px"
                                                        background-color="white"/></a>
            </div>

            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav">
                    <li class="active"><g:link controller="user" action="dashBoard">Home</g:link></li>
                    <li class="active"><g:link controller='post' action='showCount'>PostCount</g:link></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" data-toggle="dropdown" class="dropdown-toggle glyphicon glyphicon-user"><b
                                class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><g:link controller="user"
                                        action="editProfile">&nbsp;&nbsp;&nbsp; Hello,  ${session.user}</g:link></li>
                            <li>
                                <form name="logout" method="POST" action="${createLink(controller: 'logout')}">
                                    &nbsp;&nbsp; <input class="btn btn-success" type="submit" value="logout"></form>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!------------------------------------sidenav left----------------------------->
    <div class="container-fluid text-left">
        <div class="row content">
            <div class="col-sm-2 sidenav" id="groupsList">
                <h4>Members</h4>
                <hr>
                <g:each in="${userGroup.users}" var="member">
                    <li>
                        <g:link controller="user" action="userInfo" id="${member.id}">${member.name}</g:link>
                    </li>
                </g:each>
            </div>

            <!-----------------------------Post Area--------------------------------------------->
            <div class="col-sm-8 text-left" id="wrapper">
                <g:form>
                    <h3>Post What's on Your Mind..(max 1000 characters)</h3>
                    <textarea name="description" id="description" minlength="10" maxlength="1000" rows="6"
                              cols="88"></textarea>
                    <g:actionSubmit value="Post" action="createPost" class="btn btn-success"/>
                </g:form>
                <hr>

                <h3>Posts In This Group....</h3>

                <g:each in="${posts}" var="post">
                    <g:render template="post" model="['post': post]"/>
                </g:each>
            </div>

            <!----------------------------sidenav right-------------------------------------------->
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
    <!-------------------------------------footer--------------------------------------------->
    <footer class="container-fluid text-center">
        <p>This site is designed and developed by Akshay Padghan</p>
    </footer>
</div>

</body>
</html>
