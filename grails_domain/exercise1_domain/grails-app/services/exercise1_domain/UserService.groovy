package exercise1_domain

import grails.transaction.Transactional

@Transactional
class UserService {

        def save(params){

                User user = new User()
                println(" \n current selected date is: ${params.dob}\n\n")
                params.dob = Date.parse("yyyy-MM-dd", params.dob).clearTime()
                println("\n date is : ${params.dob} \n")
                user = new User(params)
                user.save(failOnError: true)
        }

        def login(params){
            String name=params.inputUser
            String password=params.inputPassword
            def user=User.findByUserName(name)
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
            //String description=params.description
            Posts post=new Posts(params)
            post.users=User.findByUserName(userName)
            //println(" user name for current post is "+post.users)
            post.save()
            //post.description=post.description.reverse()  //just to check dirty checking in hibernet

        }
    def updateGroup(params, userName){


        def userGroup = new UserGroup(params)
        userGroup.admin=User.findByUserName(userName)
        println(params.title+"  "+params.description+"  "+userGroup.admin.name)
        userGroup.save()

    }




}
