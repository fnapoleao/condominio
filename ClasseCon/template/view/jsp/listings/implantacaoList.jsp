<%@ include file="/view/jsp/includes/Imports.jsp" %>

<div id="title">
	<div id="title-menu">
		<jheat:rolePermission sectional="br.com.infowaypi.jpede.model.Implantacao" roleAction="insert">
		<button name="insert" onclick="location.href='/JPede/JHeatFlowAction.do?action=start&flowName=FlowInserirImplantacao&sectionName=solicitacoes'">
			<bean:message key="pageOptions.insert"/>
		</button>
	</jheat:rolePermission>
	</div>

	<h1><html:link action="JHeatAction.do?action=list&className=br.com.infowaypi.jpede.model.Implantacao&id=0&subMenuItem=list">Listar implantações</html:link></h1>
</div>

<%@ include file="/view/jsp/includes/Messages.jsp" %>
<fmt:setLocale value="pt_BR" scope="request"/>
<div class="panel">
	<div class="form-wrapper">
		<form action="JHeatAction.do?action=list&className=br.com.infowaypi.jpede.model.Implantacao&id=0" method="post">
			<input type="hidden" name="className" id="className" value="${param.className}"/>
			
			
<label id="nome_label"  for="nome">Nome:&nbsp;</label>
<input class="text" type="text" id="nome" name="nome" size="40" maxlength="40" value="${object.nome eq null ? param.nome : object.nome}" onfocus="highlightField(this)" onblur="unhighlightField(this);"/><br />
<label id="dataImplantacao_label"  for="dataImplantacao">Data da Implantação:&nbsp;</label>
<input class="text format-d-m-y" type="text" id="dataImplantacao" name="dataImplantacao" size="20" maxlength="10"onkeypress="return txtBoxFormat(this, '99/99/9999',event);" value="
<c:choose>
<c:when test="${object.dataImplantacao != null}"><fmt:formatDate value="${object.dataImplantacao}" pattern="dd/MM/yyyy"/></c:when><c:otherwise>${param.dataImplantacao}</c:otherwise></c:choose>" onfocus="highlightField(this)" onblur="unhighlightField(this);"/><br />	
	
			<span><button type="submit" name="search"><bean:message key="pageOptions.search"/></button></span>
		</form>
	</div>
	
	<span class="spacer"></span>

	<div class="listing-wrapper">

		<display:table name="objects" id="item" pagesize="10" defaultsort="1" defaultorder="ascending" export="true" requestURI="JHeatAction.do?action=list&className=br.com.infowaypi.jpede.model.Implantacao" class="yellowTable" cellspacing="2" cellpadding="1">
			
			
<display:column property="nome" title="Nome" sortable="false" style= "text-align: left" headerClass="sortable" decorator="" href="JHeatAction.do?action=details&sectionName=${sectionName}&className=br.com.infowaypi.jpede.model.Implantacao" paramId="id" paramProperty="id"/>
<display:column property="descricao" title="Descrição" sortable="false" style= "text-align: left" headerClass="sortable" decorator="" />
<display:column property="dataImplantacao" title="Data da Implantação" sortable="false" style= "text-align: default" headerClass="sortable" decorator="br.com.infowaypi.jheat.webcontent.utils.ShortDateWrapper" />

		    
	<jheat:rolePermission sectional="br.com.infowaypi.jpede.model.Implantacao" roleAction="update,exec">
		<display:column titleKey="displaytag.options" media="html" headerClass="options-column" class="options-column">
		<jheat:rolePermission sectional="br.com.infowaypi.jpede.model.Implantacao" roleAction="update">
			<html:link href="JHeatAction.do?action=updateObject&sectionName=${sectionName}&className=br.com.infowaypi.jpede.model.Implantacao&id=${item.id}">
			<bean:message key="pageOptions.update"/>
			</html:link>
		</jheat:rolePermission>
		<jheat:rolePermission sectional="br.com.infowaypi.jpede.model.Implantacao" roleAction="exec">
		</jheat:rolePermission>
		</display:column>
	</jheat:rolePermission>
		    
		    <display:setProperty name="basic.empty.showtable" value="true"/>
		    <display:setProperty name="export.amount" value="list"/>
		    <display:setProperty name="export.pdf.filename" value="Listar Implantações.pdf"/>
		    <display:setProperty name="export.excel.filename" value="Listar Implantações.xls"/>
		</display:table>
	</div>
	<c:remove var="item"/>
</div>	