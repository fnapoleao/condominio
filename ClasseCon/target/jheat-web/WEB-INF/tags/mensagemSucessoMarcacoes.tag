<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="mensagem" required="true" %>
<%@ attribute name="autorizacao" required="true" %>

<div class="alert confirmation not-for-print sans-small" style="margin-left:0;margin-right:0;">
	${mensagem}
	<br/><br/>
	<span style="font-size: 16px; text-align: left;">
		<strong>AUTORIZA&Ccedil;&Atilde;O: ${autorizacao}</strong>
	</span>								
</div>						