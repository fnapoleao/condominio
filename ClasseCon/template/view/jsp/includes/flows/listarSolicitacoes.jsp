<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/tags/displayTags" prefix="display" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<infoway:tableSeparator titulo="Informações gerais" colspan="2" />
<tr>
	<td colspan="2">
	
		<span style="background: #ccffcc; color: #000000;">&nbsp;Verde&nbsp;</span> Prioridade Baixa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<span style="background: #ffe373; color: #000000;">&nbsp;Amarelo&nbsp;</span> Prioridade Normal&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<span style="background: #FFAAAA; color: #000000;">&nbsp;Vermelho&nbsp;</span> Prioridade Crítica&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

		<display:table id="item" name="${requestScope.resumoSolicitacao.colecao}" requestURI="/JHeatReportAction.do" defaultsort="0"
			defaultorder="ascending" export="false" class="yellowTable" decorator="br.com.infowaypi.jheat.webcontent.utils.AjaxBasicWrapper">
			
			<c:if test="${item.prioridade eq 0}">
				<c:set var="style" value="background: #ccffcc; color: #000000;text-align:center;"/>
			</c:if>
			
			<c:if test="${item.prioridade eq 1}">
				<c:set var="style" value="background: #ffe373; color: #000000;text-align:center;"/>
			</c:if>
			
			<c:if test="${item.prioridade eq 2}">
				<c:set var="style" value="background: #FFAAAA; color: #000000;text-align:center;"/>
			</c:if>
			
			<display:column title="Nome" headerClass="sortable" sortable="false" style = "${style}">
				<a href="javascript:JHeat.ajaxReadDetails('${item.class.simpleName}',${item.idSolicitacao},'/JHeatAction.do?action=ajaxDetails&className=br.com.infowaypi.control.entidades.jpede.Solicitacao&id=${item.idSolicitacao}');">${item.nome}</a>
			</display:column>
			<display:column property="projeto.nome"
				style="${style}" decorator="" title="Projeto"
				sortable="false" />
			<display:column property="dataCadastro"
				style="${style}" decorator="br.com.infowaypi.jheat.webcontent.utils.ShortDateWrapper" title="Data de cadastro"
				sortable="false" />
			<display:column property="situacaoFormatada"
				style="${style}" decorator="" title="Situação"
				sortable="false" />
			<display:column property="tipoFormatado"
				style="${style}" decorator="" title="Tipo"
				sortable="false" />
			<display:column property="ordem"
				style="${style}" decorator="" title="Ordem"
				sortable="false" />
			<display:column property="projeto.sprintAtivo.dataTerminoSprint"
				style="${style}" decorator="br.com.infowaypi.jheat.webcontent.utils.ShortDateWrapper" title="Previsão de entrega"
				sortable="false" />
			<display:column style="${style}" title="Solicitação Pai" sortable="false" >
				<a href="javascript:JHeat.ajaxReadDetails('${item.class.simpleName}',${item.idSolicitacao},'/JHeatAction.do?action=ajaxDetails&className=br.com.infowaypi.control.entidades.jpede.Solicitacao&id=${item.solicitacaoPai.idSolicitacao}');">${item.solicitacaoPai.nome}</a>
			</display:column>
		</display:table>
	</td>
</tr>
<br/><br/>