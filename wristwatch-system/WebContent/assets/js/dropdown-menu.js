function showMenuEvent(menu, options){
	menu.addEventListener("click", function() {
		options.style.display = 'block';
	});
}

function dropDownMenu() {
	
	var menu, i, menuOptions;
	menu = document.getElementsByClassName("dropdown-toggle");
	menuOptions = document.getElementsByClassName("dropdown-menu");
	for(i = 0; i < menu.length; i++){
		showMenuEvent(menu[i], menuOptions[i]);
	}
	
}

window.onload = function () {
	
	dropDownMenu();

	window.onclick = function (event) {

		if (!event.target.matches('.dropdown-toggle')) {
			var dropdowns = document.getElementsByClassName("dropdown-menu");
			var i;
			for (i = 0; i < dropdowns.length; i++) {
			var openDropdown = dropdowns[i];
			openDropdown.style.display = 'none';
			}
		}
	}

}