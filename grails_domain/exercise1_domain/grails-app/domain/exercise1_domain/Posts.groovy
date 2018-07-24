package exercise1_domain

class Posts {
    String description
    static belongsTo=[users: User]

    static constraints = {
    }

    @Override
    String toString() {
        description+" "+users+"\n"
    }
}
