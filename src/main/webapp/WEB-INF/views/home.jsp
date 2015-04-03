<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	My Currency Converter
</h1>

<c:url var="currencyConversion" value="/currency/convert"></c:url>

<form:form  method="POST" action="${currencyConversion}" commandName="conversion">
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
				<form:input path="toAmount" disabled="true"/>
			</td>
			<td>
				<form:select path="to" items="${availableCurrencies}" ></form:select>
			</td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="<spring:message text="Convert"/>" />
			</td>
		</tr>
	</table>
</form:form>
</body>
</html>
