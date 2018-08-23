<html>
    <head>
        <asset:stylesheet src="post.css"/>
    </head>
    <body>
            <div class="card text-center">

                  <div class="card-body">
                        <p class="card-text"><b>${post.getDescription()}</b></p>
                  </div>
                  <div class="card-footer text-muted">

                  <p style="text-align:left; padding-left:20px;">

                  Posted By: ${post.user.name}
                   <g:if test = "${post.userGroup != null}">
                   ||   Posted in: <strong>${post.userGroup.title}</strong>
                   </g:if>
                  <span style="float:right; padding-right:15px;">created on: ${post.getPostCreatedOn()}</span>
                  </p>
                  </div>
            </div>
            </br>
    </body>
<html>