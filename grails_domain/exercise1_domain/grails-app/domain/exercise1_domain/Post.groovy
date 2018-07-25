package exercise1_domain

class Post {
    String description
    Date postCreatedOn
    static belongsTo=[users: User]

    static constraints = {
    }

    @Override
    String toString() {
        description+" "+users+"\n"
    }
}
