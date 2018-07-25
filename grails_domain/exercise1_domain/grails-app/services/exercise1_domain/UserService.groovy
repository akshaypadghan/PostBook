package exercise1_domain

import grails.transaction.Transactional

@Transactional
class UserService {

        def save(params){

                User user = new User()
                params.dob = Date.parse("yyyy-MM-dd", params.dob).clearTime()
                user = new User(params)
                user.save(failOnError: true)
        }

        def login(params){
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

        def createPost(params, userName){

            Post post = new Post(params)
            post.users = User.findByUserName(userName)
            post.save(failOnError: true)


        }
       def updateGroup(params, userName){

        def userGroup = new UserGroup(params)
        userGroup.admin=User.findByUserName(userName)
        userGroup.save()

    }




}
