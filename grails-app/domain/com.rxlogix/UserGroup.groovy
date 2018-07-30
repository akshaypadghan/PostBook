package com.rxlogix

class UserGroup {

    String title
    String description
    //has many posts
    static hasMany=[users: User]



    static constraints = {

    }


    @Override
    String toString() {
        title+" "+description+"\n"
    }
}
