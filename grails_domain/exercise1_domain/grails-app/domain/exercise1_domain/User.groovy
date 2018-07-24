package exercise1_domain

class User {
    String name
    String userName
    String email
    Date dob
    String address
    String gender
    String password
    static hasMany=[groups: UserGroup]

    static constraints = {
        userName size: 5..15, blank: false
        name blank:false
        email blank:false
        dob blank:false
        address blank:false
        gender blank:false
        password blank:false

    }
}
