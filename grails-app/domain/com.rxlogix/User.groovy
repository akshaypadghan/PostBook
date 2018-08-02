package com.rxlogix

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class User implements Serializable {

	private static final long serialVersionUID = 1

	transient springSecurityService

	String username
	String password
	String name
	String email
	Date dob
	String address
	String gender

	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired


	static hasMany=[groups: UserGroup, posts:Post]
	static belongsTo=UserGroup


	User(String username, String password) {
		this()
		this.username = username
		this.password = password
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this)*.role
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}

	static transients = ['springSecurityService']

	static constraints = {
		username blank: false, unique: true
		password blank: false
		name blank:false
		email blank:false, unique:true
		dob blank:false
		address blank:false
		gender blank:false

	}

	static mapping = {
		password column: '`password`'

	}
}
