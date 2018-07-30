package com.rxlogix

import javax.swing.text.View

class UserController {

    UserService userService
    UserGroupService userGroupService
    static String userName
    def index() {

    }

    def save(){
        userService.save(params)
        //need to display message that sign up is successful and user should go and login
        redirect(controller: 'user', action: 'login')
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
        redirect(action: 'login')
    }

    def createPostForGroup(){

        UserGroup userGroup
        String groupName=params.groupName
        if(params.description && ((params.description).length()<=1000) && params.groupName){

            userGroup = UserGroup.findByTitle(groupName)
            userGroupService.createPost(params, session.user, userGroup)
        }
       // List<Post> posts=Post.findAllByUserGroup(userGroup)
        //render(view: "dashBoard", model:[user_name:params.inputUser, posts:posts, userGroup:userGroup])
        redirect(action: 'dashBoard')

    }



    def createPost(){
        List<Post> posts
        if(params.description && (params.description).length()<=1000){

            posts=userService.createPost(params, userName)
        }else{

            posts=User.findByUserName(userName)*.posts
        }
            //posts=posts.OrderByDateUpdated(max:10, offset: 0, order: 'desc')
            //posts=posts.sort{it.postCreatedOn}

        render(view: "dashboard", model:[user_name:params.inputUser, posts:posts, user_groups:UserGroup.list()])
    }

    def dashBoard(){

        User user=User.findByUserName(userName)
        //List<Post> posts=Post.findAllByUser(user)
        List<Post> posts=Post.listOrderByPostCreatedOn(max:5, offset:0, order:"desc")
        render(view: "dashboard", model:[user_name:params.inputUser, user_groups:UserGroup.list(), posts: posts])
    }



}
