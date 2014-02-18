<?php

$dbMe=mysql_connect('10.110.215.92', 'iiap', 'mysqladmin');
if (!$dbMe) {
          die('Could not connect: ' . mysql_error());
}
mysql_select_db("webapp_civicrm", $dbMe);

?>

