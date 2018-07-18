var SnippetPreview = require( "yoastseo" ).SnippetPreview;
var App = require( "yoastseo" ).App;



window.onload = function() {
    var key_en = document.getElementById( "meta-keyword-en" );
    var content_en = document.getElementById( "meta-description-en" );

    var snippetPreview_en = new global_snippet_preview({
        targetElement: document.getElementById( "snippet-en" )
    });


    var app_en = new global_app({
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

    // if(app){
    //     app.refresh();
    // }
    // app_en.refresh();

    key_en.addEventListener( 'change', app_en.refresh.bind( app_en ) );
    content_en.addEventListener( 'change', app_en.refresh.bind( app_en ) );
};