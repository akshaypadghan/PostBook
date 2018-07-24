<%@ page import="exercise1_domain.UserGroup" %>



<div class="fieldcontain ${hasErrors(bean: userGroupInstance, field: 'admin', 'error')} required">
	<label for="admin">
		<g:message code="userGroup.admin.label" default="Admin" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="admin" name="admin.id" from="${exercise1_domain.User.list()}" optionKey="id" required="" value="${userGroupInstance?.admin?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userGroupInstance, field: 'numOfUsers', 'error')} required">
	<label for="numOfUsers">
		<g:message code="userGroup.numOfUsers.label" default="Num Of Users" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="numOfUsers" type="number" value="${userGroupInstance.numOfUsers}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: userGroupInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="userGroup.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${userGroupInstance?.title}"/>

</div>

