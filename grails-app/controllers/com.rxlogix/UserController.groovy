package com.rxlogix

import grails.converters.JSON
import grails.plugin.mail.*
import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')

class UserController {

    UserService userService
    static String userName
    MailService mailService
    PostTrackerJob postTrackerJob


    def index() {
            redirect(action: 'dashBoard')
    }

    def save(){
        userService.save(params)
        flash.message = "Please LogIn Now!!!"
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
        Map results =[:]
        if(params.description && (params.description).length()<=1000){
            results = userService.createPost(params, userName)
        }else{
            posts=User.findByUsername(userName)*.posts
        }
        render(view: "dashboard", model:[user_name:params.inputUser, posts:results?results.posts:posts, user_groups:results?results.user_groups:UserGroup.list()])
    }


    def dashBoard(){
        userName = session.user
        Map results = userService.dashBoard(userName)

        render(view: "dashboard", model:[user_name:userName, user_groups:results.user_groups, posts: results.posts])
    }

    def userInfo(){
        Map results = userService.userInfo(params)
        render(view: "userInfo", model:[user_name:session.user, user:results.user, user_groups:results.user_groups, posts: results.posts])
    }

    def resetPassword(){
            render(view: 'sendMail')
    }

    def sendMail(){

        if(userService.temporaryPassword(params)){
            flash.message = "Temporary password is sent on your mail id"
            sendMail {
                to "${params.emailInput}"
                subject "password reset"
                body 'your temporary password is "pwd@123"'
            }
        }else{
            flash.message = "Try again with registered email id...this mail id is not registered with us"
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

    def ajaxShowTable(){
        render userService.showUsers() as JSON
    }

    def userTable(){
        render (view: 'showTable')
    }


}
