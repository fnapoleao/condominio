<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %><%@ attribute name="text" required="true" %><%@ attribute name="size" required="true" %><%@ attribute name="align" required="true" %><c:set var="textx" value="${text}" scope="request"/><c:set var="sizex" value="${size}" scope="request"/><c:set var="alignx" value="${align}" scope="request"/><c:choose><c:when test="${text != null && text != ''}"><%
			String text = (String)request.getAttribute("textx");
			String size = (String)request.getAttribute("sizex");		
			String align = (String)request.getAttribute("alignx");
			
			Integer sizeFormatado = Integer.valueOf(size);
			text = org.apache.commons.lang.StringUtils.abbreviate(text, sizeFormatado);
			if(align.equals("left"))
				text = org.apache.commons.lang.StringUtils.rightPad(text, sizeFormatado, ' ');
			else
				text = org.apache.commons.lang.StringUtils.leftPad(text, sizeFormatado, ' ');
			request.setAttribute("textx", text);
			request.setAttribute("sizex", sizeFormatado);
		%><c:out value="${fn:substring(requestScope.textx, 0, requestScope.sizex)}"/></c:when><c:otherwise><%
			String size = (String)request.getAttribute("sizex");		
			Integer sizeFormatado = Integer.valueOf(size);
		
			if(align.equals("left"))
				text = org.apache.commons.lang.StringUtils.rightPad("-", sizeFormatado, ' ');
			else
				text = org.apache.commons.lang.StringUtils.leftPad("-", sizeFormatado, ' ');

			request.setAttribute("textVazio", text);				
		%><c:out value="${requestScope.textVazio}"/></c:otherwise></c:choose>