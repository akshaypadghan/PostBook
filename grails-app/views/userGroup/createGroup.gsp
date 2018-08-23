<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Create Group</title>


    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css"
        rel="stylesheet" type="text/css" />
    <script src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js"
        type="text/javascript"></script>
    <asset:stylesheet src="creategroup.css"/>
    <asset:javascript src="creategroup.js"/>
    </head>
        <body>



            <div>
                    <nav class="navbar navbar-inverse">
                      <div class="container-fluid">
                        <div class="navbar-header">
                          <a class="navbar-brand" href="#"><g:img dir="images" file="pb.png" height="40px" width="60px" background-color="white"/></a>
                        </div>
                        <div class="collapse navbar-collapse" id="myNavbar">
                          <ul class="nav navbar-nav">
                            <li class="active"><g:link controller="user" action="dashBoard">Home</g:link></li>
                            <li class="active"><g:link controller='post' action='showCount'>PostCount</g:link></li>
                          </ul>
                          <ul class="nav navbar-nav navbar-right">
                            <li class="dropdown">
                               <a href="#" data-toggle="dropdown" class="dropdown-toggle glyphicon glyphicon-user"><b class="caret"></b></a>
                               <ul class="dropdown-menu">
                                   <li> &nbsp;&nbsp;&nbsp; Hello, ${session.user}</li>
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
                    <div class="container-fluid text-left">
                      <div class="row content">
                        <div class="col-sm-2 sidenav"  id="groupsList">
                        </div>
                        <div class="col-sm-8 text-left" id="wrapper">
                           <div id="groupForm">
                              <h1> Enter Group Information Here </h1></br>
                              <form class="form-horizontal">
                                 <div class="form-group">
                                    <label for="title">Group Name</label>
                                    <input type="text" class="form-control" id="title" placeholder="Enter Group Name Here.." name="title">
                                 </div>
                                 <div class="form-group">
                                     <label for="description">Group Description</label>
                                     <input type="text" class="form-control" id="description" placeholder="Enter Group Description Here..." name="description">
                                 </div>
                                 <div class="form-group">
                                      <label for="users">Members:</label></br>
                                      <select id="users" name="users" multiple="multiple">
                                         <g:each in="${userList}" var="user">
                                               <g:if test="${ activeUser != user}">
                                                   <option id="${user}">${user.name}</option>
                                               </g:if>
                                         </g:each>
                                      </select>
                                      <g:actionSubmit value="add" controller="userGroup" action="saveGroup" class="btn btn-primary"/>
                                 </div>
                                  </div>
                              </form>
                      </div>
                    </div>
            </div>
        </body>
    </html>
