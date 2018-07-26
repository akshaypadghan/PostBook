package exercise1_domain

class UserGroupController {
    //static Scaffold=true;
    UserGroupService userGroupService
    def index() {
      render "hello there!"
     }

    def groupInfo(){
        //int group_id=params.id
        def userGroup=UserGroup.findById(params.id)
        render(view:"groupInfo", model:[userGroup:userGroup])
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
