<head>
<title>Print Trial Balance</title>
</head>


<style type="text/css">
<!--

td.number {
    text-align: right;
}
.style4 {font-size: 10pt; font-family: Calibri; }
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

<?php
$array_glacode=explode(",",$_POST['glacode']);
$array_beg=explode("_",$_POST['beg']);
$array_db=explode("_",$_POST['db']);
$array_cr=explode("_",$_POST['cr']);
$array_net=explode("_",$_POST['net']);
$array_end=explode("_",$_POST['end']);
$array_accname=explode("_",$_POST['accname']);
$myCtr=count($array_glacode);


#header("Content-Type: application/csv");
#header("Content-Disposition: attachment;Filename=trialbalance.csv");


if(isset($_GET['export']) &&($_GET['export']==1)){
 $fdate=date('m/d/Y-h:i:sa', time());
 $fname='TrialBalance-'.$fdate.'.xls';
 header("Content-Type: application/vnd.ms-excel");
 header("Content-Disposition: attachment;Filename=".$fname);
}

?>

<body>
	<font size=2>
<p><center>
		Institute of International Auditors Phils.<br>
		GL Account Summary Reports<br>
		<?=$_POST['asOf']?>
</center>
</p>


<table class="style4">
        <tr>
                <td><b>Date Printed:</b></td>
                <td><?=date('m/d/Y h:i A')?></td>
        </tr><tr>
                <td><b>Printed by:</b></td>
                <td><?=$_GET['uname']?></td>
        </tr>
</table>
<br>

<table class="style4">
<tr>
	<th><u>Account Number</u></th>
	<th><u>Account Description</u></th>
	<th><u>Beginning Balance</u></th>
	<th><u>Debit Change</u></th>
	<th><u>Credit Change</u></th>
	<th><u>Net Change</u></th>
	<th><u>Ending Balance</u></th>
</tr>

	<?php for($x=0;$x<$myCtr;$x++){?>
<tr>
	<td><?=$array_glacode[$x]?></td>
	<td><?=$array_accname[$x]?></td>
	<td class="number"><?=number_format($array_beg[$x],2)?></td>
	<td class="number"><?=number_format($array_db[$x],2)?></td>
	<td class="number"><?=number_format($array_cr[$x],2)?></td>
	<td class="number"><?=number_format($array_net[$x],2)?></td>
	<td class="number"><?=number_format($array_end[$x],2)?></td>
</tr>
	<?php } ?>

<tr>
	<td>&nbsp;</td>
	<td>Total</td>
	<td class="number"><?=number_format($_POST['totalbeg'],2)?></td>
	<td class="number"><?=number_format($_POST['totaldb'],2)?></td>
	<td class="number"><?=number_format($_POST['totalcr'],2)?></td>
	<td class="number"><?=number_format($_POST['totalnet'],2)?></td>
	<td class="number"><?=number_format($_POST['totalend'],2)?></td>
</tr>

</table>
</body>
