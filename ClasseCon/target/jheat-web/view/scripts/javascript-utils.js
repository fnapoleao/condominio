/**
 * JHEAT: USEFULL FUNCTIONS FOR THE SITE.
 */

//Submits a Master Detail form.
function submitMasterDetailForm(fieldsNames, divName, url) {
	var parameters = new Array(fieldsNames.length);
	var parameterValues = "";

	for(i=0; i < fieldsNames.length; i++){
		if(fieldsNames[i].indexOf("MasterDetailField") != -1){
			var fieldName = fieldsNames[i].toString().replace("MasterDetailField", "");
			var field = document.getElementById(fieldsNames[i]);		
			var fieldArray = new Array(fieldName, field.value);
			parameters[i] = fieldArray;
			parameterValues += "&"+fieldName+"="+field.value;
		}
	}
	JHeat.ajaxList(divName, url+parameterValues);
}

//Rounds a number.
function roundNumber(numberField) {
	var rlength = 2; // The number of decimal places to round to
	var newnumber = Math.round(numberField.value*Math.pow(10,rlength))/Math.pow(10,rlength);
	newnumber = newnumber.toString().replace( ".", "," );
	numberField.value = newnumber;
}

//Submits a form and put the given action name in it.
function submitForm(action){
	document.forms[1].action.value=action;
}
	
//Adds the website to the client fivorites.
function addToFavorites(){
	var bookmarkurl=document.location;
	var bookmarktitle=document.title;

	if(navigator.appName == "Netscape"){
		alert("Para adicionar este site aos Favoritos: \n - Clique em OK \n - Pressione CTRL e a letra D");
	}
	else{
		if (document.all){
			window.external.AddFavorite(bookmarkurl,bookmarktitle);
		}
	}
}

//Switches from a div to another.
function switchDiv(item){
	subMenu = document.getElementById(item);
	if (subMenu != null) {
		if(subMenu.style.display == "block" || subMenu.style.display == null){
			subMenu.style.display = "none";
		}
		else {
			subMenu.style.display = "block";
		}
	}
}

//Script for the for the masks.
function txtBoxFormat(obj, sMask, evtKeyPress) {
	
    var i, nCount, sValue, fldLen, mskLen,bolMask, sCod, nTecla;

	nTecla = evtKeyPress.keyCode ? evtKeyPress.keyCode : evtKeyPress.which ? evtKeyPress.which : evtKeyPress.charCode;
    sValue = obj.value;
    mskLen = sMask.length;
    
    //46 DELETE
    if (sValue.length >= sMask.length && (nTecla != 8 && nTecla != 9 && nTecla != 13 && nTecla != 46)) {
    	return false;
    }

	while (sValue.toString().indexOf('-') > -1 || sValue.toString().indexOf('.') > -1 
			|| sValue.toString().indexOf('/') > -1 || sValue.toString().indexOf('(') > -1
			|| sValue.toString().indexOf(')') > -1 || sValue.toString().indexOf(' ') > -1
			|| sValue.toString().indexOf(',') > -1 || sValue.toString().indexOf(':') > -1) {
	    sValue = sValue.toString().replace( "-", "" );
	    sValue = sValue.toString().replace( ".", "" );
	    sValue = sValue.toString().replace( "/", "" );
	    sValue = sValue.toString().replace( "(", "" );
	    sValue = sValue.toString().replace( ")", "" );
	    sValue = sValue.toString().replace( " ", "" );
	    sValue = sValue.toString().replace( ",", "" );
	    sValue = sValue.toString().replace( ":", "" );
    }

    fldLen = sValue.length;

    i = 0;
    nCount = 0;
    sCod = "";
    mskLen = fldLen;
	
    while (i <= mskLen) {
    	bolMask = ((sMask.charAt(i) == "-") || (sMask.charAt(i) == ".") || (sMask.charAt(i) == "/"))
        bolMask = bolMask || ((sMask.charAt(i) == "(") || (sMask.charAt(i) == ")") || (sMask.charAt(i) == " ") || (sMask.charAt(i) == ",") || (sMask.charAt(i) == ":"))

        if (bolMask) {
        	sCod += sMask.charAt(i);
	        mskLen++; 
        }
        else {
        	sCod += sValue.charAt(nCount);
            nCount++;
       }
       i++;
    }

    if (nTecla == 8) { // backspace
		obj.value = obj.value.substr(0, obj.value.length);
		return true;
    }

    obj.value = sCod;
    
    if (nTecla == 32) { // space
		return true;
    }

    if (nTecla == 9) { // tab
    	return true;	
    }

    if (nTecla == 13) { // enter
    	return true;	
    }

	if (sMask.charAt(i-1) == "9") { // apenas números...
    	return ((nTecla > 47) && (nTecla < 58)); // números de 0 a 9
   	}
   	 
    else if (sMask.charAt(i-1) == "0") { // apenas letras...
    	return ((nTecla >= 65) && (nTecla <= 90)) || ((nTecla >= 94) && (nTecla <= 122) && (nTecla != 95)) || (nTecla == 231) || (nTecla == 199);
	}

    else { // qualquer caracter...
    	return true;
    }
}

function openWindow(url){
	window.open(url, "newWindow", "fullscreen=no,toolbar=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,directories=no,location=no,width=800,height=600,left=0,top=0");
}
   
var variavel;
var col=255;

//Makes the div display event more soft.
function switchSoftly(obj) {
	elemento = document.getElementById(obj);
	elemento.style.color="rgb(" + col + "," + col + "," + col + ")";
	col-=5;
	if (col>0)
		variavel = setTimeout('suavizar("'+obj+'")', 10);
	else {
		clearTimeout(variavel);
		col=255;
	}
}
	
function verificarCPF(c){
	var i; 
	s = c;
	var c = s.substr(0,9); 
	var dv = s.substr(9,2); 
	var d1 = 0; 
	var v = false;
	for (i = 0; i < 9; i++) { 
		d1 += c.charAt(i)*(10-i); 
	} 
	if (d1 == 0){ 
		alert("CPF Inv?lido")
		v = true; 
		return false; 
	} 
	d1 = 11 - (d1 % 11); 
	if (d1 > 9) d1 = 0; 
	if (dv.charAt(0) != d1) { 
		alert("CPF Inv?lido") 
		v = true;
		return false; 
	} 

	d1 *= 2; 
	for (i = 0; i < 9; i++) { 
		d1 += c.charAt(i)*(11-i); 
	} 
	d1 = 11 - (d1 % 11); 
	if (d1 > 9) d1 = 0; 
	if (dv.charAt(1) != d1) { 
		alert("O CPF digitado ? inv?lido.") 
		v = true;
		return false; 
	} 
	if (!v) {
		//alert(c + "\nCPF V?lido") 
	}
}  