// var SnippetPreview = require( "yoastseo" ).SnippetPreview;
// var App = require( "yoastseo" ).App;
//
// /**
//  * Binds the renewData function on the change of input elements.
//  *
//  * @param {YoastSEO.App} app The YoastSEO.js app.
//  *
//  * @returns {void}
//  */
// var bindEvents = function( app, snippetPreview ) {
// 	var elems = [ "meta-title-vi", "meta-description-vi", "meta-keyword-vi" ];
// 	for ( var i = 0; i < elems.length; i++ ) {
// 		document.getElementById( elems[ i ] ).addEventListener( "input", function() {
//             snippetPreview.setTitle(document.getElementById( "meta-title-vi" ).value);
//             snippetPreview.setUrlPath(document.getElementById( "meta-keyword-vi" ).value);
//             snippetPreview.setMetaDescription(document.getElementById( "meta-description-vi" ).value);
// 			app.refresh();
//
//         } );
// 	}
// };
//
// window.onload = function() {
// 	var snippetPreview = new SnippetPreview( {
// 		targetElement: document.getElementById( "snippet-vi" ),
// 	} );
//
// 	var app = new App( {
// 		snippetPreview: snippetPreview,
// 		targets: {
// 			output: "output-vi",
// 			contentOutput: "contentOutput-vi",
// 		},
// 		callbacks: {
// 			getData: function() {
// 				return {
// 					keyword: document.getElementById( "meta-keyword-vi" ).value,
// 					text: document.getElementById( "meta-description-vi" ).value,
// 				};
// 			},
// 		},
// 	} );
//
// 	bindEvents( app, snippetPreview );
//
// 	app.refresh();
//
// 	// var refreshAnalysis = document.getElementById( "refresh-analysis" );
//     //
// 	// refreshAnalysis.addEventListener( "click", function() {
// 	// 	app.getData();
// 	// 	app.runAnalyzer();
// 	// } );
// };

var SnippetPreview = require( "yoastseo" ).SnippetPreview;
var App = require( "yoastseo" ).App;

window.onload = function() {
    var key_vi = document.getElementById( "meta-keyword-vi" );
    var content_vi = document.getElementById( "meta-description-vi" );
    var key_en = document.getElementById( "meta-keyword-en" );
    var content_en = document.getElementById( "meta-description-en" );

    var snippetPreview = new SnippetPreview({
        targetElement: document.getElementById( "snippet-vi" )
    });
    var snippetPreview_en = new SnippetPreview({
        targetElement: document.getElementById( "snippet-en" )
    });

    var app = new App({
        snippetPreview: snippetPreview,
        targets: {
            output: "output-vi"
        },
        callbacks: {
            getData: function() {
                return {
                    keyword: document.getElementById( "meta-keyword-vi" ).value,
                    text: document.getElementById( "meta-description-vi" ).value
                };
            }
        }
    });

    app.refresh();

    var app_en = new App({
        snippetPreview: snippetPreview_en,
        targets: {
            output: "output-en"
        },
        callbacks: {
            getData: function() {
                return {
                    keyword: document.getElementById( "meta-keyword-en" ).value,
                    text: document.getElementById( "meta-description-en" ).value
                };
            }
        }
    });

    app.refresh();
    app_en.refresh();

    key_vi.addEventListener( 'change', app.refresh.bind( app ) );
    content_vi.addEventListener( 'change', app.refresh.bind( app ) );
    key_en.addEventListener( 'change', app_en.refresh.bind( app_en ) );
    content_en.addEventListener( 'change', app_en.refresh.bind( app_en ) );
};