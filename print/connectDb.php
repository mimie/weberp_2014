<?php

$db=mysql_connect('10.110.215.92', 'iiap', 'mysqladmin');
if (!$db) {
          die('Could not connect: ' . mysql_error());
}
mysql_select_db("iiap_weberp2014", $db);

?>

