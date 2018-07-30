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
        <style>
             #groupForm{
                              border-radius: 12px;
                              margin-top:100px;
                              padding: 50px;
                              border-style: outset;
                              border-color: grey;
                            }


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
      min-height:100vh;
      max-height:300vh;

    }

    #groupsList{
        padding-left:45px;
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
       min-height:100vh;
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

    <script type="text/javascript">
        $(function () {
            $('#users').multiselect({
                includeSelectAllOption: true
            });
        });
    </script>
    </head>
    <body>



            <div>
                <!---------------------------navigation bar-------------------------->
                    <nav class="navbar navbar-inverse">
                      <div class="container-fluid">
                        <div class="navbar-header">
                          <a class="navbar-brand" href="#"><g:img dir="images" file="pb.png" height="40px" width="60px" background-color="white"/></a>
                        </div>
                        <div class="collapse navbar-collapse" id="myNavbar">
                          <ul class="nav navbar-nav">
                            <li class="active"><g:link controller="user" action="dashBoard">Home</g:link></li>

                          </ul>
                          <ul class="nav navbar-nav navbar-right">
                            <li class="dropdown">
                                            <a href="#" data-toggle="dropdown" class="dropdown-toggle glyphicon glyphicon-user"><b class="caret"></b></a>
                                            <ul class="dropdown-menu">
                                                <li> &nbsp;&nbsp;&nbsp; Hello, ${session.user}</li>
                                                <li><g:link controller="user" action="index">Logout</g:link></li>
                                            </ul>
                              </li>
                          </ul>
                        </div>
                      </div>
                    </nav>
                <!------------------------------------sidenav left----------------------------->
                    <div class="container-fluid text-left">
                      <div class="row content">
                        <div class="col-sm-2 sidenav"  id="groupsList">

                        </div>

                <!-----------------------------Post Area--------------------------------------------->
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
                                                                           <option id="${user}">${user.name}</option>
                                                                     </g:each>
                                                                 </select>
                                                              <g:actionSubmit value="add" controller="userGroup" action="saveGroup"/>
                                                        </div>
                                                      </div>
                                                    </form>
                                              </div>
                        </div>

            </div>

    </body>
</html>
