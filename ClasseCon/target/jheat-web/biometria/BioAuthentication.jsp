	<%@ page contentType="text/html;charset=ISO-8859-1"%>
	<%@ include file="/view/jsp/includes/TagLibs.jsp" %>

	<c:if test="${sessionScope.showMessageWarningBio}">
		<div class="alert warning">
		    <span class="sans-small" style="text-align:left;">
			<c:choose>
				<c:when test="${empty sessionScope.messageUserWarningBio}">
			    	<bean:message key="bioAthenticator.unsuccessful.attempt"/>
				</c:when>
				<c:otherwise>
					${sessionScope.messageUserWarningBio}
				</c:otherwise>	
			</c:choose>
			<br/></span>
		</div>
	</c:if>

	<fmt:setLocale value="pt_BR" scope="request"/>
	
	<form name="autentica" method="post" action="JHeatBiometricAction.do" onsubmit="FUNCTION_SCRIPT">
		<input type="hidden" name="action" value="authentic" />
		<input type="hidden" name="sectionName" value="${sectionName}" />
		STEP_ATTRIBUTES
		<br/>
		<center>
			BODY_BIOMETRIC
		</center>
		<br/>
		
		<center>
			OTHERS_BUTTONS
			<button type="submit" name="buttonauthentic" class="actionButton" >Autenticar</button>
		</center>
	</form>
