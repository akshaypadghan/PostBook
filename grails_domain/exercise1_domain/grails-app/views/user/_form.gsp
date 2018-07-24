<%@ page import="exercise1_domain.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'DOB', 'error')} required">
	<label for="DOB">
		<g:message code="user.DOB.label" default="DOB" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="DOB" precision="day"  value="${userInstance?.DOB}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="user.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${userInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'posts', 'error')} ">
	<label for="posts">
		<g:message code="user.posts.label" default="Posts" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${userInstance?.posts?}" var="p">
    <li><g:link controller="posts" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="posts" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'posts.label', default: 'Posts')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'profession', 'error')} required">
	<label for="profession">
		<g:message code="user.profession.label" default="Profession" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="profession" required="" value="${userInstance?.profession}"/>

</div>

