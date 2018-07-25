package exercise1_domain

import javax.swing.text.View

class UserController {

    def userService
    String userName
    def index() { }

    def save(){
        userService.save(params)
        //need to display message that sign up is successful and user should go and login
        redirect(controller: 'user', action: 'login')
    }

    def dashBoard(){
        def user_groups=UserGroup.list()
        render(view: "dashboard", model:[user_name:params.inputUser, user_groups:user_groups, posts: Post.list()])
    }

    def login(){

        if(userService.login(params)){
            userName=params.inputUser   //need to keep track of active user
            redirect(controller: 'user', action: 'dashBoard')
        }else{
            //need to diplay message that login is failed
           redirect(controller:'user', action:'index')

        }

    }

    def createPost(){

        userService.createPost(params, userName)
        render(view: "dashboard", model:[user_name:params.inputUser, posts:Post.list(), user_groups:UserGroup.list()])
    }

    def createGroup(){

        def userList=User.list()
        render(view:'createGroup', model:[userList:userList])
    }
    def updateGroup(){

        userService.updateGroup(params, userName)
        redirect(controller:'user', action:'dashBoard')
    }

}
