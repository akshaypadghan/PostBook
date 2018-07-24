package exercise1_domain

class UserGroup {

    String title
    User admin
    String description
    static hasMany=[m_user: User]
    static belongsTo=User
    static constraints = {
    }

    @Override
    String toString() {
        title+" "+admin+" "+description+"\n"
    }
}
