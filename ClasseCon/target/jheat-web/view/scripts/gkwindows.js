// g0dkar Windozes

String.prototype.trim = function() {
	return this.replace(/^\s+|\s+$/g, '');
}

var Window = {

	// Don't change these...
	windowCount: 0,
	modalWindowCount: 0,
	windowObjects: [],
	zIndexCount: 100,

	// Windows' buttons images
	windowImages: ["view/templates/mainTemplate/pictures/close.gif", "view/templates/mainTemplate/pictures/resize.gif"],
	// Windows' close button tooltip text (please try not to use spaces... it works but Murphy's always near...)
	windowImagesTip: ["Fechar"],
	/*  When you open a modal window, you have to cover everything behind it with a div.
	 *  Here is a default CSS class for the modal cover layer (this is just an example):
	 *
	 *  .modalCover {
	 *		background: #000000 url(blackPixel.gif);
	 *		visibility: hidden;
	 *		filter:progid:DXImageTransform.Microsoft.alpha(opacity=60);	// IE
	 *		opacity: 0.6;
	 *	}
	 *
	 */
	windowModalCoverClass: "modalCover",
	
	// Default values for X, Y, Width and Height
	// If X and Y are set as "center", window will be centered at the screen... obviously...
	defaultX: "center",
	defaultY: "center",
	defaultWidth: 300,
	defaultHeight: 90,
	
	// Minimum values for X, Y, Width and Height (-1 = No limit)
	minimumX: 0,
	minimumY: 0,
	minimumWidth: 200,
	minimumHeight: 90,
	
	// Create the HTML elements for a new window
	createWindow: function (windowID, isModal) {
		if (typeof isModal != "boolean") { isModal = false; }

		var newWindowElement = document.createElement("div");
		newWindowElement.id = windowID;
		newWindowElement.isModal = isModal;
		newWindowElement.className = "gkWindow";
		newWindowElement.style.width = this.minimumWidth + "px";
		newWindowElement.style.position = "absolute";
		newWindowElement.style.left = "0px";
		newWindowElement.style.top = "0px";
		newWindowElement.style.visibility = "hidden";
		newWindowElement.style.zIndex = this.zIndexCount + (isModal ? 5001 : 1);
		this.zIndexCount++;

		var newWindowHTML  = '<div class="gkWindowTitlebar" style="overflow: hidden;">';
			newWindowHTML += 	'Janela <div class="gkWindowCloseButton" style="cursor: pointer;"><img src="' + this.windowImages[0] + '" alt="' + this.windowImagesTip[0] + '" /></div>';
			newWindowHTML += '</div>';
			newWindowHTML += '<div class="gkWindowContent" style="overflow: scroll;"></div>';
			newWindowHTML += '<div class="gkWindowStatusbar" style="overflow: hidden;">';
			newWindowHTML += 	'<div class="gkWindowResize" style="background: transparent url(' + this.windowImages[1] + ') bottom right no-repeat; text-indent: -9999px;">Resize Grip</div>';
			newWindowHTML += '</div>';

		newWindowElement.innerHTML = newWindowHTML;

		document.getElementById("gkWindowsWrapper").appendChild(newWindowElement);

		// For easier access to the windows' divs
		newWindowElementDivs = newWindowElement.getElementsByTagName("div");
		for (var i = 0; i < newWindowElementDivs.length; i++) {
			newWindowElement[newWindowElementDivs[i].className] = newWindowElementDivs[i];
		}

		newWindowElement.gkWindowContent.style.height = this.minimumHeight + "px";

		newWindowElement.gkWindowTitlebar._parent = newWindowElement;
		newWindowElement.gkWindowCloseButton._parent = newWindowElement;
		newWindowElement.gkWindowResize._parent = newWindowElement;

		// Functions for the user to control the window (see documentation for details)
		newWindowElement.setTitle = function (newTitle) { Window.setTitle(this, newTitle); }
		newWindowElement.setVisible = function (isVisible) { Window.setVisible(this, isVisible); }
		newWindowElement.setSize = function (w, h) { Window.setSize(this, w, h); }
		newWindowElement.setPos = function (x, y) { Window.setPos(this, x, y); }
		newWindowElement.setResize = function (isResizable) { Window.setResize(this, isResizable); }
		newWindowElement.setScroll = function (isScrollable) { Window.setScroll(this, isScrollable); }
		newWindowElement.loadContent = function (contentURL) { Window.ajaxLoad(contentURL, this.gkWindowContent); }
		newWindowElement.loadLocalContent = function (contentDivID) { this.gkWindowContent.innerHTML = document.getElementById(contentDivID).innerHTML; }
		newWindowElement.loadCustomContent = function (customContent) { this.gkWindowContent.innerHTML = customContent; }
		newWindowElement.loadHTML = function (codeToLoad) { this.loadCustomContent(codeToLoad); }
		newWindowElement.close = function () { Window.setVisible(this, false); }
		newWindowElement.submitThenClose = function (formID) {
			var formObj = document.getElementById(formID);
			new Ajax.Updater(this.gkWindowContent.id, formObj.getAttribute("action"), {
				parameters: Form.serialize(formObj)
			});
			Window.setVisible(this, false);
		}
		newWindowElement.onClose = function () { return true; }

		newWindowElement.onmousedown = function () {
			this.style.zIndex = Window.zIndexCount + (this.isModal ? 5001 : 1);
			Window.zIndexCount++;
		}
		newWindowElement.gkWindowTitlebar.onmousedown = Window.beginDrag;
		newWindowElement.gkWindowResize.onmousedown = Window.beginDrag;
		newWindowElement.gkWindowCloseButton.onclick = function () { this._parent.setVisible(false); }

		this.windowObjects[this.windowObjects.length] = newWindowElement;
		this.windowCount++;

		return newWindowElement;

	},
	
	setModalCover: function (isCoverVisible) {
		var modalCover = document.getElementById("gkWindowModalCover");

		if (typeof isCoverVisible != "boolean") { isCoverVisible = false; }
		
		// Gambiarra for I.E.
		if (Window.isInternetExplorer()) {
			var selectElements = document.getElementsByTagName("select");
			for (var i = 0; i < selectElements.length; i++) {
				selectElements[i].style.display = (isCoverVisible ? "none" : "inline");
			}
		}

		if (isCoverVisible) {
			modalCover.style.position = "absolute";
			modalCover.style.left = "0px";
			modalCover.style.top = "0px";
			modalCover.style.width = Window.getFullWidth() + "px";
			modalCover.style.height = Window.getFullHeight() + "px";
			modalCover.style.display = "block";
			modalCover.style.visibility = "visible";
			if (!modalCover.isInitialized) {
				modalCover.style.zIndex = Window.zIndexCount + 5000;
				Window.zIndexCount++;
				modalCover.isInitialized = true;
			}
		}
		else {
			modalCover.style.visibility = "hidden";
			modalCover.style.display = "none";
		}
	},
	
	// Create a window whose content will be loaded via Ajax
	newAjaxWindow: function (windowID, windowContent, windowTitle, X, Y, W, H, resizable, scrollable, modal) {
		if (typeof X == "undefined") { X = "center"; }
		if (typeof Y == "undefined") { Y = "center"; }
		if (typeof W == "undefined") { W = Window.minimumWidth; }
		if (typeof H == "undefined") { H = Window.minimumHeight; }
		if (typeof resizable != "boolean") { resizable = true; }
		if (typeof scrollable != "boolean") { scrollable = true; }
		if (typeof modal != "boolean") { modal = false; }
		
		var newWindow = this.createWindow(windowID, modal);
		
		newWindow.setTitle(windowTitle);
		newWindow.setSize(W, H);
		newWindow.setPos(X, Y);
		newWindow.setResize(resizable);
		newWindow.setScroll(scrollable);

		newWindow.setVisible(true);
		newWindow.loadContent(windowContent);
		
		return newWindow;
	},
	
	// Create a window whose content will be periodically updated via Ajax
	newPeriodicalUpdateWindow: function (windowID, windowContent, updateTime, windowTitle, X, Y, W, H, resizable, scrollable, modal) {
		// TODO
	},
	
	// Create a window whose content will be a hidden div on the page
	newDivWindow: function (windowID, contentDivID, windowTitle, X, Y, W, H, resizable, scrollable, modal) {
		if (typeof X == "undefined") { X = "center"; }
		if (typeof Y == "undefined") { Y = "center"; }
		if (typeof W == "undefined") { W = Window.minimumWidth; }
		if (typeof H == "undefined") { H = Window.minimumHeight; }
		if (typeof resizable != "boolean") { resizable = true; }
		if (typeof scrollable != "boolean") { scrollable = true; }
		if (typeof modal != "boolean") { modal = false; }

		var newWindow = this.createWindow(windowID, modal);
		
		newWindow.setTitle(windowTitle);
		newWindow.setSize(W, H);
		newWindow.setPos(X, Y);
		newWindow.setResize(resizable);
		newWindow.setScroll(scrollable);
		newWindow.loadLocalContent(contentDivID);
		newWindow.setVisible(true);
		
		return newWindow;
	},
	
	newAjaxModalWindow: function (windowID, windowContent, windowTitle, X, Y, W, H, resizable, scrollable) {
		return newAjaxWindow(windowID, windowContent, windowTitle, X, Y, W, H, resizable, scrollable, true);
	},
	
	newPeriodicalUpdateModalWindow: function (windowID, windowContent, updateTime, windowTitle, X, Y, W, H, resizable, scrollable) {
		return newAjaxWindow(windowID, windowContent, windowTitle, X, Y, W, H, resizable, scrollable, true);
	},
	
	newDivModalWindow: function (windowID, contentDivID, windowTitle, X, Y, W, H, resizable, scrollable) {
		return newDivWindow(windowID, windowContent, windowTitle, X, Y, W, H, resizable, scrollable, true);
	},
	
	setTitle: function (windowObj, newTitle) {
		windowObj.gkWindowTitlebar.firstChild.nodeValue = (newTitle.trim().length > 0 ? newTitle.trim() : 'Janela');
	},
	
	createAjaxWindowLink: function (linkID, X, Y, W, H, isModal) {
		var linkElement = document.getElementById(linkID);
		linkElement.setAttribute("rev", linkElement.getAttribute("href"));
		linkElement.setAttribute("href", "/");
		
		if (typeof isModal != "boolean") { isModal = false; }
		if (typeof X == "undefined") { X = "center"; }
		if (typeof Y == "undefined") { Y = "center"; }
		if (typeof W == "undefined") { W = Window.minimumWidth; }
		if (typeof H == "undefined") { H = Window.minimumHeight; }
		
		linkElement.onclick = function () {
			if (Window.findWindowById(linkID + "Window")) { Window.findWindowById(linkID + "Window").setVisible(true); }
			else { Window.newAjaxWindow(linkID + "Window", linkElement.getAttribute("rev"), linkElement.getAttribute("title"), X, Y, W, H, true, true, isModal); }
			return false;
		}
	},
	
	createDivWindowLink: function (linkID, X, Y, W, H, isModal) {
		var linkElement = document.getElementById(linkID);
		linkElement.setAttribute("rev", linkElement.getAttribute("href"));
		linkElement.setAttribute("href", "/");
		
		if (typeof isModal != "boolean") { isModal = false; }
		if (typeof X == "undefined") { X = "center"; }
		if (typeof Y == "undefined") { Y = "center"; }
		if (typeof W == "undefined") { W = Window.minimumWidth; }
		if (typeof H == "undefined") { H = Window.minimumHeight; }
		
		linkElement.onclick = function () {
			if (Window.findWindowById(linkID + "Window")) { Window.findWindowById(linkID + "Window").setVisible(true); }
			else { Window.newDivWindow(linkID + "Window", linkElement.getAttribute("rel"), linkElement.getAttribute("title"), X, Y, W, H, true, true, isModal); }
			return false;
		}
	},
	
	createAjaxModalWindowLink: function (linkID, X, Y, W, H) {
		this.createAjaxWindowLink(linkID, X, Y, W, H, true);
	},
	
	createDivModalWindowLink: function (linkID, X, Y, W, H) {
		this.createDivWindowLink(linkID, X, Y, W, H, true);
	},
	
	setPos: function (windowObj, X, Y) {
		if (X == "center") { X = (this.getFullWidth() - windowObj.offsetWidth) / 2; }
		else { X = parseInt(X); }
		if (Y == "center") { Y = (this.getVisibleHeight() - windowObj.offsetHeight) / 2; }
		else { Y = parseInt(Y); }

		windowObj.style.left = parseInt(Math.max(this.minimumX, X)) + "px";
		windowObj.style.top = parseInt(Math.max(this.minimumY, Y)) + "px";
	},
	
	setSize: function (windowObj, W, H) {
		windowObj.width = Math.min(Math.max(this.minimumWidth, parseInt(W)), this.getFullWidth()) + "px";
		windowObj.style.width = windowObj.width;
		windowObj.gkWindowContent.style.height = Math.max(this.minimumHeight, parseInt(H)) + "px";
	},
	
	setResize: function (windowObj, isResizable) {
		windowObj.gkWindowStatusbar.style.display = (isResizable ? "block" : "none");
	},
	
	setScroll: function (windowObj, isScrollable) {
		windowObj.gkWindowContent.style.overflow = (isScrollable ? "auto" : "hidden");
	},
	
	setVisible: function (windowObj, isVisible) {
		windowObj.style.visibility = (isVisible ? "visible" : "hidden");
		windowObj.style.display = (isVisible ? "block" : "none");
		windowObj.gkWindowContent.style.display = (isVisible ? "block" : "none");
		
		if (!isVisible) { windowObj.onClose(); }
		
		if (windowObj.isModal) {
			if (isVisible) {
				Window.setModalCover(true);
				Window.modalWindowCount++;
			}
			else {
				Window.modalWindowCount--;
				if (Window.modalWindowCount <= 0) { Window.setModalCover(false); }
			}
		}
	},
	
	isInternetExplorer: function () {	// It's a shame we need such method as this...
		return (document.all && !window.opera);
	},
	
	getDocumentBody: function () {
		return ((document.compatMode == "CSS1Compat") ? document.documentElement : document.body);
	},
	
	getFullWidth: function () {
		return (this.isInternetExplorer() ? this.getDocumentBody().clientWidth : window.innerWidth);
	},
	
	getVisibleHeight: function () {
		return (this.isInternetExplorer() ? this.getDocumentBody().clientHeight : window.innerHeight);
	},
	
	getFullHeight: function () {
		return ((this.getDocumentBody().offsetHeight > this.getDocumentBody().scrollHeight) ? this.getDocumentBody().offsetHeight : this.getDocumentBody().scrollHeight);
	},
	
	beginDrag: function (senderElement) {
		var draggingWindow = this._parent;

		Window.draggingTarget = this;
		senderElement = window.event || senderElement;

		Window.initMousePosX = senderElement.clientX;
		Window.initMousePosY = senderElement.clientY;
		Window.initPosX = parseInt(draggingWindow.offsetLeft);
		Window.initPosY = parseInt(draggingWindow.offsetTop);
		Window.initWidth = parseInt(draggingWindow.offsetWidth);
		Window.initHeight = parseInt(draggingWindow.gkWindowContent.offsetHeight);

		document.onmousemove = Window.dragMovement;
		document.onmouseup = Window.endDrag;

		return false;
	},
	
	dragMovement: function (senderElement) {
		var draggingWindow = Window.draggingTarget;
		var senderElement = window.event || senderElement;

		Window.mouseMovementX = senderElement.clientX - Window.initMousePosX;
		Window.mouseMovementY = senderElement.clientY - Window.initMousePosY;

		if (draggingWindow.className == "gkWindowTitlebar") { Window.setPos(draggingWindow._parent, Window.mouseMovementX + Window.initPosX, Window.mouseMovementY + Window.initPosY); }
		else if (draggingWindow.className == "gkWindowResize") { Window.setSize(draggingWindow._parent, Window.initWidth + Window.mouseMovementX, Window.initHeight + Window.mouseMovementY); }

		return false;
	},
	
	endDrag: function () {
		document.onmousemove = null;
		document.onmouseup = null;
		Window.draggingTarget = null;
	},
	
	destroy: function () {
		for (var i = 0; i < Window.windowObjects.length; i++) {
			Window.windowObjects[i].gkWindowTitlebar._parent = null;
			Window.windowObjects[i].gkWindowCloseButton._parent = null;
			Window.windowObjects[i].gkWindowResize._parent = null;
		}
		
		window.onload = null;
	},
	
	findWindowById: function (windowID) {
		for (var i = 0; i < Window.windowObjects.length; i++) {
			if (Window.windowObjects[i].id == windowID) {
				return Window.windowObjects[i];
			}
		}
		
		return null;
	},
	
	ajaxLoad: function (pageToLoad, containerObj) {
		if (typeof Prototype != "undefined") {
			containerObj.innerHTML = "Carregando...";
			
			onSuccessFunction = function (response) { containerObj.innerHTML = response.responseText; }
			onFailureFunction = function () { containerObj.innerHTML = "Erro ao requisitar página."; }
			
			new Ajax.Request(pageToLoad, {
					onSuccess: onSuccessFunction,
					onFailure: onFailureFunction
				});
		}
	}
	
};

document.write('<div id="gkWindowModalCover" class="' + Window.windowModalCoverClass + '"></div><div id="gkWindowsWrapper"></div>');
window.onunload = Window.destroy;