<%@ include file="/view/jsp/includes/Imports.jsp" %>

<div id="title">
	<h1><html:link action="ACTION_MAPPING.do?action=list&className=CLASS_NAME&id=0&subMenuItem=list">PAGE_TITLE</html:link></h1>
</div>

<%@ include file="/view/jsp/includes/Messages.jsp" %>
<fmt:setLocale value="pt_BR" scope="request"/>
<div class="panel">
	<div class="form-wrapper">
		<form action="ACTION_MAPPING.do?action=list&className=CLASS_NAME&id=0" method="post">
			<input type="hidden" name="className" id="className" value="${param.className}"/>
			
			LIST_SEARCH_OPTIONS	
	
			<span><button type="submit" name="search"><bean:message key="pageOptions.search"/></button></span>
		</form>
	</div>
	
	<span class="spacer"></span>

	<div class="listing-wrapper">
	<div id="title-menu">
		TITLE_MENU
	</div>

		<display:table name="objects" id="item" pagesize="10" defaultsort="1" defaultorder="ascending" export="true" requestURI="JHeatAction.do?action=list&className=CLASS_NAME" class="yellowTable" cellspacing="2" cellpadding="1">
			
			LIST_COLUMNS

		    METHODS_OPTIONS
		    
		    <display:setProperty name="basic.empty.showtable" value="true"/>
		    <display:setProperty name="export.amount" value="list"/>
		    <display:setProperty name="export.pdf.filename" value="PAGE_TITLE.pdf"/>
		    <display:setProperty name="export.excel.filename" value="PAGE_TITLE.xls"/>
		</display:table>
	</div>
	<c:remove var="item"/>
</div>	