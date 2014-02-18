<html>

<head>

<link rel="stylesheet" type="text/css" href="css/check.css" media="screen" />
<title>Print Check</title>
</head>
<style>
p.pos1{
  position:fixed;
  top:75px;
  left:60px;
  font-size: 8pt;
  font-family: Calibri;
}

p.pos2{
  position:fixed;
  top:53px;
  left:625px;
  font-size: 12pt;
  font-family: Calibri;
}

p.pos3{
  position:fixed;
  top:75px;
  left:60px;
  font-size: 15pt;
  font-family: Calibri;
}

p.pos4{
  position:fixed;
  top:85px;
  left:582px;
  font-size: 13pt;
  font-family: Calibri;
}

p.pos5{
  position:fixed;
  top:137px;
  left:180px;
  font-size: 9pt;
  font-family: Calibri;
}
</style>
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
$db=0;
$cr=0;
$totaldb=0;
$totalcr=0;
$suppname='';
$checkdate='';
$transdate='';
$checkno='';
$totalamt=0;
$list_amt=array();
$list_cr=array();
$list_db=array();
#die(print_r($result));
while($row=mysql_fetch_array($result)){
$db=0;
$cr=0;
        array_push($list_amt,$row['amount']);
        /*if($row['amount']<0){
                $db=$row['amount']*-1;
                $totaldb=$totaldb+$db;
        }else{
                $cr=$row['amount'];
                $totalcr=$totalcr+$cr;
        }*/
        array_push($list_db,$db);
        array_push($list_cr,$cr);

        $suppname=$row['suppname'];
        $checkdate=$row['checkdate'];
        $checkno=$row['chequeno'];
}
#die(print_r($row));
#die($myrow[2]);
if($list_amt[0]<0){
        $totalamt=$list_amt[0]*-1;
}else{
        $totalamt=$list_amt[0];
}

?>
<p class="pos1">(CV-<?=$_GET['voucherNum']?>)</p>
<p class="pos2"><?=date('M. d Y',strtotime($checkdate))?></p>
<p class="pos3">***<?=$suppname?>***</p>
<p class="pos4">***<?=number_format($totalamt,2)?>***</p>

<?php
include('myFunctions.php');
?>

<p class="pos5">**<?=number_to_words($totalamt).centavos($totalamt)?>**</p>

</body>

</html>


<script>
 function printTkt(){
 # window.print();

}
</script>

