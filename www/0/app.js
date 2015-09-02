

function waitForLibrary (whenLoaded) {
	var waitInterval = setInterval(function () {
		if (!window.Library) return;
		clearInterval(waitInterval);
		return whenLoaded();
	}, 25);
}


waitForLibrary(function () {

	var authContext = new window.Cores.auth.Context();
	var pageContext = new window.Cores.page.Context({
		path: "/SemanticUI/Introduction"
	});


	function initSession () {
	
		authContext.on("changed:authenticated", function (authenticated) {
	
			if (authenticated) {
				pageContext.setViews([
					"loggedin",
					"logout"
				]);

				$('#community-menu').visibility({
					type   : 'fixed',
					offset : 0
				});

			} else {
				pageContext.setViews([
					"loggedout",
					"login"
				]);
			}
		});
		
		authContext.on("redirect", function (url) {
			pageContext.redirectTo(url);
		});

		window.Cores.auth.adapters.passport.spin(authContext);
	}

	function initPageManagement () {

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
			},
			actions: {
				"login": function (context) {
					return window.Promise.try(function () {
						return authContext.login('0', 'github');
					});
				},
				"logout": function (context) {
					return window.Promise.try(function () {
						return authContext.logout('0', 'github');
					});
				}
			}
		}));
		
		
		var mainMenuPinned = null;

		pageContext.on("changed:path", function (path) {
			// TODO: Optionally remember scoll positions of pages and re-apply on nav.
			var menuHeight = $(".main.menu").height();
			var pageContentElm = $("#page-content");
			var pageContentY = pageContentElm.offset().top;
			if (
				mainMenuPinned ||
				/\/Community\//.test(path)
			) {
				$(document).scrollTop(pageContentY - menuHeight * 2);
			}
			$('.main.menu .item').removeClass("active");
			$('.main.menu .item[href="' + path + '"]').addClass("active");
		});

		var onScroll = window._.debounce(function () {
			var isPinned = $(".main.menu").hasClass("fixed");
			if (isPinned !== mainMenuPinned) {
				mainMenuPinned = isPinned;
				if (mainMenuPinned) {
					$("body").addClass("main-menu-pinned");
				} else {
					$("body").removeClass("main-menu-pinned");
				}
			}
		}, 100);
		$(document).on('scroll', onScroll);
		onScroll();

		window.Cores.page.adapters.page.spin(pageContext);
	}

	function initComponents () {

		console.log("init components");


//console.log("window.Library", window.Library);


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

	initSession();
	initPageManagement();
	initComponents();

});
