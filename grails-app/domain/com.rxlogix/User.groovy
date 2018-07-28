package com.rxlogix

class User {
    String name
    String userName
    String email
    Date dob
    String address
    String gender
    String password
    static hasMany=[groups: UserGroup, posts:Post]
    static belongsTo=UserGroup

    static constraints = {
        userName size: 5..15, blank: false, unique: true
        name blank:false
        email blank:false, unique:true
        dob blank:false
        address blank:false
        gender blank:false
        password blank:false

    }

}
