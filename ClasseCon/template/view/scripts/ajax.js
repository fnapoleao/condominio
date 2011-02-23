function JHeat() {}

function $(name) {
	return document.getElementById(name);
}
 
JHeat.ajaxSetBody = function(data) {
	var spanObjectName = "view" + data[0];
	DWRUtil.setValue(spanObjectName, data[1]);
	DWRUtil.showById(spanObjectName);
}

JHeat.showAjaxItems = function(data) {
	DWRUtil.setValue(data[0], data[1]);
	DWRUtil.showById(data[0]);
}

JHeat.addAjaxItem = function(fields, url) {
    var id = fields[1] + "collection";
	var parameters = new Array(fields.length);
	for(i=0; i < fields.length; i++){
		var field = $(fields[i]);
		if (field) {
			if ((field.type == 'radio') || (field.type == 'checkbox') || (field.type == 'hidden')) {
				elementos = document.getElementsByName(field.name);
				for (var x = 0; x < elementos.length; x++) {
					elemento = elementos[x];
					if (elemento.type == 'hidden' || elemento.checked) { url += "&" + fields[i] + "=" + elemento.value; }
				}
			}
			else { 
				url += "&" + fields[i] + "=" + field.value; 
			}
		}
	}
	DWREngine._execute(contextName+'/dwr/', 'AjaxLoader', 'loadList', id, url, JHeat.showAjaxItems);
}

JHeat.sendFormTo = function(fields, url, target) {
    var divName = "view" + target;
    DWRUtil.setValue(divName, "");
    DWRUtil.showById(divName);
	for (i = 0; i < fields.length; i++){
		var field = $(fields[i]);
		if (field) {
			var elementos = null, elemento = null;
			if ((field.type == 'radio') || (field.type == 'checkbox') || (field.type == 'hidden')) {
				elementos = document.getElementsByName(field.name);
				for (var x = 0; x < elementos.length; x++) {
					elemento = elementos[x];
					if (elemento.type == 'hidden' || elemento.checked) { url += "&" + fields[i] + "=" + elemento.value; }
				}
			}
			else { 
				url += "&" + fields[i] + "=" + field.value; 
			}
		}
	}
	DWREngine._execute(contextName+'/dwr/', 'AjaxLoader', 'loadList', target, url, JHeat.ajaxSetMore);
}

JHeat.sendFormToPlus = function(url, target) {
    var divName = "view" + target;
    DWRUtil.setValue(divName, "");
    DWRUtil.showById(divName);
	DWREngine._execute(contextName+'/dwr/', 'AjaxLoader', 'loadList', target, url, JHeat.ajaxSetMore);
}

JHeat.removeAjaxItem = function(field, url) {
    var id = field + "collection";
	DWREngine._execute(contextName+'/dwr/', 'AjaxLoader', 'loadList', id, url, JHeat.showAjaxItems);
}

JHeat.clearFields = function(fields, booleans,combos, collections, fieldCollections) {
	for(i=0; i < fields.length; i++){
		var field = $(fields[i]);
		if(field){
			field.value = "";
			field.rawText = "";
		}
	}
	
	for(i=0; i < booleans.length; i++){
		var bool = $(booleans[i]);	
		if(bool){	
			bool.checked = false;
			bool.value = bool.checked;
		}
	}
	
	for(i=0; i < combos.length; i++){
		var combo = $(combos[i]);
		if(combo){
			combo.selectedIndex = 0;
		}
	}	
	
	for(i=0; i < collections.length; i++){
	    var divName = "view" + collections[i];
		var col = $(divName);
		if(col){
		    DWRUtil.setValue(divName, "");
		    DWRUtil.showById(divName);
		}
	}

	for(i=0; i < fieldCollections.length; i++){
		var divName =  fieldCollections[i] + "collection";
		var col = $(fieldCollections[i]);
		if(col){
		    DWRUtil.setValue(divName, "");
		    DWRUtil.showById(divName);
		}
	}
}

JHeat.addObject = function(fields, collection, url) {
    var id = "view" + collection;
	var parameters = new Array(fields.length);
	for(i=0; i < fields.length; i++){
		var field = $(fields[i]);
		if(field) {
			if ((field.type == 'radio') || (field.type == 'checkbox') || (field.type == 'hidden')) {
				elementos = document.getElementsByName(field.name);
				for (var x = 0; x < elementos.length; x++) {
					elemento = elementos[x];
					if (elemento.type == 'hidden' || elemento.checked) { url += "&" + fields[i] + "=" + elemento.value; }
				}
			}
			else { 
				url += "&" + fields[i] + "=" + field.value; 
			}
		}
	}
	DWREngine._execute(contextName+'/dwr/', 'AjaxLoader', 'loadList', id, url, JHeat.showAjaxItems);
}

