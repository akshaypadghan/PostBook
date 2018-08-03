package com.rxlogix

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')

class UserController {

    UserService userService
    static String userName


    def index() {
            render "You now have access to the page...congrats"
    }

    def save(){
        userService.save(params)
        flash.message = "Please LogIn Now!!!"
        //need to display message that sign up is successful and user should go and login
        redirect(controller: 'login', action: 'auth')
    }

    def createPostForGroup(){
        String userName = session.user
        userService.createPostForGroup(params, userName)
        redirect(action: 'dashBoard')
    }

    def createPost(){
        List<Post> posts
        userName = session.user
        if(params.description && (params.description).length()<=1000){
            posts=userService.createPost(params, userName)
        }else{
            posts=User.findByUsername(userName)*.posts
        }
        render(view: "dashboard", model:[user_name:params.inputUser, posts:posts, user_groups:UserGroup.list()])
    }


    def dashBoard(){
        userName = session.user
        User user=User.findByUsername(userName)
        List<Post> posts=Post.listOrderByPostCreatedOn(max:5, offset:0, order:"desc")

        render(view: "dashboard", model:[user_name:userName, user_groups:UserGroup.list(), posts: posts])
    }

    def userInfo(){
            render "lets see some information about this user"
    }

    def deleteUser(){

    }

    def editUser(){

    }


}
