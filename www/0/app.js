

function waitForLibrary (whenLoaded) {
	var waitInterval = setInterval(function () {
		if (!window.Library) return;
		clearInterval(waitInterval);
		return whenLoaded();
	}, 25);
}


waitForLibrary(function () {
	
	function initPageManagement () {

		var pageContext = new window.Cores.page.Context();

		var page = window.Cores.page.adapters.page.spin(pageContext);
		var firewidgets = window.Cores.page.adapters.firewidgets.spin(pageContext);
	
		pageContext.on("changed:path", function (path) {
			$('.menu .item[href="' + path + '"]').each(function () {
				var item = $(this);
//				item.tab('change tab', item.attr("data-tab"));
			});
		});
		
		$(function () {
			$('.menu .item[href]').click(function () {
				page.navigateTo($(this).attr("href"));
				return false;
			});
		});
	}


	function initComponents () {
		
		window.Cores.load.adapters.pinf.load(
			"/dist/DependencyVisualization.bundle.js"
		).then(function (container) {

			container.main();

		}).catch(function (err) {
			console.log("ERROR loading components using pinf loader:", err.stack);
		});

		window.Cores.load.adapters.requirejs.load(
			"/dist/DependencyVisualization.amd.js"
		).then(function (container) {

			container.main();

		}).catch(function (err) {
			console.log("ERROR loading components using requirejs loader:", err.stack);
		});

/*
		window.Cores.load.adapters.systemjs.load(
			"/dist/DependencyVisualization.amd.js"
		).then(function (container) {

			container.main();

		}).catch(function (err) {
			console.log("ERROR loading components using systemjs loader:", err.stack);
		});
*/
	}

	initPageManagement();
	initComponents();

});
