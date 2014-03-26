<?php
$array_glacode=explode(',',$_POST['glacode']);
$array_accname=explode('+',$_POST['accname']);
$array_narrative=explode('+',$_POST['narrative']);
$array_db=explode('*',$_POST['db']);
$array_cr=explode('*',$_POST['cr']);
$array_tags=explode('+',$_POST['tags']);
$array_jv=explode('+',$_POST['jv']);
$array_date=explode('+',$_POST['dates']);
$array_name=explode('+',$_POST['custname']);
$array_dct=explode('_',$_POST['dct']);
$myCtr=count($array_glacode);
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
LEFT JOIN chartmaster ON gltrans.account = chartmaster.accountcode
LEFT JOIN tags ON gltrans.tag = tags.tagref
WHERE gltrans.type = '12'
AND gltrans.trandate >= '".$_POST['date1']."'
AND gltrans.trandate <= '".$_POST['date2']."'
AND gltrans.typeno >= '".$_POST['num1']."'
AND gltrans.typeno <= '".$_POST['num2']."'
GROUP BY gltrans.account";


if(isset($_GET['export']) &&($_GET['export']==1)){
 $fdate=date('m/d/Y-h:i:sa', time());
 $fname='CashJournal-'.$fdate.'.xls';
 header("Content-Type: application/vnd.ms-excel");
 header("Content-Disposition: attachment;Filename=".$fname);
}


//print_r($_POST);
//echo 'here'.$_POST['dct'];
?>
<title>Print Cash Receipt Journal</title>
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



<body>

<p>
	<center>
	Institute of International Auditors Phils.<br>
	Cash Receipts Journal Entry<br>
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
	<th><u>OR/AR No.</u></th>
	<th><u>DCT No.</u></th>
	<th><u>Date</u></th>
	<th><u>Customer Name</u></th>
	<th><u>Narrative</u></th>
	<th><u>Account Code</u></th>
	<th><u>Account Description</u></th>
	<th><u>Debit</u></th>
	<th><u>Credit</u></th>
	<th><u>GL-Tags</u></th>

</tr>

<?php
	for($x=0;$x<$myCtr;$x++){
?>
	<tr>	
			<td><?=$array_jv[$x]?></td>
			<td><?=$array_dct[$x]?></td>
			<td><?=$array_date[$x]?></td>
			<td><?=$array_name[$x]?></td>
			<td><?=$array_narrative[$x]?></td>
			<td><?=$array_glacode[$x]?></td>
			<td><?=$array_accname[$x]?></td>
			<td class="number"><?=number_format($array_db[$x],2)?></td>
			<td class="number"><?=number_format($array_cr[$x],2)?></td>
			<td class="number"><?=$array_tags[$x]?></td>

	</tr>
<?php }?>

<tr>
		<td colspan=8></td>
</tr>

<tr>
            <td colspan="5"></td>
            <td colspan="1"><b>Total</b></td>
            <td class="number"><b><?=number_format($_POST['totaldb'],2)?></b></td>
            <td class="number"><b><?=number_format($_POST['totalcr'],2)?></b></td>
          </tr>

<tr>
                <td colspan=8><b><center>=======GL Summary=======</center></b></td>
</tr>


<tr>
        <td></td>
        <td></td>
        <td><b><u>GL Code</u></b></td>
        <td><b><u>Account Name</u></b></td>
        <td></td>
        <td class="number"><b><u>Debit</u></b></td>
        <td class="number"><b><u>Credit</u></b></td>
        <td class="number"><b><u>Net Balance</u></b></td>
        <td></td>

</tr>


<?php
//echo 'Here'.$sql; 
$result=mysql_query($sql);
$totalpos=0;
$totalneg=0;
$totalnet=0;
while($row=mysql_fetch_array($result)){
$myNet=$row['totalpositive']+$row['totalnegative'];
?>
<tr>
        <td></td>
        <td></td>
        <td><?=$row['glacode']?></td>
        <td><?=$row['accountname']?></td>
        <td></td>
        <td class="number"><?=number_format($row['totalpositive'],2)?></td>
        <td class="number"><?=number_format($row['totalnegative']*-1,2)?></td>
        <td class="number"><?=number_format($myNet,2)?></td>
        <td></td>

</tr>
<?php
$totalpos=$totalpos+$row['totalpositive'];
$totalneg=$totalneg+($row['totalnegative']*-1);
$totalnet=$totalnet+$myNet;
}
?>
<tr>
                <td colspan=8></td>
</tr>
<tr>
            <td colspan="4"></td>
            <td colspan="1"><b>Total</b></td>
            <td class="number"><b><?=number_format($totalpos,2)?></b></td>
            <td class="number"><b><?=number_format($totalneg,2)?></b></td>
            <td class="number"><b><?=number_format($totalnet,2)?></b></td>
          </tr>


</table>
</body>
