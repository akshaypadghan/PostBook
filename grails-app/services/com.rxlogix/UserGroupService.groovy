package com.rxlogix

import grails.transaction.Transactional

@Transactional
class UserGroupService {



    void createPost(params, String userName, UserGroup userGroup){

        Post post = new Post(params)
        post.userGroup=userGroup
        post.user = User.findByUsername(userName)
        post.postCreatedOn=new Date()
        post.save(flush: true)

    }

    void saveGroup(params){
        UserGroup userGroup = new UserGroup()
        userGroup.title=params.title
        userGroup.description=params.description
        ArrayList<String> list = new ArrayList<String>()
        list.addAll(params.users)
        list.each{
            User user = User.findByName(it)
            userGroup.addToUsers(user)
        }

        userGroup.save(failOnError: true)
    }
}
