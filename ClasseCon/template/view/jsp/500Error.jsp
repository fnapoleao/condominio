<%@ include file="/view/jsp/includes/TagLibs.jsp" %>

<div id="title">
	<h1><bean:message key="errors.500.title"/></h1>
</div>

<div class="panel">

<logic:messagesPresent>
	<html:messages id="error">
		<bean:write name="error"/>.
	</html:messages>
</logic:messagesPresent>

<logic:messagesNotPresent>
	<h3><bean:message key="errors.500.description"/></h3>
</logic:messagesNotPresent>

</div>