package exercise1_domain

class PostsController {

    static defaultAction="hello"

    def index() {
      render  "page for posts"
     }

     def hello(){

        render "do nothing"
     }




}
