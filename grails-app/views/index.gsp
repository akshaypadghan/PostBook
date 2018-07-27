
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



                #heading{
                  padding-top: 70px;
                  padding-left: 80px;
                }
                @media (max-width: 768px) {
                  #form1{
                    border-style: outset;
                    border-radius: 5px;
                    border-color: grey;
                    margin-left: 0px;
                    margin-top: 0px;
                    margin-bottom: 0px;
                  }
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
                    #form1{

                      margin-bottom: 0px;
                      margin-top: 0px;
                      border-style: outset;
                      border-radius: 5px;
                      border-color: grey;
                      margin-left: 0px;
                    }
                }
                strong{
                  font-size: 70px;
                }
                #form1{
                  padding: 60px;
                  margin-top: 20px;
                  margin-bottom: 20px;
                  border-style: outset;
                  border-radius: 10px;
                  border-color: grey;
                  margin-left: 5px;

                }
                #signUpForm{
                  border-radius: 12px;
                  margin-top: 20px;
                  padding: 30px;
                  margin-bottom: 20px;
                  margin-right: 10px;
                  border-style: outset;
                  border-color: grey;
                }
                img{
                  padding-top: 20px;
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
                                  <img src="/com.rxlogix/grails-app/assets/images/pb.png" alt="postbook logo">
                                  -->
                                  <g:img dir="images" file="pb.png"/>
                              </div>
                          </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-5 col-md-6 col-sm-12 col-xm-12">
                          <div class="container"  id="form1">
                            <h3>Sign In Here!</h3><br>
                            <g:form >
                                <div class="form-group">
                                    <label for="inputUser">Username</label>
                                    <input type="text" class="form-control" id="inputUser" name="inputUser" placeholder="Username" required>
                                </div>
                                <div class="form-group">
                                    <label for="inputPassword">Password</label>
                                    <input type="password" class="form-control" id="inputPassword" name="inputPassword" placeholder="Password" required>
                                </div>

                                <div class="checkbox">
                                    <label><input type="checkbox"> Remember me</label>
                                </div>
                                <g:actionSubmit value="Sign In" action="login"/>
                            </g:form>
                          </div>
                        </div>
                        <div class="col-lg-7 col-md-6 col-sm-12 col-xm-12">


                            <div class="container" id="signUpForm">
                              <h3>Sign Up Here!</h3><br>
                              <g:form controller="user" data-toggle="validator" >
                                              <div class="form-row">
                                                <div class="form-group col-lg-6">
                                                    <label for="inputName" class="control-label">Name: </label>
                                                    <input type="text" class="form-control" pattern="[A-Za-z ]*"  name="name" id="name" minlength="3" placeholder="Full Name"  required>

                                                </div>

                                                <div class="form-group col-lg-6">
                                                  <label for="UserName" class="control-label"> Username: </label>
                                                  <input class="form-control" name="userName" pattern="[A-Za-z]*([0-9])?*" id="userName" minlength="5" placeholder="User Name" required>
                                                </div>
                                              </div>

                                                <div class="form-row">
                                                  <div class="form-group col-lg-6">
                                                      <label for="userEmail" class="control-label">Email:</label>
                                                      <input type="email" class="form-control" pattern="^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$" data-error="that doesn't seem valid email" name="email" id="email" placeholder="user@example.com" required>
                                                  </div>
                                                  <div class="form-group col-lg-6">
                                                  <label for="inputPassword">Password:</label>
                                                  <input type="password" name="password" id="password" class="form-control" placeholder="******" required>
                                                  </div>
                                                </div>
                                              <div class="form-row">
                                                <div class="form-group col-lg-6">
                                                  <label for="inputGender">Gender:</label>
                                                  <select class="form-control" name="gender" id="gender" required>
                                                    <option value="Male">Male</option>
                                                    <option value="Female">Female</option>
                                                    <option value="Other">Other</option>
                                                  </select>
                                                </div>
                                                <div class="form-group col-lg-6">
                                                    <label for="inputDOB">DOB:</label>
                                                    <input type="date" class="form-control" name="dob" id="dob" required>
                                                </div>
                                              </div>
                                              <div class="form-group">
                                                  <label for="inputAddress">Address:</label>
                                                  <input type="text" class="form-control" name="address" id="address" placeholder="block 4, st. annes" required>
                                              </div>

                                                  <g:actionSubmit value="Sign Up" action="save"/>

                              </g:form>
                            </div>
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