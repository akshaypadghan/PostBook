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
        List<UserGroup> user_groups=UserGroup.list()
        User user=User.findByUserName(userName)
        List<Post> posts=Post.findAllByUser(user)
        render(view: "dashboard", model:[user_name:params.inputUser, user_groups:user_groups, posts: posts])
    }

    def login(){

        if(userService.login(params)){
            userName=params.inputUser   //need to keep track of active user
            session["user"]=userName
            def loggedUser=session["user"]
            redirect(controller: 'user', action: 'dashBoard')
        }else{
            //need to display message that login is failed

           redirect(controller:'user', action:'index', params:false)
        }
    }

    def logout(){
        session.invalidate()
        redirect(controller:'user', action: 'index')
    }
    def createGroup(){
        render "you are trying to create a group"
    }

    def createPost(){
        List<Post> posts
        if(params.description && (params.description).length()<=1000){
            posts=userService.createPost(params, userName)
        }


        render(view: "dashboard", model:[user_name:params.inputUser, posts:posts, user_groups:UserGroup.list()])
    }





}
