package com.rxlogix

import grails.transaction.Transactional

@Transactional
class UserService {

        void save(params){

                User user = new User()
                params.dob = Date.parse("yyyy-MM-dd", params.dob).clearTime()
                user = new User(params)
                user.save(failOnError: true)
        }

        boolean login(params){
            String name = params.inputUser
            String password = params.inputPassword
            def user = User.findByUserName(name)
            if(user){
                if(user.password==password){
                    return true
                }else {
                    return false
                }
            }else{
                return false
            }
        }

         List<Post> createPost(params, userName){

            Post post = new Post(params)
            post.user = User.findByUserName(userName)
            post.postCreatedOn=new Date()
            post.save(failOnError: true)
            List<Post> posts=Post.findAllByUser(post.user)
             return posts
        }


}
