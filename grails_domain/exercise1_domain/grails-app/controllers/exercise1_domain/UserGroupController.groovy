package exercise1_domain

class UserGroupController {
    //static Scaffold=true;
    def index() {
      render "hello there!"
     }
    def groupInfo(){
        render(view:"groupInfo")
    }
}
