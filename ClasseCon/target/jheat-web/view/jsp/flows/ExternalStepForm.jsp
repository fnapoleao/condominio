<%@ include file="/view/jsp/includes/Imports.jsp" %>
JS_BUILD_URL_BIOMETRY

<%@ include file="/view/jsp/includes/Messages.jsp" %>
<fmt:setLocale value="pt_BR" scope="request"/>

<div class="panel">

	<div class="form-wrapper">
        <html:form action="/JHeatFlowAction.do" method="post" ENCTYPE SUBMIT>
		
			<input type="hidden" name="flowName" id="flowName" value="${flowName}"/>
			<input type="hidden" name="action" value="executeExternalStep"/>
			<input type="hidden" name="fieldsError" id="fieldsError" value="${requestScope.fieldsError}"/>

			STEP_ATTRIBUTES

			FORM_SERVICE
			
			<br/><br/>
			<span style="text-align:center"><button name="submit" type="submit" class="actionButton"><bean:message key="pageOptions.confirmOperation"/></button></span>
		</html:form>
	</div>
</div>

<script type="text/javascript">
	if(document.getElementById('fieldsError').value.replace('[','').replace(']','').replace(' ','').length > 0){
		var fields = document.getElementById('fieldsError').value.replace('[','').replace(']','');
		while(fields.indexOf(' ') > -1)
			fields = fields.replace(' ','');
		var camposInvalidos = fields.split(',');
		setInvalidFields(camposInvalidos);
	}
</script>

JAVA_SCRIPT