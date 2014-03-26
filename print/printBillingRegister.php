<?php
$array_name=explode('+',$_POST['name']);
$array_db=explode('*',$_POST['db']);
$array_custId=explode('+',$_POST['custId']);
$array_event=explode('+',$_POST['event']);
$array_jv=explode('+',$_POST['jv']);
$array_date=explode('+',$_POST['dates']);
$myCtr=count($array_custId);
#echo 'Here '.$_POST['num1'];
#die(print_r($_POST));


include('connectDb.php');

$sql="SELECT gltrans.typeno, 
	gltrans.trandate, 
	gltrans.account, 
	chartmaster.accountname, 
	chartmaster.normal_balance, 
	chartmaster.glacode, 
	gltrans.narrative, 
	SUM(CASE WHEN gltrans.amount >0 THEN gltrans.amount ELSE 0 END ) AS totalpositive, 
	SUM(CASE WHEN gltrans.amount <0 THEN gltrans.amount ELSE 0 END ) AS totalnegative, 
	gltrans.tag, 
	tags.tagdescription, 
	gltrans.jobref, 
	gltrans.voucherno
FROM gltrans
INNER JOIN chartmaster ON gltrans.account = chartmaster.accountcode
LEFT JOIN tags ON gltrans.tag = tags.tagref
WHERE gltrans.type = '5'
AND gltrans.trandate >= '".$_POST['date1']."'
AND gltrans.trandate <= '".$_POST['date2']."'
AND gltrans.typeno >= '".$_POST['num1']."'
AND gltrans.typeno <= '".$_POST['num2']."'
GROUP BY gltrans.account";


if(isset($_GET['export']) &&($_GET['export']==1)){
 $fdate=date('m/d/Y-h:i:sa', time());
 $fname='JournalInquiry-'.$fdate.'.xls';
 header("Content-Type: application/vnd.ms-excel");
 header("Content-Disposition: attachment;Filename=".$fname);
}

#die($sql);
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
Billing Journal
</title>
<body>

<p>
	<center>
	Institute of International Auditors Phils.<br>
	BILLING REGISTER<br>
        From <?=date('m/d/Y',strtotime($_POST['date1']))?> To <?=date('m/d/Y',strtotime($_POST['date2']))?>

	</center>
</p>


<table class="style4">
        <tr>
                <td><b>Date Printed:</b></td>
                <td><?=date('m/d/Y h:i A')?></td>
        </tr><tr>
                <td><b>Printed By:</b></td>
                <td><?=$_GET['uname']?></td>
        </tr>
</table>


<table class="style4">

<tr>
	<th><u>BS Date</u></th>
	<th><u>BS No.</u></th>
	<th><u>Customer ID</u></th>
	<th><u>Name</u></th>
	<th><u>Gross Amount</u></th>
	<th><u>Event</u></th>

</tr>

<?php
//die($sql);
	for($x=0;$x<$myCtr;$x++){
?>
	<tr>	
			<td><?=$array_date[$x]?></td>
			<td><?=$array_jv[$x]?></td>
			<td><?=$array_custId[$x]?></td>
			<td><?=$array_name[$x]?></td>
			<td class="number"><?=number_format($array_db[$x],2)?></td>
			<td class="number"><?=$array_event[$x]?></td>

	</tr>
<?php }?>

<tr>
                <td colspan=9></td>
</tr>
<tr>
            <td colspan="3"></td>
            <td colspan="1"><b>Total</b></td>
            <td class="number"><u><b><?=number_format($_POST['totaldb'],2)?></b></u></td>
          </tr>

</table>
</body>
