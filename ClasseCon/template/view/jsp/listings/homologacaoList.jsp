<%@ include file="/view/jsp/includes/Imports.jsp" %>

<div id="title">
	<div id="title-menu">
		<jheat:rolePermission sectional="br.com.infowaypi.jpede.model.Homologacao" roleAction="insert">
		<button name="insert" onclick="location.href='/JPede/JHeatFlowAction.do?action=start&flowName=FlowInserirHomologacao&sectionName=solicitacoes'">
			<bean:message key="pageOptions.insert"/>
		</button>
	</jheat:rolePermission>
	</div>

	<h1><html:link action="JHeatAction.do?action=list&className=br.com.infowaypi.jpede.model.Homologacao&id=0&subMenuItem=list">Listar homologações</html:link></h1>
</div>

<%@ include file="/view/jsp/includes/Messages.jsp" %>
<fmt:setLocale value="pt_BR" scope="request"/>
<div class="panel">
	<div class="form-wrapper">
		<form action="JHeatAction.do?action=list&className=br.com.infowaypi.jpede.model.Homologacao&id=0" method="post">
			<input type="hidden" name="className" id="className" value="${param.className}"/>
			
			
<label id="solicitacao_nome_label"  for="solicitacao.nome">Nome:&nbsp;</label>
<input class="text" type="text" id="solicitacao_nome" name="solicitacao_nome" size="50" maxlength="50" value="${object.solicitacao.nome eq null ? param.solicitacao_nome : object.solicitacao.nome}" onfocus="highlightField(this)" onblur="unhighlightField(this);"/><br />
<label id="dataCadastro_label"  for="dataCadastro">Data de Cadastro:&nbsp;</label>
<input class="text format-d-m-y" type="text" id="dataCadastro" name="dataCadastro" size="20" maxlength="10"onkeypress="return txtBoxFormat(this, '99/99/9999',event);" value="
<c:choose>
<c:when test="${object.dataCadastro != null}"><fmt:formatDate value="${object.dataCadastro}" pattern="dd/MM/yyyy"/></c:when><c:otherwise>${param.dataCadastro}</c:otherwise></c:choose>" onfocus="highlightField(this)" onblur="unhighlightField(this);"/><br />	
	
			<span><button type="submit" name="search"><bean:message key="pageOptions.search"/></button></span>
		</form>
	</div>
	
	<span class="spacer"></span>

	<div class="listing-wrapper">

		<display:table name="objects" id="item" pagesize="10" defaultsort="1" defaultorder="ascending" export="true" requestURI="JHeatAction.do?action=list&className=br.com.infowaypi.jpede.model.Homologacao" class="yellowTable" cellspacing="2" cellpadding="1">
			
			
<display:column property="solicitacao.nome" title="Nome" sortable="false" style= "text-align: left" headerClass="sortable" decorator="" href="JHeatAction.do?action=details&sectionName=${sectionName}&className=br.com.infowaypi.jpede.model.Homologacao" paramId="id" paramProperty="id"/>
<display:column property="definicao" title="Definição do fluxo" sortable="false" style= "text-align: left" headerClass="sortable" decorator="" />
<display:column property="localizacao" title="Localização do fluxo" sortable="false" style= "text-align: left" headerClass="sortable" decorator="" />
<display:column property="dataCadastro" title="Data de Cadastro" sortable="false" style= "text-align: default" headerClass="sortable" decorator="br.com.infowaypi.jheat.webcontent.utils.ShortDateWrapper" />

		    
	<jheat:rolePermission sectional="br.com.infowaypi.jpede.model.Homologacao" roleAction="update,exec">
		<display:column titleKey="displaytag.options" media="html" headerClass="options-column" class="options-column">
		<jheat:rolePermission sectional="br.com.infowaypi.jpede.model.Homologacao" roleAction="update">
			<html:link href="JHeatAction.do?action=updateObject&sectionName=${sectionName}&className=br.com.infowaypi.jpede.model.Homologacao&id=${item.id}">
			<bean:message key="pageOptions.update"/>
			</html:link>
		</jheat:rolePermission>
		<jheat:rolePermission sectional="br.com.infowaypi.jpede.model.Homologacao" roleAction="exec">
		</jheat:rolePermission>
		</display:column>
	</jheat:rolePermission>
		    
		    <display:setProperty name="basic.empty.showtable" value="true"/>
		    <display:setProperty name="export.amount" value="list"/>
		    <display:setProperty name="export.pdf.filename" value="Listar Homologações.pdf"/>
		    <display:setProperty name="export.excel.filename" value="Listar Homologações.xls"/>
		</display:table>
	</div>
	<c:remove var="item"/>
</div>	