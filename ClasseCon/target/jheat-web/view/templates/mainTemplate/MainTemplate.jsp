<%@ include file="/view/jsp/includes/TagLibs.jsp" %>
<%@ taglib uri="/WEB-INF/tags/struts-tiles.tld" prefix="tiles" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>APPLICATION_TITLE</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<meta http-equiv="Content-Language" content="pt-br" />
	<meta name="description" content="Quantum" />
	<meta name="keywords" content="Quantum, Produtividade, Scrum, Sprint, Review, Estimativa" />

	<link href="${pageContext.request.contextPath}/view/templates/mainTemplate/styles/css-reset.css" rel="stylesheet" media="all" type="text/css" />
	<link href="${pageContext.request.contextPath}/view/templates/mainTemplate/styles/calendar.css" rel="stylesheet" media="screen" type="text/css" />
    <link href="${pageContext.request.contextPath}/view/calendario/css/datepicker.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/view/templates/mainTemplate/styles/quantum.css" rel="stylesheet" media="screen" type="text/css" />
	<link href="${pageContext.request.contextPath}/view/templates/mainTemplate/styles/print.css" rel="stylesheet" media="print" type="text/css" />
	<%
		response.addHeader("Pragma", "No-cache");
		response.addHeader("Cache-Control", "No-cache");
		response.addDateHeader("Expires", 0); 
	%>

	<%@ include file="/view/jsp/includes/JavaScripts.jsp"%>

    <script type="text/javascript" src="${pageContext.request.contextPath}/view/calendario/js/datepicker.js"></script>
    <link href="${pageContext.request.contextPath}/view/calendario/css/datepicker.css" rel="stylesheet" type="text/css" />

</head>

<body onload="DWRUtil.useLoadingMessage();">
	<tiles:useAttribute name="pageTitle" scope="request"/>
	<div id="wrapper">
		<div id="wrapperBGRight">
			<div id="top">
				<div id="header">
					Quantum. 
				</div>
				<div id="navigation">
					<c:if test="${sessionScope.usuario != null}">
						<div id="user-info" class="sans-small">
							<span>Usu&aacute;rio: <strong>${sessionScope.usuario.nome}</strong> | <html:link action="JHeatAuthenticatorAction.do?action=exit"><bean:message key="authenticator.logoutMessage"/></html:link></span>
						</div>
					</c:if>
	
					<ul>
						<li class="${requestScope.pageTitle eq 'home' ? 'selected' : ''}"><html:link module="" action="getRoles.do"><span>Principal</span></html:link></li>
						<jheat:sectionsList/>
					</ul>
				</div>
			</div>
			<div id="container">
				<tiles:insert attribute="mainMenu"/>	
				<div id="content">
					<tiles:insert attribute="body"/>				
				</div>
			<div id="footer">&copy; © 2006 - 2010 <a href="http://www.infoway-pi.com.br/" target="_blank"><strong>Infoway</strong> - <i>Tecnologia e Gestão de Saúde LTDA.</i></a></div>
			</div>
		</div>
	</div>
</body>
</html>