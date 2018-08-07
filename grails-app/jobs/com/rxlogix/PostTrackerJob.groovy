package com.rxlogix



class PostTrackerJob {


    static triggers = {
        cron name: 'myTrigger', startDelay:1000, cronExpression : "* * 0/2 * * ? *"
    }

    def execute() {
        // execute job

        Date date = new Date(System.currentTimeMillis() - 3600 * 2000)
        int postCount = Post.countByPostCreatedOnBetween(date, new Date())
        PostService.postCount = postCount

    }
}
