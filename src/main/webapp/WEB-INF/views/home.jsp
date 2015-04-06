<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>

<c:url var="currencyConversion" value="/conversion/currency"></c:url>

<form:form id="conversionForm" cssClass="form-horizontal" action="${currencyConversion}" commandName="conversion">	
	<div class="input-group">
		<div class="form-group">			
			<div class="col-sm-1">
				<form:label path="from" cssClass="col-sm-3 control-label">
					<spring:message text="From: " />
				</form:label>
			</div>
			<div class="col-sm-3">
				<div class="input-group">
					<span class="input-group-addon" id="basic-addon1">$</span>
					<form:input cssClass="form-control" path="fromAmount" aria-describedby="basic-addon1" />
				</div>
			</div>
			<div class="col-sm-3">
				<div class="input-group">
					<form:select cssClass="form-control" path="from" items="${availableCurrencies}" ></form:select>
				</div>
			</div>																
		</div>
		<div class="form-group">					
			<div class="col-sm-1">
				<form:label path="to" cssClass="col-sm-2 control-label">
					<spring:message text="To: " />
				</form:label>
			</div>
			<div class="col-sm-3">
				<div class="input-group">
					<span class="input-group-addon" id="basic-addon2">$</span>
					<form:input cssClass="form-control" path="toAmount" readonly="true" aria-describedby="basic-addon1" />
				</div>
			</div>
			<div class="col-sm-3">
				<div class="input-group" >
					<form:select cssClass="form-control" path="to" items="${availableCurrencies}" ></form:select>
				</div>
			</div>																	
		</div>
		<div class="form-group">
			<div class="row" >
				<input type="submit" class="btn btn-primary" name="convert" value="<spring:message text="Convert"/>" />
				<input type="submit" class="btn btn-primary" name="revertConversion" value="<spring:message text="Reverse Conversion"/>" />
				<input type="submit" class="btn btn-primary" name="newConversion" value="<spring:message text="New Conversion"/>" />
			</div>			
		</div>		
	</div>
</form:form>

<script>
	$(function() {		
		$('#fromAmount').mask('#.##0,00', {reverse: true});
		$('#toAmount').mask('#.##0,00', {reverse: true});

		$('#conversionForm').submit(function() {
			$('#fromAmount').val($('#fromAmount').val().replace('.','').replace(',','.'));
			$('#toAmount').val($('#toAmount').val().replace('.','').replace(',','.'));
		});
		
	})
</script>

