<%@ page import="exercise1_domain.Posts" %>



<div class="fieldcontain ${hasErrors(bean: postsInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="posts.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${postsInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: postsInstance, field: 'users', 'error')} required">
	<label for="users">
		<g:message code="posts.users.label" default="Users" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="users" name="users.id" from="${exercise1_domain.User.list()}" optionKey="id" required="" value="${postsInstance?.users?.id}" class="many-to-one"/>

</div>

