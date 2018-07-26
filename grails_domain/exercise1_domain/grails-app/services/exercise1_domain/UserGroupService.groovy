package exercise1_domain

import grails.transaction.Transactional

@Transactional
class UserGroupService {

    def serviceMethod() {

    }

    def groupInfo(params){
        //def userGroup=UserGroup.findByid(params.id)
    }


    def saveGroup(params){
        UserGroup userGroup = new UserGroup()
        userGroup.title=params.title
        userGroup.description=params.description
        (params.users).each{
            User user = User.findByName(it)
            userGroup.addToUsers(user)
        }
        userGroup.save(failOnError: true)
    }
}
