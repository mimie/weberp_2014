<?php
include('connectDb.php');
$sql="SELECT accountgroups.sectioninaccounts,
                        accountgroups.groupname,
                        accountgroups.parentgroupname,
                        chartdetails.accountcode,
                        chartmaster.accountname,
                        chartmaster.glacode,
                        Sum(CASE WHEN chartdetails.period='" . $_GET['ref'] . "' THEN chartdetails.actual ELSE 0 END) AS balancecfwd,
                        Sum(CASE WHEN chartdetails.period='" . ($_GET['ref'] - 12) . "' THEN chartdetails.actual ELSE 0 END) AS lybalancecfwd,
                        Sum(CASE WHEN chartdetails.period='" . ($_GET['ref'] - 1) . "' THEN chartdetails.actual ELSE 0 END) AS lmbalancecfwd
                FROM chartmaster INNER JOIN accountgroups
                ON chartmaster.group_ = accountgroups.groupname INNER JOIN chartdetails
                ON chartmaster.accountcode= chartdetails.accountcode
                WHERE accountgroups.pandl=0
                AND (chartmaster.glacode LIKE '1-%' OR chartmaster.glacode LIKE '2-%' OR chartmaster.glacode LIKE '3-%')
                GROUP BY accountgroups.groupname,
                        chartdetails.accountcode,
                        chartmaster.accountname,
                        accountgroups.parentgroupname,
                        accountgroups.sequenceintb,
                        accountgroups.sectioninaccounts
                ORDER BY accountgroups.sectioninaccounts,
                        accountgroups.sequenceintb,
                        accountgroups.groupname,
                        chartdetails.accountcode";

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
As of <?=$_GET['cbd']?>
</center>
</p>

<table class="style4">
<tr>
	<th><u>ACCT. NO.</u></th>
	<th><u>ACCOUNTTITLE</u></th>
	<th><u>LAST YEAR</u></th>
	<th><u><?=$_GET['lbd']?></u></th>
	<th><u><?=$_GET['cbd']?></u></th>
</tr>

<?php
$tempgroup='';
$totalamt=0;
$total_lastyear=0;
$total_lastmonth=0;
$result=mysql_query($sql);
while($row=mysql_fetch_array($result)){
if(($tempgroup!=$row['groupname'])&&($tempgroup!='')){
	echo '<tr><td></td></tr>';
	echo'<tr style="background-color:#ffff99">
		<td><b>'.$tempgroup.'</b></td>
		<td></td>
		<td class="number">'.number_format($total_lastyear,2).'</td>
		<td class="number">'.number_format($total_lastmonth,2).'</td>
		<td class="number">'.number_format($totalamt,2).'</td>
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
	<td class="number"><?=number_format($row['lybalancecfwd'],2)?></td>
	<td class="number"><?=number_format($row['lmbalancecfwd'],2)?></td>
	<td class="number"><?=number_format($row['balancecfwd'],2)?></td>
</tr>
<?php 
	$total_lastyear=$total_lastyear+$row['lybalancecfwd'];
	$total_lastmonth=$total_lastmonth+$row['lmbalancecfwd'];
	$totalamt=$totalamt+$row['balancecfwd'];
} ?>
</table>


</body>
