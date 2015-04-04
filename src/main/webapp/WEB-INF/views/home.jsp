<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>

<c:url var="currencyConversion" value="/conversion/currency"></c:url>

<form:form  cssClass="form-horizontal" action="${currencyConversion}" commandName="conversion">	
	<div>
		<div class="form-inline">
			<form:label path="from" cssClass="">
				<spring:message text="From: " />
			</form:label>
			<form:input cssClass="form-control" path="fromAmount" />
			<form:select cssClass="form-control" path="from" items="${availableCurrencies}" ></form:select>
		</div>
		<div class="form-inline">
			<form:label path="to">
				<spring:message text="To: " />
			</form:label>
			<form:input cssClass="form-control" path="toAmount" readonly="true"/>
			<form:select cssClass="form-control" path="to" items="${availableCurrencies}" ></form:select>
		</div>
		<div class="form-inline">
			<input type="submit" name="convert" value="<spring:message text="Convert"/>" />
			<input type="submit" name="revertConversion" value="<spring:message text="Reverse Conversion"/>" />
			<input type="submit" name="newConversion" value="<spring:message text="New Conversion"/>" />
		</div>		
	</div>
		
</form:form>

