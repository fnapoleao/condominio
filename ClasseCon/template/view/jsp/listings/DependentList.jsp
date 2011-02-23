<fieldset name="PAGE_TITLE">
<legend>PAGE_TITLE</legend>
INSERT_BUTTON
<div class="listing-wrapper">
<display:table name="${object.PROPERTY_NAME}" id="ID_TABLE" class="yellowTable"
	pagesize="PAGE_SIZE" defaultsort="DEFAULT_SORT" defaultorder="DEFAULT_ORDER" export="true"	
	requestURI="JHeatAction.do?action=details&className=${param.className}&id=${param.id}" decorator="br.com.infowaypi.jheat.webcontent.utils.AjaxBasicWrapper">
	
	LIST_COLUMNS

    <display:setProperty name="basic.empty.showtable" value="true"/>
    <display:setProperty name="export.amount" value="list"/>
    <display:setProperty name="export.pdf.filename" value="PAGE_TITLE.pdf"/>
    <display:setProperty name="export.excel.filename" value="PAGE_TITLE.xls"/>

</display:table>
</div>
</fieldset>
<c:remove var="ID_TABLE"/>
<span class="spacer"></span>