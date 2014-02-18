<?php

//echo 'Account list';


include('connectDb.php');
$sql="SELECT * FROM chartmaster";

$fdate=date('m/d/Y-h:i:sa', time());
$fname='AccountList-'.$fdate.'.xls';
header("Content-Type: application/vnd.ms-excel");
header("Content-Disposition: attachment;Filename=".$fname);

?>


<style type="text/css">
<!--

td.number {
    text-align: right;
}
.style4 {font-size: 8pt; font-family: Calibri; }
.style6 {font-size: 10pt; font-family: Calibri; font-weight: bold; }
.style7 {
  font-family: Calibri;
  font-size: 18px;
  font-weight: bold;
}
.style16 {font-size: 10pt}
.style17 {font-family: Calibri; font-size: 18pt; font-weight: bold; }
-->
</style>

<title>
Account List
</title>


<table>

<tr class="style7">
	<th colspan="4"><center><u>Account List</u></center></th>
</tr>
<tr><td></td></tr>
<tr class="style6">
	<th><u>Account Code</u></th>
	<th><u>Account Name</u></th>
	<th><u>Account Group</u></th>
	<th><u>Normal Balance</u></th>
</tr>

<?php
$result=mysql_query($sql);
while($row=mysql_fetch_array($result)){
?>

<tr class="style16">
	<td><?=$row['glacode']?></td>
	<td><?=$row['accountname']?></td>
	<td><?=$row['group_']?></td>
	<td><?=$row['normal_balance']?></td>
</tr>

<?php }?>
</table>
