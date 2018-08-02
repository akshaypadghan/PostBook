import com.rxlogix.*
class BootStrap {

    def init = { servletContext ->


        Role roleAdmin=new Role('ROLE_ADMIN').save(flush: true)
        Role roleUser=new Role('ROLE_USER').save(flush: true)

        User user0 = new User(name: 'akshay', dob: new Date(98,2,3), username: 'Something', email:'mail@company.com', password:'secret', gender:'male', address:'destination changed').save(flush:true)
        User user1 = new User(name: 'rahil', dob:new Date(year: 22, month: 11, date: 12), username: 'user1', email:'mailidhere@company.com', password:'secret', gender:'male', address:'somewhere close').save(flush: true)
        User user2 = new User(name: 'kumar', dob: new Date(58,2,13), username: 'kumar1', email:'maile@company.com', password:'pwd2', gender:'male', address:'somewhere close to office').save(flush: true)
        User user3 = new User(name: 'Arjun', dob:new Date(year: 32, month: 5, date: 22), username: 'arjun2', email:'mailrrue@company.com', password:'password1', gender:'male', address:'no need to declare').save(flush: true)

        UserRole.create(user3, roleAdmin, true)

    }
    def destroy = {
    }
}
