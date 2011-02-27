<%@ include file="/view/jsp/includes/TagLibs.jsp" %>

<div id="sidebar">	
	<ul>	
		MENU_ITEMS
		
		<c:if test="${sectionName eq 'meuCadastro'}">
			<jheat:rolePermission roleAction="exec" sectional="alterarDados" roles="coordenador,analista,desenvolvedor," >
				<li><html:link module="" action="/JHeatFlowAction.do?action=process&flowName=alterarDados&step=selecionarColaborador&colaboradores=${sessionScope.colaborador.idColaborador}">Alterar Dados Cadastrais</html:link></li>
			</jheat:rolePermission>
		</c:if>
		
	</ul>
</div>