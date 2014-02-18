<?php
include('connectDb.php');

$sql="SELECT glacode FROM chartmaster WHERE accountcode='".$_POST['AccountFrom']."'";
$result=mysql_query($sql);
$accountFrom=mysql_fetch_array($result);
//echo $accountFrom[0];


$sql="SELECT glacode FROM chartmaster WHERE accountcode='".$_POST['AccountTo']."'";
$result=mysql_query($sql);
$accountTo=mysql_fetch_array($result);
//echo $accountTo[0];
//die();



$sql= "SELECT type,
                        typename,
                        gltrans.typeno,
                        trandate,
                        narrative,
                        amount,
                        periodno,
                        tag,
                        glacode,
                        gltrans.account,
			tagdescription,
			normal_balance,
			gltrans.voucherno
                FROM gltrans
                JOIN chartmaster ON gltrans.account=chartmaster.accountcode
		LEFT JOIN tags ON tags.tagref=gltrans.tag, systypes
                WHERE gltrans.account BETWEEN '" .$_POST['AccountFrom'] . "' AND '" .$_POST['AccountTo'] . "'
                AND systypes.typeid=gltrans.type
                AND posted=1
                AND periodno>= '" . $_POST['FirstPeriod'] . "'
                AND periodno<= '" . $_POST['LastPeriod'] . "'";

if($_POST['TagFrom']!=''){
               $sql=$sql." AND tag BETWEEN '".$_POST['TagFrom']."' AND '".$_POST['TagTo']."'";
}
               $sql=$sql." ORDER BY periodno, gltrans.trandate, counterindex";

//die($sql);
//echo $_POST['AccountFrom'].'Here';

if(isset($_GET['export']) &&($_GET['export']==1)){
 $fdate=date('m/d/Y-h:i:sa', time());
 $fname='AccountInquiry-'.$fdate.'.xls';
 header("Content-Type: application/vnd.ms-excel");
 header("Content-Disposition: attachment;Filename=".$fname);
}

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
Account Inquiry
</title>
<body>

<p>
        <center>
        Institute of International Auditors Phils.<br>
        GL ACCOUNT INQUIRY<br>
        From<?=$accountFrom[0]?> to <?=$accountTo[0]?>
        </center>
</p>

<table class="style4">

<tr>
        <th><u>Date</u></th>
        <th><u>Type Name</u></th>
	<th><u>Ref No.</u></th>
        <th><u>Account Code</u></th>
        <th><u>Narrative</u></th>
        <th><u>Debit</u></th>
        <th><u>Credit</u></th>
        <th><u>GL-Tags</u></th>

</tr>

<?php
$totaldb=0;
$totalcr=0;
$result=mysql_query($sql);
//echo 'Here'.$sql; 
while($row=mysql_fetch_array($result)){

$db=0;
$cr=0;

if($row['normal_balance']=='DR'){
  if($row['amount']<0){
   $cr=$row['amount']*-1;
   $totalcr=$totalcr+$cr;
  }else{
   $db=$row['amount'];
   $totaldb=$totaldb+$db;
  }
}else{
   if($row['amount']<0){
    $cr=$row['amount']*-1;
    $totalcr=$totalcr+$cr;
   }else{
    $db=$row['amount'];
    $totaldb=$totaldb+$db;
   }
}
?>

<tr>
        <td><?=$row['trandate']?></td>
        <td><?=$row['typename']?></td>
	<td><?=$row['voucherno']?></td>
        <td><?=$row['glacode']?></td>
        <td><?=$row['narrative']?></td>
        <td class="number"><?=number_format($db,2)?></td>
        <td class="number"><?=number_format($cr,2)?></td>
        <td class="number"><?=$row['tagdescription']?></td>
        <td></td>

</tr>
<?php
$totalpos=$totalpaos+$row['totalpositive'];
$totalneg=$totalneg+($row['totalnegative']*-1);
$totalnet=$totalnet+$myNet;
}
?>
<tr>
  <td colspan="3"></td>
  <td><b>Total</b></td>
  <td><?=number_format($totaldb,2)?></td>
  <td><?=number_format($totalcr,2)?></td>
</tr>

</table>
</body>
