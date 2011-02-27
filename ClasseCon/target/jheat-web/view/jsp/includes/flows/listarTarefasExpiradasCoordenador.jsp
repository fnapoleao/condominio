<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/tags/displayTags" prefix="display" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<infoway:tableSeparator titulo="Informações gerais" colspan="2" />
<tr>
	<td colspan="2">
	
			<!-- Legenda -->
			<span style="background: #ccffcc; color: #000000;">&nbsp;Verde&nbsp;</span> Prioridade Baixa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span style="background: #ffe373; color: #000000;">&nbsp;Amarelo&nbsp;</span> Prioridade Normal&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span style="background: #FFAAAA; color: #000000;">&nbsp;Vermelho&nbsp;</span> Prioridade Crítica&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


	
	
	<display:table id="item" name="${requestScope.resumo.grupo}" requestURI="/JHeatReportAction.do" defaultsort="0"
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
				
				
				<display:column title="Código" headerClass="sortable" sortable="false" style = "${style}">
					<a href="javascript:JHeat.ajaxReadDetails('${item.class.simpleName}',${item.idTarefa},'/JHeatAction.do?action=ajaxDetails&className=br.com.infowaypi.control.entidades.Tarefa&id=${item.idTarefa}');">${item.idTarefa}</a>
				</display:column>
				<display:column property="colaboradoresToString"
					style="${style}" decorator="" title="Desenvolvedor(es)"
					sortable="false" />
				<display:column property="descricaoTarefa"
					style="${style}" decorator="" title="Nome tarefa"
					sortable="false" />
				<display:column property="projeto.nome"
					style="${style}" decorator="" title="Projeto"
					sortable="false" />
				<display:column property="situacao.descricao"
					style="${style}" decorator="" title="Situação"
					sortable="false" />
				<display:column property="previsaoFormatada" style="${style}"
					decorator="" title="Previsao (h:m)" sortable="false" />
				<display:column property="tempoAtual" style="${style}"
					decorator="" title="Tempo Gasto" sortable="false"/>
				<display:setProperty name="basic.empty.showtable" value="true" />
	</display:table></td>
</tr>
<br/></br></br>
<div id="download-image">
	<html:link href="JHeatReportAction.do?action=download&
		className=br.com.infowaypi.control.resumos.ResumoTarefa&
		objectSession=resumo&
		propertyName=fileCartoes&
		nameFile=fileCartoesName&fileType=pdf">
		<b>Download</b> Cart&otilde;es Scrum
	</html:link><br/>
	
</div>
<br/>