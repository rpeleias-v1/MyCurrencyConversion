package com.rodrigopeleias.mycurrencyconversion.model;

import org.codehaus.jackson.annotate.JsonProperty;

public class Conversion {
	
	private String from;
	private String to;
	
	@JsonProperty("from_amount")
	private double fromAmount;
	
	@JsonProperty("to_amount")
	private double toAmount;
	
	public String getFrom() {
		return from;
	}
	
	public void setFrom(String from) {
		this.from = from;
	}
	
	public String getTo() {
		return to;
	}
	
	public void setTo(String to) {
		this.to = to;
	}
	
	public double getFromAmount() {
		return fromAmount;
	}
	
	public void setFromAmount(double fromAmount) {
		this.fromAmount = fromAmount;
	}
	
	public double getToAmount() {
		return toAmount;
	}
	
	public void setToAmount(double toAmount) {
		this.toAmount = toAmount;
	}
}
