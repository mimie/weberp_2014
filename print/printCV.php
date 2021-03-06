<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Print Check Voucher</title>
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
</head>

<body onload="printTkt()">

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
                                suppliers.suppname,
				suppliers.address1,
				suppliers.taxref,
                                tags.tagdescription,
                                gltrans.jobref
                        FROM gltrans
                        INNER JOIN chartmaster
                                ON gltrans.account=chartmaster.accountcode
                        LEFT JOIN tags
                                ON gltrans.tag=tags.tagref
                        JOIN suppliers
                                ON suppliers.supplierid=gltrans.suppcust
                        WHERE gltrans.voucherno='" .$_GET['voucherNum']. "' 
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
$address='';
$tin='';
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
	array_push($list_accname,$row['accountname']);
	$nar='';
        $narLen=strlen($row['narrative']);

        if($narLen>50){
                $nar=substr($row['narrative'],0,50).'...';
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
	$address=$row['address1'];
	$tin=$row['taxref'];
	$checkdate=$row['checkdate'];
	$transdate=$row['trandate'];
	$checkno=$row['chequeno'];
}
#die($myrow[2]);
if($list_amt[0]<0){
	$totalamt=$list_amt[0]*-1;
}else{
	$totalamt=$list_amt[0];
}

?>



<table width="845" border="0">
  <tr>
    <img src="http://54.225.135.82/weberpdev/companies/IIAP_DEV/logo.jpg" width="60" height="60" style="float:left">
    <td><span class="style4">Institute of Internal Auditors Philippines, Inc.</span></td>
  </tr>
  <tr>
    <td><span class="style4">Unit 702 Corporate Center 139 Valero St., Salcedo Village, Makati City 1227</span></td>
  </tr>
  <tr>
    <td><span class="style6">TIN No. 001-772-403-000 : (+632) 940-9551 / 940-9552 : Fax (+632) 325-0414 </span></td>
  </tr>
</table>
<p align="center" class="style17">CHECK\PAYMENT VOUCHER</p>
<table width="843" border="0">
  <tr>
    <td width="65"><span class="style6">Payee:</span></td>
    <td width="351"><span class="style4"><?=$suppname?></span></td>
    <td width="223"><div align="right" class="style4"><strong>Date:</strong></div></td>
    <td width="186"><?=$transdate?> </td>
  </tr>
  <tr>
    <td><span class="style16"></span></td>
    <td><span class="style4"><?=$address?></span></td>
    <td><div align="right" class="style4"><strong>Voucher No.:</strong></div></td>
    <td>CV-<?=$_GET['voucherNum']?></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><?=$tin?></td>
    <td><div align="right" class="style4"><strong>Check No.:</strong></div></td>
    <td><?=$checkno?></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td><div align="right" class="style4"><strong>Check Date:</strong></div></td>
    <td><?=$checkdate?></td>
  </tr>
</table>
<table width="844" border="1">
  <tr>
    <td width="647"><span class="style6">IN PAYMENT FOR:</span></td>
    <td width="187"><span class="style6">AMOUNT</span></td>
  </tr>
</table>
<table width="844" height="202" border="1">
  <tr>
    <td width="834"><table width="829" border="0">
      <tr>
        <td width="639">&nbsp;</td>
        <td width="180">&nbsp;</td>
      </tr>
      <tr>
        <td><?=$list_narrative[0]?></td>
        <td class="number"><?=number_format($totalamt,2)?></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
     
    </table></td>
  </tr>
</table>
<table width="845" height="44" border="1">
  <tr>

    <?php
	$myTotal=number_format($totalamt,2);
	$myWord=number_to_words($totalamt).' and '.centavos($totalamt);
    ?>
    <td width="516" height="38"><span class="style6">AMOUNT IN WORDS : </span><?=$myWord?> </td>
    <td width="117"><p class="style6">NET AMOUNT PAID (in figures)</p>    </td>
    <td width="190" class="number"><?=$myTotal?></td>
  </tr>
</table>
<table width="845" height="160" border="1">
  <tr>
    <td width="415"><table width="415" height="166" border="1">
      <tr>
        <td><span class="style6">Prepared by: <?=$_GET['Uname']?></span></td>
      </tr>
      <tr>
        <td><span class="style6">Verified by:</span></td>
      </tr>
      <tr>
        <td><span class="style6">Approved by:</span></td>
      </tr>
    </table></td>
    <td width="414"><p class="style6">This is to acknowledge receipt of above described payment/s from the Institute of Internal Auditors Philippines Inc.</p>
    <p align="center" class="style6">__________________________________________________</p>
    <p align="center" class="style6">SIGNATURE OVER PRINTED NAME \ DATE OF RECEIPT</p>
    <p>&nbsp;</p></td>
  </tr>
</table>
<p align="left" class="style7">&nbsp;</p>
</body>
</html>


