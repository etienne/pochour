<?php

/* vim: set expandtab tabstop=4 shiftwidth=4 softtabstop=4: */
// +----------------------------------------------------------------------+
// | PHP version 4                                                        |
// +----------------------------------------------------------------------+
// | This source file is fully copyrighted to iMars Inc. and its authors. |
// +----------------------------------------------------------------------+
// | Authors: Etienne Despres <graf@iMars.com>                            |
// +----------------------------------------------------------------------+
//
// $Id: Writedown.inc,v 0.54 2004/11/05 17:36:00 lis Exp $
// 
// Note: this version of the script (2011.02.20) is meant to be used solely as a shell script.

/**
 * Writedown
 *
 * Text to XHTML conversion
 *
 * @package	Writedown
 * @category	Writedown
 * @license	PHP License
 * @access	public
 * @version	$Revision: 0.54 $
 */
class Writedown
{

	function Entitize ($string) {
		$htmlentitizedString = htmlentities($string,ENT_NOQUOTES,'UTF-8');
//		$match = array('{’}u','{…}u');
//		$replace = array('&#8217;','&#133;');
//		return preg_replace($match, $replace, $htmlentitizedString);
		return $htmlentitizedString;
	}

	function FormatText ($string) {
		global $settings;
		$match = array (
			'{"([^"]*)"\s\(((?:http://|/|mailto:)[^\s\)]*)\)}u', // URLs with title
//			'{"([^"]*)"\s\(pochour://([^\s\)\?]*)(\??)([^\s\)]*)\)}u', // Pochour URLs (compatibility)
			'{\[([^"\]]*)\]\s\(((?:http://|/)[^\s\)]*)\)}u', // Images
			'{([^"])(http://[^\s\)\]]+)}u', // plain URLs
			'{(\s|^|&nbsp;)/([^\s][^/<]*)/(\W|$)}u', // Italic
			'{(\s|^|&nbsp;)-=([^-=<]*)=-(\W|$)}u', // Strike (ugly but avoids clashes with other - and = handling)
			'{(\d*)\^(\d*)}',	// Superscript
			'{(\s|^|&nbsp;)\*([^\s][^\*]*)\*(\W|$)}u', 	// Bold
			'{\\\([\*/"-])}u', // Backslashes
		);
		$replace = array (
			'<a href="$2">$1</a>',
//			'<a href="'. $settings[rootdir] .'$2.php$3$4">$1</a>',
			'<img src="$2" alt="$1" border="0"/>',
			'$1<a href="$2">$2</a>',
			'$1<em>$2</em>$3',
			'$1<strike>$2</strike>$3',
			'$1<sup>$2</sup>',
			'$1<strong>$2</strong>$3',
			'$1',
		);
		$formattedString = preg_replace($match, $replace, $string);
		return $formattedString;
	}

	function SmartizeText ($string, $stringLanguage = 'fr') {
		global $lang;
		// If language is not specified, use global $lang variable
		if ($stringLanguage) {
			$language = $stringLanguage;
		} else {
			$language = $lang;
		}
		$match = array (
			'{([\'’])}u', // ' Single quotes
			'{([\s^])(?:"|«[  ]?|“)([^"»”]*)(?:"|[  ]?»|”)(\W)(?!\(http://|\(/|\(mailto:)}mu', // " Double quotes
			'{([^\-])[  ]?\-\-[  ]?([^\-])}u', // -- Dashes
			'{[  ]\-[  ]}u', // -- Dashes with a single -
			'{[\s ]?:([\s$])}mu', // :
			'{(\w)[\s ]?\?(\s)}u', // ?
			'{(\w)[\s ]?\!(\s)}u', // !
			'{\.\.\.}u'  // ...
		);
		switch ($language) {
			case 'en':
				$replace = array (
					'’',
					'$1“$2”$3',
					'$1—$2',
					'—',
					':$1',
					'$1?$2',
					'$1!$2',
					'…'
				);
				break;
			case 'fr':
				$replace = array (
					'’',
					'$1« $2 »$3',
					'$1 – $2',
					' – ',
					' :$1',
					'$1 ?$2',
					'$1 !$2',
					'…'
				);
				break;
		}
		$smartizedString = preg_replace($match, $replace, $string);
		$entitizedString = Writedown::Entitize($smartizedString);
		$formattedString = Writedown::FormatText($entitizedString);
		return $formattedString;
	}

	function Text2XHTML ($string, $stringLanguage = 'fr') {
		global $lang;
		// If language is not specified, use global $lang variable
		if ($stringLanguage) {
			$language = $stringLanguage;
		} else {
			$language = $lang;
		}
		// First find backticked portions and store them for later use
		$backtickmatch = '{`([^`]*)`}u';
		preg_match_all($backtickmatch,$string,$metaFillOutArray,PREG_PATTERN_ORDER);
		// Only index 1 is suitable for use
		$fillOutArray = $metaFillOutArray[1];
		// Replace matches with placeholders
		$string = preg_replace($backtickmatch,'%PLACEHOLDER',$string);
		$match = array (
			'{\r}u', // Strip carriage returns
			'{^([^\n]+)$}mu',	 // Paragraphs
			'{<p>-(=)+-</p>}u', // Horizontal rules
		//	'{<p>([^\n]+)</p>[\n\s]*<p>=*</p>}u', // Big headings
			'{<p>([^\n]+)</p>[\n\s]*<p>-*</p>}u', // Small headings
			'{<p>[-·•]\s?([^\n]+)</p>(\n{1}|$)}u', // Lists (first pass)
			'{</ul>\n<ul>}u', // Lists (second pass)
			'{<p>(\d)\. ([^\n]+)</p>(\n{1}|$)}u', // Ordered lists (first pass)
			'{</ol>\n<ol type="1" start="\d">}u', // Ordered lists (second pass)
		//	"{\n{3}(<p>)}u", // Paragraphs with space before
			'{</p>\n<p>([^\t])}u', // Line breaks
		//	'{<p>([^:\n]*):<br/>(.*)</p>}u', // Definition lists (first pass)
		//	"{<p>([^:\n]*)\s?:<br/>(.*?)</p>}su", // Definition lists (first pass)
			"{</dl>\s*<dl>}u", // Definition lists (second pass)
			"{(/?)>\[([^\s=>\]]*)=([^\s>\]]*)\]}u", // Custom property <roger=patate>
			'{<p>%PLACEHOLDER</p>}u', // Ugly hack to avoid p's around placeholders
		);
		$replace = array (
			'',
			'<p>$1</p>',
			'<hr/>',
			'<h2>$1</h2>',
		//	'<h3>$1</h3>',
			"<ul><li>$1</li></ul>\n",
			"\n",
			"<ol type=\"1\" start=\"$1\"><li>$2</li></ol>\n",
			"\n",
		//	'<br/><p>',
			"<br/>\n$1",
		//	"<dl><dt>$1</dt>\n<dd>$2</dd></dl>",
		//	"<dl><dt>$1</dt>\n<dd>$2</dd></dl>",
			"\n",
			' $2="$3"$1>',
			'%PLACEHOLDER',
		);
		$smartizedString = Writedown::SmartizeText($string, $language);
		$HTMLString = preg_replace($match, $replace, $smartizedString);
		while ($fillout = array_shift($fillOutArray)) {
			$HTMLString = preg_replace('{%PLACEHOLDER}u', $fillout, $HTMLString, 1);
		}
		return $HTMLString;
	}

}

print Writedown::Text2XHTML($argv[1]);

?>
