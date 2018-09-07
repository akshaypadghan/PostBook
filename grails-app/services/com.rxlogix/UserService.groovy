package com.rxlogix

import grails.transaction.Transactional

@Transactional
class UserService {
    UserGroupService userGroupService

        void save(params){
                User user = new User()
                params.dob = Date.parse("yyyy-MM-dd", params.dob).clearTime()
                user = new User(params)
                user.save(failOnError: true)
        }


         Map createPost(params, String userName){
            Map results =[:]
            Post post = new Post(params)
            post.user = User.findByUsername(userName)
            post.postCreatedOn=new Date()
            post.save(failOnError: true)
            List<Post> posts=Post.findAllByUser(post.user, [sort:'postCreatedOn', order:'desc', max:5])
            results.put("posts", posts)
            results.put("user_groups", post.user.groups)
            return results
        }

        Map editProfile(params, String userName) {

            User user = User.findByUsername(userName)
            ArrayList<UserGroup> user_groups = new ArrayList<UserGroup>()
            user_groups.addAll(user.groups)
            Map results = [:]
            results.put("user", user)
            results.put("user_groups", user_groups)
            return results
        }


        Map userInfo(params){
            Map results = [:]
            User user=User.findById(params.id)
            results.put("user", user)
            ArrayList<UserGroup> user_groups = new ArrayList<UserGroup>()
            user_groups.addAll(user.groups)
            results.put("user_groups", user_groups)
            List<Post> posts=Post.findAllByUser(user)
            results.put("posts", posts)
            return results
        }

        void createPostForGroup(params, String userName){
            UserGroup userGroup
            ArrayList<String> userGroups = new ArrayList<String>()
            userGroups.addAll(params.groupList)

            if(params.description && ((params.description).length()<=1000)){

                userGroups.each { groupName ->
                    userGroup = UserGroup.findByTitle(groupName)
                    userGroupService.createPost(params, userName, userGroup)
                }
            }
        }

        Map dashBoard(String userName){
            Map results = [:]
            User user=User.findByUsername(userName)
            ArrayList<UserGroup> user_groups = new ArrayList<UserGroup>()
            user_groups.addAll(user.groups)
            results.put('user_groups', user_groups)
            List<Post> posts=Post.listOrderByPostCreatedOn(max:5, offset:0, order:"desc")
            results.put('posts', posts)
            return results
        }

        void updateUser(params, String userName){
            User user = User.findByUsername(userName)
            user.password = params.password
            user.email = params.email
            user.address = params.address
            user.name = params.name
            params.dob = Date.parse("yyyy-MM-dd", params.dob).clearTime()
            user.dob = params.dob
            user.save()
        }

        boolean temporaryPassword(params){
            User user = User.findByEmail(params.emailInput)
            if(user){
                user.password = "pwd@123"
                return true
            }else{
                return false
            }

        }
        List<User> showUsers(){
            List<User> users = User.list()
            return users
        }
}
