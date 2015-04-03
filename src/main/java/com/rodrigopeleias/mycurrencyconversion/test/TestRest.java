package com.rodrigopeleias.mycurrencyconversion.test;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;
import org.json.JSONArray;
import org.json.JSONObject;

import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.JsonNode;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;
import com.rodrigopeleias.mycurrencyconversion.model.Currency;

public class TestRest {

	public static void main(String[] args) {

		try {
			HttpResponse<JsonNode> response = Unirest.get("https://currencyconverter.p.mashape.com/availablecurrencies")
					.header("X-Mashape-Key", "4yf7oGZM6lmshwtWAwDsXVvbkG1Yp1ooLhAjsnsRHvKcgiMZqk")
					.header("Accept", "application/json")
					.asJson();
			JSONArray conversionResponse = response.getBody().getArray();
			ObjectMapper mapper = new ObjectMapper();
			Currency[] currencies = mapper.readValue(conversionResponse.toString(), Currency[].class);
			List<Currency> currenciesList = Arrays.asList(currencies);
			for (Currency currency : currenciesList) {
				System.out.println(currency.getId());
				System.out.println(currency.getDescription());

			}
		} catch (UnirestException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
