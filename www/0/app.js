

function waitForLibrary (whenLoaded) {
	var waitInterval = setInterval(function () {
		if (!window.Library) return;
		clearInterval(waitInterval);
		return whenLoaded();
	}, 25);
}


waitForLibrary(function () {
	
	function initPageManagement () {

		var page = window.Cores.page.spin({});
	
		page.on("changed:path", function (path) {
			$('.menu .item[href="' + path + '"]').each(function () {
				var item = $(this);
				item.tab('change tab', item.attr("data-tab"));
			});
		});
		
		$(function () {
			$('.menu .item[href]').click(function () {
				page.navigateTo($(this).attr("href"));
				return false;
			});
		});
	}

	initPageManagement();

});
