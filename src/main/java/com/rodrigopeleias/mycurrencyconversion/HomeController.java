package com.rodrigopeleias.mycurrencyconversion;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rodrigopeleias.mycurrencyconversion.model.Conversion;
import com.rodrigopeleias.mycurrencyconversion.service.ConversionService;

@Controller
public class HomeController {
			
	@Autowired
	private ConversionService conversionService;
		
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		setupPage(model, new Conversion());
		return "home";
	}
	
	@RequestMapping(value = "/conversion/currency", method = RequestMethod.POST, params = "convert")
	public String currencyConversion(@ModelAttribute("conversion") Conversion conversion, Model model) {
		Conversion conversionResponse = conversionService.getConvertedCurrency(conversion);
		setupPage(model, conversionResponse);
		return "home";
	}
	
	@RequestMapping(value = "/conversion/currency", method = RequestMethod.POST, params = "revertConversion")
	public String revertConversion(@ModelAttribute("conversion") Conversion conversion, Model model) {
		Conversion conversionResponse = conversionService.getRevertedConversion(conversion);
		setupPage(model, conversionResponse);
		return "home";
	}
	
	@RequestMapping(value = "/conversion/currency", method = RequestMethod.POST, params = "newConversion")
	public String newConversion() {
		return "redirect:/";
	}

	private void setupPage(Model model, Conversion conversionResponse) {
		model.addAttribute("conversion", conversionResponse);
		model.addAttribute("availableCurrencies", conversionService.getAvailableCurrencies());
	}
	
}
