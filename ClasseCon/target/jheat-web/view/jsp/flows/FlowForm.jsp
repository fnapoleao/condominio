<%@ include file="/view/jsp/includes/Imports.jsp" %>

JS_BUILD_URL_BIOMETRY

<div id="title">
	<h1 class="not-for-print"><html:link action="JHeatFlowAction.do?action=start&flowName=${flowName}">${flowDisplayName}</html:link>
	/ ${stepDisplayName}
	</h1>
</div>

<%@ include file="/view/jsp/includes/Messages.jsp" %>
<fmt:setLocale value="pt_BR" scope="request"/>

<div class="panel">

     <jheat:stepNavigation flowName="${flowName}" stepName="${step}"/>

	<div class="form-wrapper">
        <html:form action="/JHeatFlowAction.do" method="post" ENCTYPE SUBMIT>
		
			<input type="hidden" name="action" value="process"/>
			<input type="hidden" name="flowName" id="flowName" value="${flowName}"/>
			<input type="hidden" name="step" id="step" value="${step}"/>
			<input type="hidden" name="sectionName" id="sectionName" value="${sectionName}"/>
			<input type="hidden" name="fieldsError" id="fieldsError" value="${requestScope.fieldsError}"/>

			FORM_SERVICE

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