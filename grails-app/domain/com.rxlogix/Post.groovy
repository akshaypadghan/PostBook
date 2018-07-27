package com.rxlogix

class Post {
    String description
    Date postCreatedOn
    static belongsTo=[users: User]

    static constraints = {
        description size:10..1000
    }

    @Override
    String toString() {
        description+" "+users+"\n"
    }
}
