package com.rxlogix

import grails.transaction.Transactional

@Transactional
class UserGroupService {



    def createPost(params, String userName, UserGroup userGroup){

        Post post = new Post(params)
        post.userGroup=userGroup
        post.user = User.findByUserName(userName)
        post.postCreatedOn=new Date()
        post.save(failOnError: true, flush: true)
/// Post.findAllByUserGroup(userGroup)


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
