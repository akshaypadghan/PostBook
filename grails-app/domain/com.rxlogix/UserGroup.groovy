package com.rxlogix

class UserGroup {

    String title
    String description
    //has many posts
    static hasMany=[users: User]



    static constraints = {

    }


    static mapping = {
        posts lazy: false
    }
    @Override
    String toString() {
        title+" "+description+"\n"
    }
}
