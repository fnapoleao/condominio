/*----------------------------------------------------------------------------------------------------*/
document.getElementsByClassNameWithParent = function(className, parentNode) {
	var childElements = new Array();
	
	allElements = document.getElementsByClassName(className);
	for(var i=0; i<allElements.length; i++) {
		if(allElements[i].parentNode == $(parentNode))
			childElements.push(allElements[i]);
	}
	return childElements;
}
/*----------------------------------------------------------------------------------------------------*/
function focusFirstInput() {
	if(document.forms[0]) {
		var firstForm = document.forms[0];
		for(var i=0; i<firstForm.length; i++) {
			if(firstForm.elements[i].type == 'text'||firstForm.elements[i].type == 'password') {
				firstForm.elements[i].focus();
				break;
			}
		}
	}
}
/*----------------------------------------------------------------------------------------------------*/
function setInvalidFields(invalidFields) {
	for (var i = 0; i < invalidFields.length; i++) {
		var className = invalidFields[i].indexOf('label') > -1 ? "invalidLabel" : "invalidField"
		var fieldObj = document.getElementById(invalidFields[i]);
		if(fieldObj)
			fieldObj.className = className;
	}
}

/*----------------------------------------------------------------------------------------------------*/
//Implementation of some functions of Prototype 1.4
//$A()
//Enumerable.each()
//Enumerable.findAll()
//document.getElementsByClassName(className, parentName)
function $A(nodeList) {
	var nodeListArray = [];
	for(var i=0; i<nodeList.length; i++) {
		nodeListArray.push(nodeList.item(i));
	}
	return nodeListArray;
}
Array.prototype.each = function(functionToExecute) {
	for(var i=0; i<this.length; i++) {
		functionToExecute(this[i], i);
	}
}
Array.prototype.findAll = function(functionToExecute) {
	var arrayToReturn = [];
	for(var i=0; i<this.length; i++) {
		if(functionToExecute(this[i], i))
			arrayToReturn.push(this[i]);
	}
	return arrayToReturn;
}
document.getElementsByClassName = function(className) {
  var children = document.getElementsByTagName('*') || document.all;
  var elements = new Array();
  for (var i = 0; i < children.length; i++) {
    var child = children[i];
    if(!child) continue;
	if(!child.className) continue;
	if(typeof child.className != 'string') continue;
    var classNames = child.className.split(' ');
    for (var j = 0; j < classNames.length; j++) {
      if (classNames[j] == className) {
        elements.push(child);
        break;
      }
    }
  }
  return elements;
}
/*--------------------------------------------------------------------------------*/
var AUTOCOMPLETE_CLASS_NAME = "autocomplete-field";
var AJAX_BUTTON_CLASS_NAME = "ajax-button";
var lastFocusedAutocompleteField;
var lastKeyPressedWasEnter;

Event.observe(window, 'load', initialize, false);
function initialize() {
	document.getElementsByClassName(AUTOCOMPLETE_CLASS_NAME).each(
		function(value, index) {
			Event.observe(value, 'keypress', preventSubmit, false);
		}
	);
}
/*--------------------------------------------------------------------------------*/
function preventSubmit(e) {
	var pressedKeyCode;
	if (!e) var e = window.event;
	if (e.keyCode) pressedKeyCode = e.keyCode;
	else if (e.which) pressedKeyCode = e.which;
	
	if(pressedKeyCode==Event.KEY_RETURN) {
		Event.stop(e);
		lastKeyPressedWasEnter = true;
	} else {
		lastKeyPressedWasEnter = false;
	}
		
	lastFocusedAutocompleteField = Event.element(e);
}
function isThereASubsequentAJAXButton(referenceField) {
	var nextNode = referenceField;
	while(true) {
		nextNode = nextNode.nextSibling;
		if(!(nextNode && nextNode.tagName))
			continue;
		if(nextNode.tagName.toLowerCase()=='input' || nextNode.tagName.toLowerCase()=='select')
			return false;
		if(Element.hasClassName(nextNode, AJAX_BUTTON_CLASS_NAME))
			return true;
	}
}
/*----------------------------------------------------------------------------------------------------*/
//@Deprecated
function registerEvent(targetId, event, _function) {
	if($(targetId)) {
		if(window.addEventListener) $(targetId).addEventListener(event, _function, false);
		if(window.attachEvent) $(targetId).attachEvent('on'+event, _function);
	}
}
/*----------------------------------------------------------------------------------------------------*/
//@Deprecated
function handleEnter(e) {
	ascii = window.event ? e.keyCode : e.which;
	if(ascii==13) {
		enter_pressed = true;
		if(e.cancelable) e.preventDefault();
		if(window.event) window.event.keyCode = 0;
	} else 
		enter_pressed = false;
}
/*----------------------------------------------------------------------------------------------------*/
function highlightField(field) {
	field.className = "highlight";
}
function unhighlightField(field) {
	field.className = "";
}
function onChange(checkField){
    checkField.value = checkField.checked;
}

function updateSelectAllCheck(checkField, checkUpdateName, sizeCollection){
	for(i=1; i <= sizeCollection; i++){
		var targetUpdateCheck = document.getElementById(checkUpdateName + '_' + i);
		targetUpdateCheck.checked = checkField.checked;
		targetUpdateCheck.value = checkField.checked;
	}
}


function updateSelectAllRadio(checkField, checkUpdateName, sizeCollection){
	for(i=1; i <= sizeCollection; i++) {
		fieldsRadio = document.getElementsByName(checkUpdateName + '_' + i);
		for (var x = 0; x < fieldsRadio.length; x++) {
			if (fieldsRadio[x].value == checkField.value)
				fieldsRadio[x].checked = checkField.checked;
		}
	}
}

function desmarcarRadio(radio){
	radio.checked = false;
}

function onClear(field, targetName){
    var target = document.getElementById(targetName);    
    if(field.value == ''){
        target.value = '';
    }
}

function popupModal(url, title, x, y, urlClose) {
	popupWindowObj = Window.newAjaxWindow("janelaAJAX", url, title, "center", "center", x, y, true, true, true);
	if (urlClose) {
		popupWindowObj.onClose = function () {
			if (typeof Prototype != "undefined") {
				onSuccessFunction = function () {}
				onFailureFunction = function () {}
				
				new Ajax.Request(urlClose, {
						onSuccess: onSuccessFunction,
						onFailure: onFailureFunction
					});
			}
		}
	}
}

function executionArray(functionArray, interval) {
	interval = parseInt(interval) * 1000;
	eval(functionArray[0]);
	for (var i = 1; i < functionArray.length; i++) {
		setTimeout(functionArray[i], interval * i);
	}
}

function authentic(form, applet, fingers, qualities) {
	for(i=0; i < fingers.length; i++){
		finger = fingers[i];
		quality = qualities[i];
		applet += finger;
		if (document.applets[applet]){
			form.elements[finger].value = document.applets[applet].getTemplate();
			form.elements[quality].value = document.applets[applet].getQualityExtraction();
		}
	}
	
	form.submit();
	return true;
}

/*----------------------------------------------------------------------------------------------------*/
Event.observe(window, 'load', focusFirstInput, false);
if(window.attachEvent) window.attachEvent('onload', focusFirstInput);
