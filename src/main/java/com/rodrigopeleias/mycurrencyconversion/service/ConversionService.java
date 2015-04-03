package com.rodrigopeleias.mycurrencyconversion.service;

import java.util.Map;

import com.rodrigopeleias.mycurrencyconversion.model.Conversion;

public interface ConversionService {
	
	Map<String, String> getAvailableCurrencies();
	Conversion getConvertedCurrency(Conversion conversion);

}
