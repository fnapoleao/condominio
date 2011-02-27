<%@ include file="/view/jsp/includes/Imports.jsp" %>

<div id="title">
	<h1 class="not-for-print">
	REPORT_NAME
	</h1>
</div>

<%@ include file="/view/jsp/includes/Messages.jsp" %>
<fmt:setLocale value="pt_BR" scope="request"/>

<div class="panel">

	<div class="form-wrapper not-for-print">
        <html:form action="/JHeatReportAction.do" method="post" ENCTYPE SUBMIT>
		
			<input type="hidden" name="action" id="action" value="process"/>
			<input type="hidden" name="reportName" id="reportName" value="SECTIONAL"/>
			<input type="hidden" name="fieldsError" id="fieldsError" value="${requestScope.fieldsError}"/>			
				
			FORM_SERVICE

            <span>
  		        <jheat:rolePermission sectional="SECTIONAL" roleAction="exec">
                    PERFORM_BUTTON
                </jheat:rolePermission>
            </span>
		</html:form>
	</div>	
	<span class="spacer"></span>
	<div>
	    REPORT_RETURN
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
</div>