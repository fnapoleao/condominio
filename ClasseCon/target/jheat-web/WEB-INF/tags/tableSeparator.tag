<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="titulo" required="true" %>
<%@ attribute name="colspan" required="true"%>

<tr class="separator">
	<td colspan="${colspan}"><strong>${titulo}</strong></td>								
</tr>						