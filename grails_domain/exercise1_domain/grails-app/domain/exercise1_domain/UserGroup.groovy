package exercise1_domain

class UserGroup {

    String title
    String description
    static hasMany=[users: User]
   // static hasMany=[posts:Post]
    static belongsTo=User
    static constraints = {
    }

    @Override
    String toString() {
        title+" "+description+"\n"
    }
}
