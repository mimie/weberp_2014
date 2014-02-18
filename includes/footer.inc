<?php

/* $Id: footer.inc 5670 2012-09-19 08:46:02Z daintree $*/

echo '</div>'; // BodyWrapDiv
echo '</div>'; // BodyDiv

echo '<div id="FooterDiv">';
echo '<div id="FooterWrapDiv">';

echo '<div id="FooterLogoDiv" border="1">';
	echo '<img src="'. $rootpath . '/' . $_SESSION['LogoFile'] . '" width="70" height="50" alt="webERP" title="webERP ' . _('Copyright') . ' &copy; weberp.org - ' . date('Y') . '" />';
echo '</div>';

echo '<div id="FooterVersionDiv">';
	echo 'webERP ' ._('version') .' ' . $_SESSION['VersionNumber'] . ' ' . _('Copyright') . ' © 2004 - ' . Date('Y'). ' <a target="_blank" href="http://www.weberp.org/weberp/doc/Manual/ManualContributors.html">weberp.org</a>';
echo '</div>';

echo '<div id="FooterTimeDiv">';
	echo DisplayDateTime();
echo '</div>';

echo '</div>'; // FooterWrapDiv
echo '</div>'; // FooterDiv
echo '</div>'; // Canvas

echo '</body>';
echo '</html>';

?>
