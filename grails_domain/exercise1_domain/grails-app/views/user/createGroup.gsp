﻿<!DOCTYPE html>
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
    <script type="text/javascript">
        $(function () {
            $('#listUsers').multiselect({
                includeSelectAllOption: true
            });
        });
    </script>
    </head>
    <body>
            <div class="container">
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
                              <label for="members">Members:</label></br>
                              <select id="listUsers" multiple="multiple" >
                                   <g:each in="${userList}" var="user" status="i">
                                         <option id="$(i+1}">${user.name}</option>
                                   </g:each>
                               </select>
                            <g:actionSubmit value="add" action="updateGroup"/>
                      </div>
                    </div>
                  </form>
            </div>
    </body>
</html>
