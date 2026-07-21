<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<form method="get" action="route_times.jsp">
	<label for="date">Date:</label>
	<input type="date" name="date" id="date">

	<label for="origin">Origin:</label>
	<select name="origin" id="origin" required>
		<jsp:include page = "station_options.jsp"  />
	</select>

	<label for="dest">Dest:</label>
	<select id="dest" name="dest" required>
		<jsp:include page = "station_options.jsp" />
	</select>
	<input type="submit" value="Search">		
</form>	