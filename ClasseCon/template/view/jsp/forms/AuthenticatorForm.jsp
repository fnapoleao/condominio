<%@ include file="/view/jsp/includes/TagLibs.jsp" %>
<logic:notPresent scope="session" name="roles">
<div id="title">

	<h1><html:link action="getRoles.do">FORM_AUTHENTICATOR_TITLE</html:link></h1>

</div>

JS_BUILD_URL_BIOMETRY

<%@ include file="/view/jsp/includes/Messages.jsp" %>
<fmt:setLocale value="pt_BR" scope="request"/>
<div class="panel">
	<div class="form-wrapper">

		<html:form action="/JHeatAuthenticatorAction.do" method="post" SUBMIT>
		
			<input type="hidden" name="action" id="action" value="authentic"/>
			<input type="hidden" name="discriminator" id="discriminator" value="${discriminator}"/>
			<input type="hidden" name="triesRtt" id="triesRtt" value="${triesRtt}"/>
			<input type="hidden" name="useRtt" id="useRtt" value="${useRtt}"/>
			
			FORM_AUTHENTICATOR
			
			<span><button name="submit" type="submit" class="actionButton"><bean:message key="pageOptions.confirmOperation"/></button>
			
		</html:form>	

	</div>
</div>

JAVA_SCRIPT
</logic:notPresent>