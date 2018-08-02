package com.rxlogix

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')

class UserController {

    UserService userService
    UserGroupService userGroupService
    static String userName


    def index() {
            render "You now have access to the page...congrats"
    }

    def save(){
        userService.save(params)
        //need to display message that sign up is successful and user should go and login
        redirect(controller: 'user', action: 'login')
    }



    def logout(){
        session.invalidate()
        redirect(controller: 'logout', action: 'index')
    }


    def createPostForGroup(){
        UserGroup userGroup
        String groupName=params.groupName
        if(params.description && ((params.description).length()<=1000) && params.groupName){

            userGroup = UserGroup.findByTitle(groupName)
            userGroupService.createPost(params, session.user, userGroup)
        }
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



}
