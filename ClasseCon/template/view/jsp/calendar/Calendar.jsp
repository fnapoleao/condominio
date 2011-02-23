<%@ include file="/view/jsp/includes/Imports.jsp" %>

<jheat:calendar yearSelected="${yearSelected}" firstYear="${firstYear}" 
	lastYear="${lastYear}" monthSelected="${monthSelected}" daySelected="${daySelected}" mode="${mode}" name="${nameCalendar}" minDate="${minDate}" maxDate="${maxDate}">
	<jheat:week-day elementType="${elementType}" items="${items}" groupValue="${groupValue}" name="${nameWeek}" 
		display="${display}" value="${value}" limit="${limit}" />
</jheat:calendar>