<script>
 function printTkt(){
  //window.print();

}
</script>






<?php
$myCtr=count($list_narrative);


/*$array_glacode=explode("+",$_POST['glacode']);
$array_accname=explode("+",$_POST['accname']);
$array_db=explode("+",$_POST['db']);
$array_cr=explode("+",$_POST['cr']);
$totaldb=$_POST['totaldb'];
$totalcr=$_POST['totalcr'];
*/


if($myCtr>=5){
echo "<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>";
include('printCVJ.php');
}
else{
?><table width="849" border="1">
  <tr>
    <td width="140"><span class="style13">ACCT. CODE</span></td>
    <td width="400"><span class="style13">ACCOUNT TITLE</span></td>
    <td width="120"><span class="style13">DEBIT</span></td>
    <td width="151"><span class="style13">CREDIT</span></td>
  </tr>
</table>
<table width="845"  border="1">
  <tr>
    <td><table width="838" border="0">
      <?php for($x=0;$x<$myCtr;$x++){ ?>
      <tr>
        <td width="139"><?=$list_glacode[$x]?></td>
        <td width="399"><?=$list_accname[$x]?></td>
        <td width="123" class="number"><?=number_format($list_db[$x],2)?></td>
        <td width="147" class="number"><?=number_format($list_cr[$x],2)?></td>
      </tr>


      <?php } ?>

 </table></td>
  </tr>
</table>
<table width="847" height="43" border="1">
  <tr>
    <td width="560"><div align="center"><span class="style15">TOTAL</span></div></td>
    <td width="124" class="number"><?=number_format($totaldb,2)?></td>
    <td width="149" class="number"><?=number_format($totalcr,2)?></td>
  </tr>
</table>
<?php

}



?>















<?php
////////////////////////////////////////////////////////////////////////////////////


function centavos($Number){
$item=explode('.',number_format($Number,2));
$cent=$item[1]."/100 pesos only";
return $cent;
}



function number_to_words($Number) {
$item=explode('.',number_format($Number,2));
$cent=$item[1]."/100 pesos only";


    if (($Number < 0) OR ($Number > 999999999)) {
                prnMsg(_('Number is out of the range of numbers that can be expressed in words'),'error');
                return _('error');
    }

        $Millions = floor($Number / 1000000);
        $Number -= $Millions * 1000000;
        $Thousands = floor($Number / 1000);
        $Number -= $Thousands * 1000;
        $Hundreds = floor($Number / 100);
        $Number -= $Hundreds * 100;
        $NoOfTens = floor($Number / 10);
        $NoOfOnes = $Number % 10;

        $NumberInWords = '';

        if ($Millions) {
                $NumberInWords .= number_to_words($Millions) . ' ' . _('million');
        }

    if ($Thousands) {
                $NumberInWords .= (empty($NumberInWords) ? '' : ' ') . number_to_words($Thousands) . ' ' . _('thousand');
        }

    if ($Hundreds) {
                $NumberInWords .= (empty($NumberInWords) ? '' : ' ') . number_to_words($Hundreds) . ' ' . _('hundred');
        }

        $Ones = array(  0 => '',
                                        1 => _('one'),
                                        2 => _('two'),
                                        3 => _('three'),
                                        4 => _('four'),
                                        5 => _('five'),
                                        6 => _('six'),
                                        7 => _('seven'),
                                        8 => _('eight'),
                                        9 => _('nine'),
                                        10 => _('ten'),
                                        11 => _('eleven'),
                                        12 => _('twelve'),
                                        13 => _('thirteen'),
                                        14 => _('fourteen'),
                                        15 => _('fifteen'),
                                        16 => _('sixteen'),
                                        17 => _('seventeen'),
                                        18 => _('eighteen'),
                                        19 => _('nineteen')     );

        $Tens = array(  0 => '',
                                        1 => '',
                                        2 => _('twenty'),
                                        3 => _('thirty'),
                                        4 => _('forty'),
                                        5 => _('fifty'),
                                        6 => _('sixty'),
                                        7 => _('seventy'),
                                        8 => _('eighty'),
                                        9 => _('ninety') );


    if ($NoOfTens OR $NoOfOnes) {
                if (!empty($NumberInWords)) {
                        $NumberInWords .= ' ' . _('') . ' ';
                }

                if ($NoOfTens < 2){
                        $NumberInWords .= $Ones[$NoOfTens * 10 + $NoOfOnes];
                }
                else {
                        $NumberInWords .= $Tens[$NoOfTens];
                        if ($NoOfOnes) {
                                $NumberInWords .= '-' . $Ones[$NoOfOnes];
                        }
                }
        }

        if (empty($NumberInWords)){
                $NumberInWords = _('zero');
    }
	//die($NumberInWords);
        return $NumberInWords;
}

?>
