window.onload = function() {

	// bind event listener to click
	document.addEventListener( 'click', respondToClick );
}
var tracheading = document.querySelector('.mainstuff');

function respondToClick() {
	tracheading.className = "invisible";
}
