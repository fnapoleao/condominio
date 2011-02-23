<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="mensagem" required="true" %>
<%@ attribute name="autorizacaoAntiga" required="true" %>
<%@ attribute name="autorizacaoNova" required="true" %>


<div class="alert confirmation not-for-print sans-small" style="margin-left:0;margin-right:0;">
	${mensagem}
	<br/><br/>
	<span style="font-size: 12px; text-align: left;">
		<strong>AUTORIZA��O DA GUIA FECHADA: ${autorizacaoAntiga}</strong><br/>
		<strong>NOVA AUTORIZA��O PARA INTERNA��O: ${autorizacaoNova}</strong>
	</span>								
</div>						