/**
 * @license Copyright (c) 2003-2015, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

 CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';

	config.filebrowserBrowseUrl = webRoot + 'web/ckeditors/ckfinder/ckfinder.html';
	config.filebrowserImageBrowseUrl = webRoot + 'web/ckeditors/ckfinder/ckfinder.html?type=Images';
	config.filebrowserFlashBrowseUrl = webRoot + 'web/ckeditors/ckfinder/ckfinder.html?type=Flash';
	config.filebrowserUploadUrl = webRoot + 'web/ckeditors/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files';
	config.filebrowserImageUploadUrl = webRoot + 'web/ckeditors/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Images';
	config.filebrowserFlashUploadUrl = webRoot + 'web/ckeditors/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Flash';
};
