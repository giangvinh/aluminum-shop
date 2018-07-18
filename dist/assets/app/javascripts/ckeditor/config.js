/**
 * @license Copyright (c) 2003-2018, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	config.language = 'vi';
	// config.uiColor = '#AADC6E';
    // config.extraPlugins = 'imagebrowser';
    config.filebrowserUploadMethod = 'form';
    config.extraPlugins =  'imagebrowser,html5video';
    if(window.location.port == 0 || window.location.port.length == 0){
        config.imageBrowser_listUrl = window.location.protocol+"//"+window.location.hostname+"/admin/utility/getImageList";
    }else {
        config.imageBrowser_listUrl = window.location.protocol+"//"+window.location.hostname+":"+window.location.port+"/admin/utility/getImageList";

    }



};
