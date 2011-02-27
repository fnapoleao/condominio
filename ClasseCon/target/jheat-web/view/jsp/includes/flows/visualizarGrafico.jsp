<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/tags/displayTags" prefix="display" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri='/WEB-INF/tags/cewolf.tld' prefix='cewolf' %>

<HR>
<jsp:useBean id="bean" class="br.com.infowaypi.control.services.GerarGrafico"/>
<jsp:setProperty name="bean" property="sprintDoGrafico" value="${resumoInformacoesSprint.sprint}" />
<cewolf:chart id="grafico1" title="${resumoInformacoesSprint.sprint.idNome}" 
	type="xy"
	xaxislabel="Dias do sprint" 
	yaxislabel="horas">
	<cewolf:gradientpaint>
		<cewolf:point x="0" y="0" color="#FBFBFB" />
		<cewolf:point x="350" y="0" color="#F3F3F3" />
	</cewolf:gradientpaint>
	<cewolf:chartpostprocessor id="bean" />
	<cewolf:data>
        <cewolf:producer id="bean"/>
    </cewolf:data>
</cewolf:chart>
<p>
<cewolf:img chartid="grafico1" renderer="/cewolf" width="650" height="400"/>
<P>
