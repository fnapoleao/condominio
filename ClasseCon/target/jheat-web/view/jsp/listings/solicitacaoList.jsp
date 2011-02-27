<%@ include file="/view/jsp/includes/Imports.jsp" %>

<div id="title">
	<div id="title-menu">
		<jheat:rolePermission sectional="br.com.infowaypi.jpede.model.Solicitacao" roleAction="insert">
		<button name="insert" onclick="location.href='/JPede/JHeatFlowAction.do?action=start&amp;flowName=FlowInserirSolicitacao&amp;sectionName=solicitacoes'">
			<bean:message key="pageOptions.insert"/>
		</button>
	</jheat:rolePermission>
	</div>

	<h1><html:link action="JHeatDependentAction.do?action=list&className=br.com.infowaypi.jpede.model.Solicitacao&id=0&subMenuItem=list">Listar solicitacões</html:link></h1>
</div>

<%@ include file="/view/jsp/includes/Messages.jsp" %>
<fmt:setLocale value="pt_BR" scope="request"/>
<div class="panel">
	<div class="form-wrapper">
		<form action="JHeatDependentAction.do?action=list&className=br.com.infowaypi.jpede.model.Solicitacao&id=0" method="post">
			<input type="hidden" name="className" id="className" value="${param.className}"/>
			
			
<label id="nome_label"  for="nome">Nome:&nbsp;</label>
<input class="text" type="text" id="nome" name="nome" size="50" maxlength="30" value="${object.nome eq null ? param.nome : object.nome}" onfocus="highlightField(this)" onblur="unhighlightField(this);"/><br />
<label id="dataCadastro_label"  for="dataCadastro">Data de Cadastro:&nbsp;</label>
<input class="text format-d-m-y" type="text" id="dataCadastro" name="dataCadastro" size="20" maxlength="80"onkeypress="return txtBoxFormat(this, '99/99/9999',event);" value="
<c:choose>
<c:when test="${object.dataCadastro != null}"><fmt:formatDate value="${object.dataCadastro}" pattern="dd/MM/yyyy"/></c:when><c:otherwise>${param.dataCadastro}</c:otherwise></c:choose>" onfocus="highlightField(this)" onblur="unhighlightField(this);"/><br />
<label id="projeto_label" for="projeto">Projeto:&nbsp;</label>
<select id="projeto" name="projeto" class="autocomplete-field">
	<option value="-1" selected> <bean:message key="pageOptions.searchAll"/> </option>
<c:forEach var="element" items="${projetoObjects}">
	<c:set var="selected" value=""/> 
	<c:if test="${element.id eq object.projeto.id ||element.id eq param.projeto || element.id eq param.idOwner}"> 
	<c:set var="selected" value="selected"/> </c:if>
	<option value="${element.id}" ${selected}>${element.nome}</option>
</c:forEach>
</select><br />	
	
			<span><button type="submit" name="search"><bean:message key="pageOptions.search"/></button></span>
		</form>
	</div>
	
	<span class="spacer"></span>

	<div class="listing-wrapper">

		<display:table name="objects" id="item" pagesize="10" defaultsort="1" defaultorder="ascending" export="true" requestURI="JHeatAction.do?action=list&className=br.com.infowaypi.jpede.model.Solicitacao" class="yellowTable" cellspacing="2" cellpadding="1">
			
			
<display:column property="nome" title="Nome" sortable="false" style= "text-align: right" headerClass="sortable" decorator="" href="JHeatAction.do?action=details&sectionName=${sectionName}&className=br.com.infowaypi.jpede.model.Solicitacao" paramId="id" paramProperty="id"/>
<display:column property="motivo" title="Motivo pela requisição da solicitação" sortable="false" style= "text-align: left" headerClass="sortable" decorator="" />
<display:column property="detalhamento" title="Detalhamento da solicitação" sortable="false" style= "text-align: left" headerClass="sortable" decorator="" />
<display:column property="fluxos" title="Fluxos afetados" sortable="false" style= "text-align: left" headerClass="sortable" decorator="" />
<display:column property="prioridade" title="Prioridade" sortable="false" style= "text-align: left" headerClass="sortable" decorator="" />
<display:column property="projeto.nome" title="Projeto" sortable="false" style= "text-align: left" headerClass="sortable" href="JHeatAction.do?action=details&sectionName=${sectionName}&className=br.com.infowaypi.jpede.model.Projeto" paramId="id" paramProperty="projeto.id"/>

		    
	<jheat:rolePermission sectional="br.com.infowaypi.jpede.model.Solicitacao" roleAction="update,exec">
		<display:column titleKey="displaytag.options" media="html" headerClass="options-column" class="options-column">
		<jheat:rolePermission sectional="br.com.infowaypi.jpede.model.Solicitacao" roleAction="update">
			<html:link href="JHeatAction.do?action=updateObject&sectionName=${sectionName}&className=br.com.infowaypi.jpede.model.Solicitacao&id=${item.id}">
			<bean:message key="pageOptions.update"/>
			</html:link>
		</jheat:rolePermission>
		<jheat:rolePermission sectional="br.com.infowaypi.jpede.model.Solicitacao" roleAction="exec">
		</jheat:rolePermission>
		</display:column>
	</jheat:rolePermission>
		    
		    <display:setProperty name="basic.empty.showtable" value="true"/>
		    <display:setProperty name="export.amount" value="list"/>
		    <display:setProperty name="export.pdf.filename" value="Listar solicitacões.pdf"/>
		    <display:setProperty name="export.excel.filename" value="Listar solicitacões.xls"/>
		</display:table>
	</div>
	<c:remove var="item"/>
</div>	