JHeat.deleteObject = function(collection, field, url) {
    var id = "view" + collection;	
	DWREngine._execute(contextName+'/dwr/', 'AjaxLoader', 'loadList', id, url, JHeat.showAjaxItems);
}

JHeat.refreshObjects = function(collection, field, url) {
    var id = "view" + collection;	
	DWREngine._execute(contextName+'/dwr/', 'AjaxLoader', 'loadList', id, url, JHeat.showAjaxItems);
}

JHeat.ajaxSetMore = function(data) {
	var spanObjectName = "view"+data[0];
	DWRUtil.setValue(spanObjectName, data[1]);
	DWRUtil.showById(spanObjectName);
}

JHeat.ajaxReadPlus = function(id, mapeamento) {
	var spanObjectName = "view"+id;
	var lineSpan = id + "table"
		
	var texto = DWRUtil.getValue(spanObjectName);
	// setApellationMode(true);
	while ((texto.charCodeAt(0) < 32) && (texto.length >= 0)) { texto = texto.substring(1, texto.length); }

	if (texto == "") {
		DWREngine._execute(contextName+'/dwr/', 'AjaxLoader', 'loadList', id, mapeamento, JHeat.ajaxSetMore);
	} else {
		DWRUtil.setValue(spanObjectName, "");
		DWRUtil.toggleDisplay(spanObjectName);
 	}

	if(DWRUtil.getValue(lineSpan) != null){
		if (DWRUtil.getValue(lineSpan) == ""){
			DWRUtil.showById(lineSpan);
		}else{
			DWRUtil.toggleDisplay(lineSpan);
		}
	}	
}

JHeat.ajaxReadDetails = function(classe,id, mapeamento) {
	
	var spanObjectName = "view"+ classe +id;
	var lineSpan = classe + id + "table"
	if (DWRUtil.getValue(spanObjectName) == "") {
		DWREngine._execute(contextName+'/dwr/', 'AjaxLoader', 'loadList', classe + id, mapeamento, JHeat.ajaxSetMore);
	} else {
		DWRUtil.setValue(spanObjectName, "");
		DWRUtil.toggleDisplay(spanObjectName);
 	}

	if(DWRUtil.getValue(lineSpan) != null){
		if (DWRUtil.getValue(lineSpan) == ""){
			DWRUtil.showById(lineSpan);
		}else{
			DWRUtil.toggleDisplay(lineSpan);
		}
	}
 	
}

JHeat.ajaxRead = function(id, mapeamento) {
	
	var spanObjectName = "view"+id;
	if(document.getElementById(spanObjectName)){
		if (DWRUtil.getValue(spanObjectName) == "") {
			DWREngine._execute(contextName+'/dwr/', 'AjaxLoader', 'loadList', id, mapeamento, JHeat.ajaxSetMore);
		} else {
			DWRUtil.toggleDisplay(spanObjectName);
	 	}
	 }
}

JHeat.GetBody = function(id,mapeamento) {
	DWREngine._execute(contextName+'/dwr/', 'AjaxLoader', 'getBody', id,mapeamento, JHeat.ajaxSetBody);
}

JHeat.ajaxList = function(id, mapeamento) {
	DWREngine._execute(contextName+'/dwr/', 'AjaxLoader', 'loadList', id, mapeamento, JHeat.ajaxSetMore);
}

JHeat.nullCallback = function () { }
JHeat.selectObject = function(url) {
	DWREngine._execute(contextName + '/dwr', 'AjaxLoader', 'getBody', '', url, JHeat.nullCallback);
}

JHeat.validateProperty = function(oldValue, newValue, url) {
	oldField = document.getElementById(oldValue);
	newField = document.getElementById(newValue);
	if (oldField.value != newField.value) {
		url += "&" + newValue + "=" + newField.value; 
		DWREngine._execute(contextName+'/dwr/', 'AjaxLoader', 'invokeValidateProperty', url, JHeat.showMessage);
	}
}

JHeat.showMessage = function(data) {
	if (data) {
		alert(data);
	}
}
