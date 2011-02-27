/*--------------------------------------------------*/
function MoreOptionsController() {
	var activeMoreOptionsLink;
	this.showMoreOptions = function(moreOptionsLink) {
		moreOptions = getMoreOptions(moreOptionsLink);
		if(moreOptions) {
			moreOptions.style.display = 'inline';
			moreOptionsLink.parentNode.style.display = 'none';
			if(activeMoreOptionsLink) hideMoreOptions(activeMoreOptionsLink);
			activeMoreOptionsLink = moreOptionsLink;
		}
	};
	function getMoreOptions(moreOptionsLink) {
		if(!moreOptionsLink.parentNode.parentNode) return null;
		moreOptions = document.getElementsByClassNameWithParent('moreOptions', moreOptionsLink.parentNode.parentNode);
		if(!moreOptions.length) return null;
		if(!moreOptions.length==1) return null;
		return moreOptions[0];
	}
	function hideMoreOptions(moreOptionsLink) {
		moreOptions = getMoreOptions(moreOptionsLink);
		if(moreOptions) {
			moreOptions.style.display = 'none';
			moreOptionsLink.parentNode.style.display = 'inline';
		}
	}
}
MoreOptionsController.getInstance = function() {
	if(!this.instance) 
		this.instance = new MoreOptionsController();
		
	return this.instance;
};
/*--------------------------------------------------*/
function duplicateListingStatus() {
		var listingWrapper = document.getElementsByClassName('listing-wrapper')[0];
		var listingStatus = document.getElementsByClassName('listing-status')[0];
		listingWrapper.appendChild(listingStatus.cloneNode(true));
}
if(window.addEventListener) window.addEventListener('load', start, false);
if(window.attachEvent) window.attachEvent('onload', start);

function start() {
	//duplicateListingStatus();
}