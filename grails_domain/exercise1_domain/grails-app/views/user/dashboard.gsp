


<!DOCTYPE html>
          <html lang="en" dir="ltr">
            <head>
              <meta charset="utf-8">
              <meta name="viewport" content="width=device-width, initial-scale=1">
              <title>PostBook_v1</title>
              <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
               <link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel = "stylesheet"/>

              <asset:javascript src="postbook.js"/>
              <g:javascript library="jquery"/>
              <style media="screen">
                     .container-fluid{
                                      padding: 0px;
                                      margin: 0px;
                                      background-color: #eff1f4;

                                    }
                                    #footer1{
                                      background-color: brown;
                                      color: white;
                                      height: 90px;
                                    }
                                    .jumbotron{
                                      background-color: #6390f2;
                                      margin: 0px;
                                      padding: 0px;
                                      width: 100%;
                                    }
                                    html, body {
                                      max-width: 100%;
                                      overflow-x: hidden;

                                    }

                                    #posts{
                                        background-color:lightgrey;
                                        height: 330px;
                                        padding: 80px;
                                    }

                                    #heading{
                                      padding-top: 70px;
                                      padding-left: 80px;
                                    }
                                    @media (max-width: 768px) {

                                      img{
                                        padding-right: 20px;
                                        margin-right: 20px;
                                      }
                                    }
                                    @media (max-width: 576px) {
                                        #heading{
                                          margin: 10px;
                                          padding: 10px;
                                          padding-left: 15px;
                                        }

                                    }
                                    strong{
                                      font-size: 70px;
                                    }

                                    img{
                                      padding-top: 20px;
                                    }
                                   #groups{
                                        padding-top:30px;
                                        background-color: grey;
                                        text-align:center;
                                   }
                                   #postArea{
                                       padding-top:30px;
                                       padding-left:60px;
                                       height: 300px;
                                   }
              </style>
            </head>
            <body>
              <div class="container-fluid" >
                    <div class="jumbotron">
                          <div class="row">
                              <div id="heading" class="col-lg-8 col-md-6 col-sm-12 col-xm-12">
                                  <h1><strong>PostBook</strong></h1>
                                  <p>An online portal for sharing pictures and posts</p>
                              </div>
                              <div class="col-lg-4 col-md-6 col-sm-12 col-xm-12 ">
                              <!-- Here lies image logo
                                  <img src="/exercise1_domain/grails-app/assets/images/pb.png" alt="postbook logo">
                                  -->
                                  <g:img dir="images" file="pb.png"/>
                              </div>
                          </div>
                    </div>


                            <div class="row" >
                               <div class="col-lg-3" id="groups">
                                    <ul>

                                            <g:each in="${user_groups}" var="v_groups">
                                            <li>
                                                <a href="groupInfo">
                                                ${v_groups.title}</a>
                                            </li>
                                            </g:each>

                                        </br>
                                        <g:form>
                                            <g:actionSubmit value="Create New Group" action="createGroup"/>
                                        </g:form>
                                    </ul>
                               </div>
                               <div class="col-lg-9" id="postArea">
                                <g:form>
                                    <textarea rows="6" cols="70" id="description" name="description"> </textarea>
                                    <g:actionSubmit value="Post" action="createPost"/>
                                </g:form>
                               </div>
                            </div>
                            <div id="posts">
                                <div class=container">
                                    this area is for posts
                                </div>
                            </div>

                    <div class="container-fluid" id="footer1">
                        <footer class="container text-center">@copyright Site designed and developed by Akshay Padghan</footer>
                    </div>

              </div>
              <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
              <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
              <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
            </body>
          </html>