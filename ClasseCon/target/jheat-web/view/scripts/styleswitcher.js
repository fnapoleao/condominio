/*--------------------------------------------------------------------------------
      Code based on 'Alternative Style: Working With Alternate Style Sheets',
       from A List Apart, in http://www.alistapart.com/articles/alternate/
--------------------------------------------------------------------------------*/

function setActiveStyleSheet(title) {
  var i, a, main;
  for(i=0; (a = document.getElementsByTagName("link")[i]); i++) {
    if(a.getAttribute("rel").indexOf("style") != -1 && a.getAttribute("title")) {
      a.disabled = true;
      if(a.getAttribute("title") == title) a.disabled = false;
    }
  }
  setActiveSwitcher(title);
}
/*--------------------------------------------------------------------------------*/
function setActiveSwitcher(title) {
	if(!$('style-switchers')) return;
	var switchers, i;
	switchers = $('style-switchers').childNodes;
	for(i=0; i<switchers.length; i++) {
		if(!switchers[i].className) continue;
		if(Element.hasClassName(switchers[i], 'selected')) Element.removeClassName(switchers[i], 'selected');
		if(switchers[i].title==title) Element.addClassName(switchers[i], 'selected');
	}
}
/*--------------------------------------------------------------------------------*/
function getActiveStyleSheet() {
  var i, a;
  for(i=0; (a = document.getElementsByTagName("link")[i]); i++) {
    if(a.getAttribute("rel").indexOf("style") != -1 && a.getAttribute("title") && !a.disabled) return a.getAttribute("title");
  }
  return null;
}
/*--------------------------------------------------------------------------------*/
function getPreferredStyleSheet() {
  var i, a;
  for(i=0; (a = document.getElementsByTagName("link")[i]); i++) {
    if(a.getAttribute("rel").indexOf("style") != -1
       && a.getAttribute("rel").indexOf("alt") == -1
       && a.getAttribute("title")
       ) return a.getAttribute("title");
  }
  return null;
}
/*--------------------------------------------------------------------------------*/
function createCookie(name,value,days) {
  if (days) {
    var date = new Date();
    date.setTime(date.getTime()+(days*24*60*60*1000));
    var expires = "; expires="+date.toGMTString();
  }
  else expires = "";
  document.cookie = name+"="+value+expires+"; path=/";
}
/*--------------------------------------------------------------------------------*/
function readCookie(name) {
  var nameEQ = name + "=";
  var ca = document.cookie.split(';');
  for(var i=0;i < ca.length;i++) {
    var c = ca[i];
    while (c.charAt(0)==' ') c = c.substring(1,c.length);
    if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
  }
  return null;
}
/*--------------------------------------------------------------------------------*/
function initTheme() {
  var cookie = readCookie("style");
  var title = cookie ? cookie : getPreferredStyleSheet();
  setActiveStyleSheet(title);
}
/*--------------------------------------------------------------------------------*/
function persistStyle() {
  var title = getActiveStyleSheet();
  createCookie("style", title, 365);
}
/*--------------------------------------------------------------------------------*/ 
cookie = readCookie("style");
title = cookie ? cookie : getPreferredStyleSheet();
/*--------------------------------------------------------------------------------*/
window.onunload = persistStyle;