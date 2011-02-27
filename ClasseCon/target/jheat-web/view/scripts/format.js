// gkFormat

var Format = {
	allowFunctionKeys: true,
	
	// Brazilian standard: R$ 1.234,56
	digitSeparator: '.',
	decimalSeparator: ',',
	
	textOnly: function(inputObj, evt) {
		if (typeof evt == "undefined") {
			if (typeof event != "undefined") { evt = event; }
			else { return false; }
		}
		
		return !Format.isnum(Format.getKeyCode(evt));
	},
	
	numberOnly: function(inputObj, evt) {
		if (typeof evt == "undefined") {
			if (typeof event != "undefined") { evt = event; }
			else { return false; }
		}
		
		return Format.isnum(Format.getKeyCode(evt)) || Format.isFunctionKey(Format.getKeyCode(evt));
	},
	
	money: function(inputObj, evt, directFormat) {
		if (typeof evt == "undefined") {
			if (typeof event != "undefined") { evt = event; }
			else { return false; }
		}
		
		if (typeof directFormat != "boolean") { directFormat = true; }
		if (typeof inputObj.rawText == "undefined") { inputObj.rawText = ""; }
		
		if (Format.isInternetExplorer()) {
			inputObj.onkeydown = function (event) {
				if ((Format.getKeyCode(evt) == 8) || (Format.getKeyCode(evt) == 46)) {
					inputObj.rawText = inputObj.rawText.substring(0, inputObj.rawText.length - 1);
					
					if (directFormat) { inputObj.value = Format.moneyFormat2(inputObj.rawText); }
					else { inputObj.value = Format.moneyFormat(inputObj.rawText); }
					
					return false;
				}
			};
		}
		
		if ((Format.numberOnly(inputObj, evt)) || (Format.getKeyCode(evt) == 44) || (Format.getKeyCode(evt) == 46)) {
			if (!Format.isFunctionKey(Format.getKeyCode(evt))) {
				var depoisDaVirgula = inputObj.rawText.split(',')[1];
				if (!depoisDaVirgula || (depoisDaVirgula.length < 2)) {
					inputObj.rawText += Format.getKey(Format.getKeyCode(evt));
				}
			}
			else if ((Format.getKeyCode(evt) == 8) || (Format.getKeyCode(evt) == 46)) {
				inputObj.rawText = inputObj.rawText.substring(0, inputObj.rawText.length - 1);
			}
			
			if (directFormat) { inputObj.value = Format.moneyFormat2(inputObj.rawText); }
			else { inputObj.value = Format.moneyFormat(inputObj.rawText); }
		}
		
		return false;
	},
	
	moneyFormat: function(text) {
		var parts = text.split(',');
		var num = (parts[0] ? parts[0] : "0");
		var cents = (parts[1] ? (parts[1].length == 1 ? parts[1] + "0" : (parts[1] == 2 ? parts[1] : parts[1].substring(0, 2))) : "00");
		var formattedString = "";
		var numAdded = 0;
		
		for (var i = num.length - 1; i >= 0; i--) {
			if (!Format.isnum(num.charAt(i))) { continue; }
			if ((numAdded > 0) && (numAdded % 3 == 0)) { formattedString = "." + formattedString; }
			formattedString = num.charAt(i) + formattedString;
			numAdded++;
		}
		
		return formattedString + "," + cents;
	},
	
	moneyFormat2: function(text) {
		var formattedString = "";
		var numAdded = 0;
		
		for (var i = text.length - 1; i >= 0; i--) {
			if (!Format.isnum(text.charAt(i))) { continue; }
			
			if (formattedString.length == 2) { formattedString = text.charAt(i) + "," + formattedString; }
			else {
				if ((numAdded > 0) && (numAdded % 3 == 0)) { formattedString = "." + formattedString; }
				formattedString = text.charAt(i) + formattedString;
			}
			if (formattedString.length > 2) { numAdded++; }
		}
		
		return (formattedString.length < 3 ? "0," + (formattedString.length == 0 ? "00" : (formattedString.length == 1 ? "0" + formattedString : formattedString)) : formattedString);
	},
	
	formatText: function(text, mask) {
		var formattedString = "";
		var textIndex = 0;
		
		for (var i = 0; i < mask.length; i++) {
			if (textIndex > text.length) { return formattedString; }
			
			if (mask[i] == "#") {
				if (Format.isnum(text[textIndex++])) {
					formattedString += text[textIndex - 1];
				}
			}
			else if (mask[i] == "a") {
				if (!Format.isnum(text[textIndex++])) {
					formattedString += text[textIndex - 1].toLower();
				}
			}
			else if (mask[i] == "A") {
				if (!Format.isnum(text[textIndex++])) {
					formattedString += text[textIndex - 1].toUpper();
				}
			}
			else {
				formattedString += mask[i];
			}
		}
		
		return formattedString;
	},
	
	unformatText: function(text, mask) {
		var formattedString = "";
		
		for (var i = 0; i < mask.length; i++) {
			if (i > text.length) { return formattedString; }
			
			if (mask[i] == "#") {
				if (Format.isnum(text[i])) {
					formattedString += text[i];
				}
			}
			else if (mask[i] == "a") {
				if (!Format.isnum(text[i])) {
					formattedString += text[i].toLower();
				}
			}
			else if (mask[i] == "A") {
				if (!Format.isnum(text[i])) {
					formattedString += text[i].toUpper();
				}
			}
		}
		
		return formattedString;
	},
	
	getKey: function(keyCode) {
		return String.fromCharCode(keyCode);
	},
	
	getKeyCode: function(evt) {
		if (navigator.appName.indexOf("Netscape") != -1) { return evt.which; }
		else { return evt.keyCode; }
	},
	
	isin: function(element, collection) {
		for (var i = 0; i < collection.length; i++) {
			if (element == collection[i]) { return true; }
		}
		
		return false;
	},
	
	isnum: function(chr) {
		if (typeof chr == "number") { return ((chr >= 48) && (chr <= 57)); }
		return ((chr >= '0') && (chr <= '9'));
	},
	
	isFunctionKey: function (chr) {
		return (chr <= 40) ||		// Tudo das setinhas pra trás (incluindo Page Up, Page Down, Home, End, Espaço, ESC, Backspace...)
				(chr == 45) ||		// Insert
				(chr == 46);		// Delete
	},
	
	isInternetExplorer: function () {	// It's a shame we need such method as this...
		return (document.all && !window.opera);
	}
};