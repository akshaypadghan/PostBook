<html>
    <head>
    <style>
            #postedBy{

                text-align:left;
            }
            #postedOn{
                text-align:right;
            }
            .card-text{
                padding-top:10px;
                text-align: left;
                padding-left:20px;

            }
        </style>

    </head>
    <body>
            <div class="card text-center">
                  <div class="card-body">
                        <p class="card-text"><b>${post.getDescription()}</b></p>
                  </div>
                  <div class="card-footer text-muted">

                  <p style="text-align:left; padding-left:20px;">
                     Posted By: ${post.user.name}
                  <span style="float:right; padding-right:15px;">created on: ${post.getPostCreatedOn()}</span>
                  </p>
                  </div>
            </div>
            </br>
    </body>
<html>