import exercise1_domain.*
class BootStrap {

    def init = { servletContext ->

        User user0 = new User(name: 'akshay', dob: new Date(98,2,3), userName: 'Something', email:'mail@company.com', password:'secret', gender:'male', address:'destination changed').save(flush: true)
        User user1 = new User(name: 'rahil', dob:new Date(year: 22, month: 11, date: 12), userName: 'user1', email:'mailidhere@company.com', password:'secret', gender:'male', address:'somewhere close').save(flush: true)
        User user2 = new User(name: 'kumar', dob: new Date(58,2,13), userName: 'kumar1', email:'mail@company.com', password:'pwd2', gender:'male', address:'somewhere close to office').save(flush: true)
        User user3 = new User(name: 'Arjun', dob:new Date(year: 32, month: 5, date: 22), userName: 'arjun2', email:'mailrrue@company.com', password:'password1', gender:'male', address:'no need to declare').save(failOnError:true)


    }
    def destroy = {
    }
}
