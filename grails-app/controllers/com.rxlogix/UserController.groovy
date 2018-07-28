package com.rxlogix

import javax.swing.text.View

class UserController {

    def userService
    static String userName
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
            session["user"]=userName
            def loggedUser=session["user"]
            redirect(controller: 'user', action: 'dashBoard')
        }else{
            //need to display message that login is failed
           redirect(controller:'user', action:'index')

        }

    }
    def createGroup(){
        render "you are trying to create a group"
    }

    def createPost(){

        if(params.description && (params.description).length()<=1000){
            userService.createPost(params, userName)
        }
        render(view: "dashboard", model:[user_name:params.inputUser, posts:Post.list(), user_groups:UserGroup.list()])
    }





}
