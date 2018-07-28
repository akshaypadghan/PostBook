package com.rxlogix

class UserGroupController {
    //static Scaffold=true;
    UserGroupService userGroupService
    UserGroup userGroup
    def index() {
      render "hello there!"
     }

    def groupInfo(){

        userGroup=UserGroup.findById(params.id)
        render(view:"groupInfo", model:[userGroup:userGroup])
    }

    def createPost(){
        if(params.description && (params.description).length()<=1000){
            //println("============================= userGroup is: "+userGroup+" "+userGroup.users)
            userGroupService.createPost(params, session.user, userGroup)
        }
        render(view: "groupInfo", model:[user_name:params.inputUser, posts:Post.list(), userGroup: userGroup])

    }

    def createGroup(){
     def userList=User.list()
     render(view:'createGroup', model:[userList:userList])

    }

    def saveGroup(){
        userGroupService.saveGroup(params)
        redirect(controller:'user', action:'dashBoard')
    }
}
