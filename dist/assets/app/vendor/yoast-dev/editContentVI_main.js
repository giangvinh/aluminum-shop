var Researcher = require( "yoastseo" ).Researcher;
var Paper = require( "yoastseo" ).Paper;
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