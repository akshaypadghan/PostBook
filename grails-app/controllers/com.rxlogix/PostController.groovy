package com.rxlogix

class PostController {

    static defaultAction="hello"

    def index() {
      render  "page for posts"
     }

     def hello(){

        render "do nothing"
     }




}
