<%@ include file="/view/jsp/includes/Imports.jsp" %>

<div id="title">

	HEADER_LINKS

</div>
<%@ include file="/view/jsp/includes/Messages.jsp" %>
<fmt:setLocale value="pt_BR" scope="request"/>
<div class="panel">
	<div class="form-wrapper">
	
		<html:form action="/ACTION_MAPPING.do" method="post" ENCTYPE SUBMIT>
		
			<input type="hidden" name="action" value="save"/>
			<input type="hidden" name="className" id="className" value="${JHeatFormBean.map.className}"/>
			<input type="hidden" name="id" value="${object ne null ? object.CLASS_ID : JHeatFormBean.map.id}"/>
			<input type="hidden" name="fieldsError" id="fieldsError" value="${requestScope.fieldsError}"/>			
		
			OWNER_INFORMATION
				
			FORM_FIELDS
				
			FORM_SIMPLE_MASTER_DETAIL
						
			<span>
               <jheat:rolePermission roleAction="write">
	  		       <button name="submit" type="submit" class="actionButton"><bean:message key="pageOptions.confirmOperation"/></button>&nbsp;
               </jheat:rolePermission>
  			   <button name="cancel" type="button" class="otherButton" CANCEL_CLICK><bean:message key="pageOptions.cancelOperation"/></button>
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
