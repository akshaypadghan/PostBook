<!DOCTYPE html>
<html lang="en">
<head>
  <title>DashBoard</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css"
          rel="stylesheet" type="text/css" />
      <script src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js"
          type="text/javascript"></script>
  <style>
            /* Remove the navbar's default margin-bottom and rounded borders */
            .navbar {
              margin-bottom: 0;
              border-radius: 0;
            }

            /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
            .row.content {height: 450px}

            /* Set gray background color and 100% height */
            .sidenav {
              padding-top: 20px;
              background-color: #d4d6d8;
              height:100vh;

            }

                #wrapper{
                overflow-y:scroll;
                height:100vh;

                }

            .card{
              background-color: #e6ecf7;
            }
            /* Set black background color, white text and some padding */
            footer {
              background-color: #555;
              color: white;
              padding: 15px;
            }
            .glyphicon-user{
              font-size: 175%;
              color: white;
            }
            .card-header{
              padding-top: 5px;
              padding-bottom: 5px;
            }



            html, body{
               height:100vh;
               //height:100vh;
            }



            /* On small screens, set height to 'auto' for sidenav and grid */
            @media screen and (max-width: 767px) {
              .sidenav {
                height: 100vh;
                padding: 15px;
              }
              .row.content {height:auto;}
            }
  </style>
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
                      <a class="navbar-brand" href="#"><g:img dir="images" file="pb.png" height="40px" width="60px" background-color="white"/></a>
                    </div>
                    <div class="collapse navbar-collapse" id="myNavbar">
                      <ul class="nav navbar-nav">
                        <li class="active"><g:link controller='user' action='dashBoard'>Home</g:link></li>
                        <li>About</li>
                      </ul>
                      <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                              <a href="#" data-toggle="dropdown" class="dropdown-toggle glyphicon glyphicon-user"><b class="caret"></b></a>
                              <ul class="dropdown-menu">
                                    <li>  &nbsp;&nbsp;&nbsp; Hello,  ${session.user}</li>
                                    <li>
                                        <form name="logout" method="POST" action="${createLink(controller:'logout') }">
                                        <input type="submit" value="logout"></form>
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
                                       <g:actionSubmit value="Create New Group" action="createGroup"/>
                                   </g:form>

                    </div>
                    <div class="col-sm-8 text-left" id="wrapper">

                        <g:form>
                          <h3>Post What's on Your Mind...(max 1000 characters)</h3>
                            <textarea name="description" id="description" minlength="10" maxlength="1000" rows="6" cols="88"></textarea>
                           <g:actionSubmit value="Post" action="createPost"/>
                           <div class="form-group">
                               <label for="groupList">Groups:</label></br>
                               <select id="groupList" name="groupList" multiple="multiple">
                                 <g:each in="${user_groups}" var="user_group">
                                    <option id="${user_group}">${user_group.title}</option>
                                 </g:each>
                               </select>
                               <g:actionSubmit value="Post to Group" controller="user" action="createPostForGroup"/>
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

         <script type="text/javascript">
                $(function () {
                    $('#groupList').multiselect({
                        includeSelectAllOption: true
                    });
                });
            </script>


</body>
</html>
