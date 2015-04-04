package com.rodrigopeleias.mycurrencyconversion.service.impl;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.JsonNode;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;
import com.rodrigopeleias.mycurrencyconversion.model.Conversion;
import com.rodrigopeleias.mycurrencyconversion.model.Currency;
import com.rodrigopeleias.mycurrencyconversion.service.ConversionService;

@Service
public class ConversionServiceImpl implements ConversionService {

	@Override
	public Map<String, String> getAvailableCurrencies() {
		try {
			return requestAvailableCurrencies();
		} catch (UnirestException | IOException e) {		
			return null;
		}
	}

	private Map<String, String> requestAvailableCurrencies() throws UnirestException, IOException, JsonParseException, JsonMappingException {
		HttpResponse<JsonNode> response = Unirest.get("https://currencyconverter.p.mashape.com/availablecurrencies")
				.header("X-Mashape-Key", "4yf7oGZM6lmshwtWAwDsXVvbkG1Yp1ooLhAjsnsRHvKcgiMZqk")
				.header("Accept", "application/json")
				.asJson();
		JSONArray conversionResponse = response.getBody().getArray();
		ObjectMapper mapper = new ObjectMapper();
		Currency[] currencies = mapper.readValue(conversionResponse.toString(), Currency[].class);
		Map<String, String> currencyList = new HashMap<String, String>();
		for (Currency currency : currencies) {
			currencyList.put(currency.getId(), currency.getDescription());
		}		
		return currencyList;
	}

	@Override
	public Conversion getConvertedCurrency(Conversion conversion)  {
		try {
			return requestConversion(conversion);
		} catch (UnirestException | IOException e) {
			return null;
		}		
	}

	private Conversion requestConversion(Conversion conversion) throws UnirestException, IOException, JsonParseException, JsonMappingException {
		String requestUrl = "https://currencyconverter.p.mashape.com/?from=" + conversion.getFrom() + 
				"&from_amount=" + Double.toString(conversion.getFromAmount()) + 
				"&to=" + conversion.getTo();
		HttpResponse<JsonNode> response = Unirest.get(requestUrl)
				.header("X-Mashape-Key", "mjZx0elX3Zmshr59bVs60OTKXKBYp1cVWGNjsnj6X8qORMEAq2")
				.header("Accept", "application/json")
				.asJson();
		JSONObject objectResponse = response.getBody().getObject();
		ObjectMapper mapper = new ObjectMapper();
		Conversion conversionResponse = mapper.readValue(objectResponse.toString(), Conversion.class);
		return conversionResponse;
	}

	@Override
	public Conversion getRevertedConversion(Conversion conversion) {
		Conversion revertedConversion = new Conversion();
		revertedConversion.setFrom(conversion.getTo());
		revertedConversion.setTo(conversion.getFrom());
		revertedConversion.setFromAmount(conversion.getToAmount());
		try {
			return requestConversion(revertedConversion);
		} catch (UnirestException | IOException e) {			
			return null;
		}
	}
}
