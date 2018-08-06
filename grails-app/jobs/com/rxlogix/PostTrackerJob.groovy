package com.rxlogix



class PostTrackerJob {

    static triggers = {
        cron name: 'myTrigger', cronExpression : "0 0 0/2 * * ? *"
        //simple repeatInterval: 10000, repeatCount: 10, startDelay:10000
    }

    def execute() {
        // execute job
        Date date = new Date(System.currentTimeMillis() - 3600 * 2000)
        int postCount = Post.countByPostCreatedOnBetween(date, new Date())
        println("Total Posts in last 2 hours are: "+postCount)
    }
}
