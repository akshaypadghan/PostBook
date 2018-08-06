package com.rxlogix

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')

class UserGroupController {
    //static Scaffold=true;
    UserGroupService userGroupService
    UserGroup userGroup
    def index() {
      //int id=userGroup.id
      redirect(uri:"/userInfo/${userGroup.id}")
     }


    def groupInfo(){
        userGroup = UserGroup.findById(params.id)
        List<Post> posts=Post.findAllByUserGroup(userGroup, [sort:'postCreatedOn', order:'desc', max:5])
        render(view:"groupInfo", model:[userGroup:userGroup, posts: posts])
    }


    def createPost(){
        if(params.description && ((params.description).length()<=1000)){
            userGroupService.createPost(params, session.user, userGroup)
        }
       List<Post> posts=Post.findAllByUserGroup(userGroup)
       render(view: "groupInfo", model:[user_name:params.inputUser, posts:posts, userGroup:userGroup])
    }


    def createGroup(){
     def userList = User.list()
     String userName = session.user
     User user = User.findByUsername(userName)
     render(view:'createGroup', model:[userList:userList, activeUser: user])

    }

    def saveGroup(){
        String userName = session.user
        userGroupService.saveGroup(params, userName)
        redirect(controller:'user', action:'dashBoard')
    }
}
