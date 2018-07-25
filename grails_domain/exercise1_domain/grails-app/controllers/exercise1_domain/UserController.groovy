package exercise1_domain

import javax.swing.text.View

class UserController {

    def userService
    User current_user    //trying to send user info to posts table
    //static scaffold = true
    String userName
    def index() { }

    def save(){
        userService.save(params)
        render "successfully updated database "+params.dob
    }

    def dashBoard(){
        def user_groups=UserGroup.list()
        render(view: "dashboard", model:[user_name:params.inputUser, user_groups:user_groups, posts: Posts.list()])
    }

    def login(){

        if(userService.login(params)){
            userName=params.inputUser   //need to keep track of active user
            redirect(controller: 'user', action: 'dashBoard')
        }else{
//            //need to display some message if login failed
//            render (text: """<script type="text/javascript">
//                    alert("Invalid Username or Password");
//                </script>""",
//                    contentType: 'js')
           redirect(controller:'user', action:'index')

        }

    }

    def createPost(){
        println(params)
        userService.createPost(params, userName)
        println("got some success with "+params.description+"  username is ${userName}")
        render(view: "dashboard", model:[user_name:params.inputUser, posts:Posts.list()])
        //redirect(action:"dashBoard")
    }

    def createGroup(){
        //forward action:'createGroup'   //neither is redirect working right now
        //redirect(controller: 'user', action: 'createGroup')
        def userList=User.list()
        render(view:'createGroup', model:[userList:userList])

        //userService.createGroup(params)
    }
    def updateGroup(){

        userService.updateGroup(params, userName)
        redirect(controller:'user', action:'dashBoard')
    }

}
