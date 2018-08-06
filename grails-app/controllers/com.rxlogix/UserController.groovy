package com.rxlogix


import grails.plugin.mail.*
import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')

class UserController {

    UserService userService
    static String userName
    MailService mailService


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
        ArrayList<UserGroup> user_groups = new ArrayList<UserGroup>()
        user_groups.addAll(user.groups)
        List<Post> posts=Post.listOrderByPostCreatedOn(max:5, offset:0, order:"desc")

        render(view: "dashboard", model:[user_name:userName, user_groups:user_groups, posts: posts])
    }

    def userInfo(){
        Map results = userService.userInfo(params)
        render(view: "userInfo", model:[user_name:session.user, user:results.user, user_groups:results.user_groups, posts: results.posts])
    }

    def resetPassword(){
            render(view: 'sendMail')
    }

    def sendMail(){

        sendMail {
            to "${params.emailInput}"
            subject "password reset"
            body 'your temporary password is "jsdas3ed3"'
        }
    }

    def editProfile(){
        Map results = userService.editProfile(params, session.user)
        render(view: 'editProfile', model: [user_name: session.user, user: results.user, user_groups: results.user_groups])
    }
    def updateUser(){
        userName = session.user
        userService.updateUser(params, session.user)
        redirect(action: 'dashBoard')
    }


}
