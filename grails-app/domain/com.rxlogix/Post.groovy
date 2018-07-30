package com.rxlogix

class Post {
    String description
    Date postCreatedOn
    //later write belongs to relation with groups
    static belongsTo=[user: User]
    UserGroup userGroup



    static constraints = {
        description size:10..1000
        userGroup nullable : true
    }

    @Override
    String toString() {
        description+" "+postCreatedOn+"  "+user+" "
    }
}
