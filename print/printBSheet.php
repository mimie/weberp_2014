<?php
include('../myFunctions.php');
include('connectDb.php');
$sql="SELECT 
                gltrans.typeno, 
                gltrans.trandate, 
                gltrans.account, 
                chartmaster.accountname, 
                chartmaster.normal_balance, 
                chartmaster.glacode, 
                chartmaster.group_ as groupname, 

                SUM(CASE WHEN gltrans.periodno = '".$_POST['period']."' THEN gltrans.amount ELSE 0 END ) AS currentBalance,
		SUM(CASE WHEN gltrans.periodno < '".$_POST['period']."' THEN gltrans.amount ELSE 0 END ) AS currentBeg, 
                SUM(CASE WHEN gltrans.periodno = '".($_POST['period']-1)."' THEN gltrans.amount ELSE 0 END ) AS lastMonth,
		SUM(CASE WHEN gltrans.periodno < '".($_POST['period']-1)."' THEN gltrans.amount ELSE 0 END ) AS lastBeg,  
                SUM(CASE WHEN gltrans.periodno = '".($_POST['period']-12)."' THEN gltrans.amount ELSE 0 END ) AS lastYear

                FROM gltrans INNER JOIN chartmaster ON chartmaster.accountcode = gltrans.account 
                WHERE chartmaster.glacode LIKE '1-%' OR chartmaster.glacode LIKE '2-%' OR chartmaster.glacode LIKE '3-%'
                GROUP BY gltrans.account 
                ORDER BY chartmaster.glacode";

if(isset($_GET['export']) &&($_GET['export']==1)){
 $fdate=date('m/d/Y-h:i:sa', time());
 $fname='BalanceSheet-'.$fdate.'.xls';
 header("Content-Type: application/vnd.ms-excel");
 header("Content-Disposition: attachment;Filename=".$fname);
}


//echo $sql;
?>

<title>Print Balance Sheet</title>

<style type="text/css">
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
</style>
<body>

<p>
<center>
THE INSTITUTE OF INTERNAL AUDITORS PHILIPPINES, INC.<br>
(A Non-Stock, Non-Profit Corporation)<br>
BALANCE SHEET DETAILED<br>
As of <?=date('F Y',strtotime($_POST['curDate']))?>
</center>
</p>

<table class="style4">
<tr>
	<th><u>ACCT. NO.</u></th>
	<th><u>ACCOUNTTITLE</u></th>
	<th><u>LAST YEAR</u></th>
	<th><u><?=date('F d',strtotime($_POST['lastDate']))?></u></th>
	<th><u><?=date('F d',strtotime($_POST['curDate']))?></u></th>
</tr>

<?php
$tempgroup='';
$totalamt=0;
$total_lastyear=0;
$total_lastmonth=0;
$result=mysql_query($sql);
while($row=mysql_fetch_array($result)){

	$cur=$row['currentBalance']+$row['currentBeg'];
        $las=$row['lastMonth']+$row['lastBeg'];


if(($tempgroup!=$row['groupname'])&&($tempgroup!='')){
	echo '<tr><td></td></tr>';
	echo'<tr style="background-color:#ffff99">
		<td><b>'.$tempgroup.'</b></td>
		<td></td>
		<td class="number">'.reverse_sign($total_lastyear).'</td>
		<td class="number">'.reverse_sign($total_lastmonth).'</td>
		<td class="number">'.reverse_sign($totalamt).'</td>
	</tr>';
	echo '<tr><td></td></tr>';
	$tempgroup=$row['groupname'];
	$totalamt=0;
	$total_lastyear=0;
	$total_lastmonth=0;
}else{
	$tempgroup=$row['groupname'];
}


?>
<tr>
	<td><?=$row['glacode']?></td>
	<td><?=$row['accountname']?></td>
	<td class="number"><?=reverse_sign($row['lastYear'])?></td>
	<td class="number"><?=reverse_sign($las)?></td>
	<td class="number"><?=reverse_sign($cur)?></td>
</tr>
<?php 
	$total_lastyear=$total_lastyear+$row['lastYear'];
	$total_lastmonth=$total_lastmonth+$las;
	$totalamt=$totalamt+$cur;
} ?>
</table>


</body>
