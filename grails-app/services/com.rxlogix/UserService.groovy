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
            String name = params.username
            String password = params.password
            def user = User.findByUsername(name)
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


         List<Post> createPost(params, String userName){
            Post post = new Post(params)
            post.user = User.findByUsername(userName)
            post.postCreatedOn=new Date()
            post.save(failOnError: true)
            List<Post> posts=Post.findAllByUser(post.user, [sort:'postCreatedOn', order:'desc', max:5])
            return posts
        }


}
