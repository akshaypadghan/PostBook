package com.rxlogix

import grails.transaction.Transactional

@Transactional
class UserGroupService {

    def serviceMethod() {

    }

    def groupInfo(params){
        //def userGroup=UserGroup.findByid(params.id)
    }

    def createPost(params){
        Post post=new Post(params)
        post.save(failOnError: true)
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
