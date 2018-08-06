package com.rxlogix



class PostTrackerJob {
    static triggers = {
        simple repeatInterval: 10000, repeatCount: 10, startDelay:10000
    }

    def execute() {
        // execute job
        println("in last two hours 'x' number of posts were done")
    }
}
