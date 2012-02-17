/*
 * jquery.suggest
 * Auto-suggestion plugin for textbox that filters and
 * return matching data entity within a given object dataset.
 *
 * Copyright (c) 2011 Jason Ramos
 * www.stackideas.com
 *
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 *
 */

$.module('suggest', function() {

	var module = this;

	$.require
	 .library(
	 	'lookup',
	 	'ui/core',
	 	'ui/position'
	 )
	 .template(
	 	'suggest/contextmenu',
	 	'suggest/contextmenu.item'
	 )
	 .done(function(){

	 	var exports = function() {
