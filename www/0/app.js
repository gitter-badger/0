

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

		var firewidgets = window.Cores.page.adapters.firewidgets.spin(window._.extend(pageContext, {
			anchors: {
				"page-content": function (context) {

					var uri = "/cores/transform/for/marked/Pages/" + context.getPath().replace(/^\/SemanticUI\//, "") + ".md.htm";

					return window.fetch(uri).then(function(response) {
						return response.text();
					}).then(function (html) {
						return {
							html: html || ""
						};
					});
				}
			}
		}));

		pageContext.on("changed:path", function (path) {
			// TODO: Optionally remember scoll positions of pages and re-apply on nav.
			var navElm = $('.placeholder[data-component-id="navbar"]');
			var navY = navElm.offset().top;
			var docY = $(document).scrollTop();
			if (docY > navY) {
				$(document).scrollTop(navY + 1);
			}
		});
	}


	function initComponents () {

		console.log("init components");

/*		
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
*/

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
