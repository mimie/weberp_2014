<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Print Journal Voucher</title>
<style type="text/css">
<!--
.style1 {
	font-family: Calibri;
	font-weight: bold;
	font-size: 12px;
}
.style3 {
	font-family: Calibri;
	font-weight: bold;
	font-size: 18pt;
}
.style5 {
	font-family: Calibri;
	font-weight: bold;
	font-size: 10px;
}
.style7 {
	font-family: Calibri;
	font-size: 10pt;
	font-weight: bold;
}
.style16 {font-family: Arial; font-size: 12px; font-weight: bold; }
.style17 {
	font-family: Arial;
	font-weight: bold;
	font-size: 18px;
}

td.number {
    text-align: right;
}
-->
</style>
</head>


<?php

include('connectDb.php');

$sql="SELECT gltrans.typeno,
                                gltrans.trandate,
                                gltrans.account,
                                gltrans.jobref,
                                chartmaster.accountname,
                                chartmaster.normal_balance,
                                chartmaster.glacode,
                                gltrans.narrative,
                                gltrans.amount,
                                gltrans.tag,
                                gltrans.chequeno,
                                gltrans.checkdate,
                                gltrans.voucherno,
                                tags.tagdescription
                        FROM gltrans
                        INNER JOIN chartmaster
                                ON gltrans.account=chartmaster.accountcode
                        LEFT JOIN tags
                                ON gltrans.tag=tags.tagref
                        WHERE gltrans.voucherno='" .$_GET['vouchNum']. "' 
                        ORDER BY gltrans.counterindex DESC";


$result=mysql_query($sql);
#$myrow=mysql_fetch_array($result);
#echo $sql;
#print_r($myrow);
$db=0;
$cr=0;
$totaldb=0;
$totalcr=0;
$suppname='';
$checkdate='';
$transdate='';
$checkno='';
$totalamt=0;
$ref='';
$list_amt=array();
$list_glacode=array();
$list_accname=array();
$list_chequeno=array();
$list_narrative=array();
$list_cr=array();
$list_db=array();
$list_tags=array();
$list_jv=array();
$list_date=array();
$list_ref=array();


while($row=mysql_fetch_array($result)){
$db=0;
$cr=0;
        array_push($list_glacode,$row['glacode']);
	#echo $row['glacode'].' Here';
        array_push($list_accname,$row['accountname']);
	$nar='';
	$narLen=strlen($row['narrative']);
	
	if($narLen>25){
		$nar=substr($row['narrative'],0,25).'...';
	}else
		$nar=$row['narrative'];

        array_push($list_narrative,$nar);
        array_push($list_chequeno,$row['chequeno']);
        array_push($list_amt,$row['amount']);

        if($row['normal_balance']=='DR'){
                if($row['amount']>0){
                $db=$row['amount'];
                $totaldb=$totaldb+$db;
                }else{
                $cr=$row['amount']*-1;
                $totalcr=$totalcr+$cr;
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
        array_push($list_db,$db);
        array_push($list_cr,$cr);



  	$suppname=$row['suppname'];
        $checkdate=$row['checkdate'];
        $transdate=$row['trandate'];
        $checkno=$row['chequeno'];
	$refLen=strlen($row['jobref']);
	if($refLen>25){
	  $ref=substr($row['jobref'],25).'...';
	}else
	  $ref=$row['jobref'];
	
}
#die($myrow[2]);
if($list_amt[0]<0){
        $totalamt=$list_amt[0]*-1;
}else{
        $totalamt=$list_amt[0];
}
$myCtr=count($list_glacode);
?>

<body onload="printTkt()">
<font face="Arial">
<?php
$header='<p class="style1">Institute of Internal Auditors Philippines, Inc.</p>
<p align="center" class="style3">JOURNAL VOUCHER</p>
<table width="860" border="0">
  <tr>
    <td width="59"><span class="style7">Particulars:</span></td>
    <td width="380" rowspan="2">'.$ref.'</td>
     <td>&nbsp;</td>
    <td width="100"><div align="right"><span class="style7">Date:</span></div></td>
    <td width="145"><span class="style7">'.$transdate.'</span></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
     <td>&nbsp;</td>
    <td><div align="right"><span class="style7">Number: </span></div></td>
    <td><span class="style7">'.$_GET['vouchNum'].'</span></td>
  </tr>
</table>
<table  border="1">
  <tr>
    <td width="105"><span class="style16">ACCT. CODE</span></td>
    <td width="200"><span class="style16">ACCOUNT TITLE</span></td>
    <td width="237"><span class="style16">Trans Description</span></td>
    <td width="140"><span class="style16">DEBIT</span></td>
    <td width="144"><span class="style16">CREDIT</span></td>
  </tr>
</table>
<table width="857" border="1">
  <tr>
    <td>';
echo $header;
?>
	<table  border="1" width="847">
  	<?php 

	$pg=0;
	$pgCtr=1;
	for($x=0;$x<$myCtr;$x++){?>
	 <tr>
    		<td width="100"><span class="style16"><?php echo $list_glacode[$x];?></span></td>
    		<td width="200"><span class="style16"><?php echo $list_accname[$x];?></span></td>
		<td width="240"><span class="style16"><?php echo $list_narrative[$x];?></span></td>
    		<td width="140" class="number"><span class="style16"><?php echo number_format($list_db[$x],2);?></span></td>
    		<td width="140" class="number"><span class="style16"><?php echo number_format($list_cr[$x],2);?></span></td>
  	 </tr>
	<?php 

	if($pg>=29){
		echo '<tr><td colspan=5>Page '.$pgCtr.' </td></tr></table></table>';
		for($y=0;$y<=18;$y++)
                echo '<br>';
		echo $header.'<table width="857" border="1">
  		<tr>
    		<td>';
		//echo $header;
		$pg=0;
		$pgCtr++;
	}else{
		$pg++;
	}
	
		} ?>
	</table>



    </td>
  </tr>
</table>
<table  border="1">
  <tr>
    <td width="555"><div align="center" class="style17">TOTAL</div></td>
    <td width="139" class="number"><?php echo number_format($totaldb,2);?></td>
    <td width="144" class="number"><?php echo number_format($totalcr,2);?></td>
  </tr>
  
</table>

<table width="857" height="30" border="1">
      <tr>
        <td><span class="style6">Prepared by:<?php echo ' '.$_GET['Uname'];?></span></td>
      </tr>
	<tr>
        <td>Page <?=$pgCtr?> </td>
  </tr>    
    </table></td>

<p align="left" class="style5">&nbsp;</p>
</font>
</body>

</html>


<script>
 function printTkt(){
  //window.print();

}
</script>

