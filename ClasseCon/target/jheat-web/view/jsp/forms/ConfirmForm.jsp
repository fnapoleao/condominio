<%@ include file="/view/jsp/includes/Imports.jsp" %>

<div id="title">
	<h1><bean:message key="screen.dialog.confirmOperation"/></h1>
</div>

<%@ include file="/view/jsp/includes/Messages.jsp" %>
<fmt:setLocale value="pt_BR" scope="request"/>
<div class="panel">
	<div class="form-wrapper">

		<html:form action="/JHeatMethodAction.do" method="POST" styleClass="formDiv" ENCTYPE SUBMIT>
		
			<input type="hidden" name="action" value="invoke"/>
			<input type="hidden" name="id" value="${JHeatFormBean.map.id}"/>
			<input type="hidden" name="className" value="${JHeatFormBean.map.className}"/>
			<input type="hidden" name="method" value="${JHeatFormBean.map.method}"/>
			<input type="hidden" name="discriminator" value="${JHeatFormBean.map.discriminator}"/>	
			<input type="hidden" name="fieldsError" id="fieldsError" value="${requestScope.fieldsError}"/>
						
			FORM_SERVICE
			
			<span style="margin-top:10px;">
				<button name="submit" type="submit" class="actionButton"><bean:message key="pageOptions.confirmOperation"/></button>&nbsp;
				<button name="cancel" type="button" class="otherButton" onClick="history.go(-1)"><bean:message key="pageOptions.cancelOperation"/></button>
			</span>
			
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
