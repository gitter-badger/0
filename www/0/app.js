
const PAGE = window.Library.PAGE;




var PATHNAME = window.location.pathname;

console.log("PATHNAME", PATHNAME);


PAGE('*', function load(ctx) {
	try {

console.log("CTX.path", ctx.path);
console.log("CTX.pathname", ctx.pathname);
console.log("CTX.hash", ctx.hash);

/*
		var pathname = ctx.pathname;
//debugger;
//console.log("ON PAGE CHANGE ctx", ctx);

		// IE Fix
		if (
			pathname !== PATHNAME &&
			pathname.indexOf("#") === -1
		) {
			pathname = PATHNAME + "#" + pathname.substring(1);
		}

//console.log("pathname1: " + pathname);

		var view = pathname.replace(PATHNAME, "").replace(/^#/, "");

//console.log("view: " + view);
//console.log("pathname2: " + pathname);
		if (
			/^\//.test(view) &&
			appContext.get('lockedView') &&
			view !== appContext.get('lockedView') &&
			appContext.get('lockedView').split(",").indexOf(view) === -1
		) {
//console.log("REDIRECT TO", window.location.origin + view);
			// We are selecting a new view and updating the URL using a REDIRECT which
			// loads the new page from the server.

			// NOTE: This will not work if only the Hash changes.
			//       In those cases you need to redirect to a new URL.
			window.location.href = appContext.get("windowOrigin") + view;
		} else {
//console.log("SET VIEW", view);

			// We are selecting a new view and updating the URL using PUSH-STATE
			// without reloading the page.

			appContext.set('selectedView', view);
		}
*/		
	} catch (err) {
		console.error("page changed error:", err.stack);
	}
});

PAGE({
	popstate: false,
	click: false
});


//PAGE.show("Introduction");


