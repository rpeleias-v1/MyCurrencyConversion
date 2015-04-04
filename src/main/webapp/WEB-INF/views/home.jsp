<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
	<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<title>Home</title>
</head>
<body>
<h1>
	My Currency Converter
</h1>

<c:url var="currencyConversion" value="/conversion/currency"></c:url>

<form:form  action="${currencyConversion}" commandName="conversion">
	<table>
		<tr>
			<td>
				<form:label path="from">
					<spring:message text="From: " />
				</form:label>
			</td>
			<td>
				<form:input path="fromAmount" />
			</td>
			<td>
				<form:select path="from" items="${availableCurrencies}" ></form:select>
			</td>
		</tr>
		<tr>
			<td>
				<form:label path="to">
					<spring:message text="To: " />
				</form:label>
			</td>
			<td>
				<form:input path="toAmount" readonly="true"/>
			</td>
			<td>
				<form:select path="to" items="${availableCurrencies}" ></form:select>
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<input type="submit" name="convert" value="<spring:message text="Convert"/>" />
				<input type="submit" name="revertConversion" value="<spring:message text="Reverse Conversion"/>" />
				<input type="submit" name="newConversion" value="<spring:message text="New Conversion"/>" />
			</td>
		</tr>
	</table>
</form:form>

</body>
</html>

