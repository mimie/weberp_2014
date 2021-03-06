<?php

/* $Id: LanguageSetup.php 4746 2011-11-16 07:04:20Z daintree $ */

/* Set internal character encoding to UTF-8 */
mb_internal_encoding('UTF-8');

/* This file is included in session.inc or PDFStarter.php or a report script that does not use PDFStarter.php
to check for the existance of gettext function and setup the necessary enviroment to allow for automatic translation

Set language - defined in config.php or user variable when logging in (session.inc)
NB this language must also exist in the locale on the web-server
normally the lower case two character country code underscore uppercase
2 character country code does the trick  except for en !!*/


If (isset($_POST['Language'])) {
	$_SESSION['Language'] = $_POST['Language'];
	$Language = $_POST['Language'];
} elseif (!isset($_SESSION['Language'])) {
	$_SESSION['Language'] = $DefaultLanguage;
	$Language = $DefaultLanguage;
} else {
	$Language = $_SESSION['Language'];
}

/*Since LanguagesArray requires the function _() to translate the language names - we must provide a substitute if it doesn't exist aready before we include includes/LanguagesArray.php 
 * */
if (!function_exists('gettext')) {
/*
	PHPGettext integration by Braian Gomez
	http://www.vairux.com/
*/
	require_once($PathPrefix . 'includes/php-gettext/streams.php');
	require_once($PathPrefix . 'includes/php-gettext/gettext.php');
	if(isset($_SESSION['Language'])){
		$Locale = $_SESSION['Language'];
	} else {
		$Locale = $DefaultLanguage;
	}
	
	if (isset($PathPrefix)) {
		$LangFile = $PathPrefix . 'locale/' . $Locale . '/LC_MESSAGES/messages.mo';
	} else {
		$LangFile = 'locale/' . $Locale . '/LC_MESSAGES/messages.mo';
	}
	
	if (file_exists($LangFile)){
		$input = new FileReader($LangFile);
		$PhpGettext = new gettext_reader($input);
		
		if (!function_exists('_')){
			function _($text) {
				global $PhpGettext;
				return $PhpGettext->translate($text);
			}
		}
	} elseif (!function_exists('_')) {
		function _($text){
			return $text;
		}
	}
	include($PathPrefix . 'includes/LanguagesArray.php');
} else {
	include($PathPrefix . 'includes/LanguagesArray.php');
	
	$LocaleSet = setlocale (LC_ALL, $_SESSION['Language'],$LanguagesArray[$_SESSION['Language']]['WindowsLocale']);
	$LocaleSet = setlocale (LC_NUMERIC, 'C','en_GB.utf8','en_GB','en_US','english-us');
	
	if (defined('LC_MESSAGES')){ //it's a unix/linux server
		$LocaleSet = setlocale (LC_MESSAGES, $_SESSION['Language']);
	}
	//Turkish seems to be a special case
	if ($_SESSION['Language']=='tr_TR.utf8') {
		$Locale = setlocale(LC_CTYPE, 'C');
	}
	
	// possibly even if locale fails the language will still switch by using Language instead of locale variable
	putenv('LANG=' . $_SESSION['Language']);
	putenv('LANGUAGE=' . $_SESSION['Language']);
	bindtextdomain ('messages', $PathPrefix . 'locale');
	textdomain ('messages');
	bind_textdomain_codeset('messages', 'UTF-8'); 
}

$DecimalPoint = $LanguagesArray[$_SESSION['Language']]['DecimalPoint'];
$ThousandsSeparator = $LanguagesArray[$_SESSION['Language']]['ThousandsSeparator'];

?>