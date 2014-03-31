<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=Content-Type content="text/html; charset=windows-1252">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 12">
<link rel=File-List href="IIAP%20DCT%20Form_files/filelist.xml">
<link rel="stylesheet" type="text/css" href="css/DCT.css">
</head>
<title>
Print DCT Form
</title>
<style type="text/css">
<!--

td.number {
    text-align: right;
}

-->
</style>

<body>

<?php
$totalcash=0;
$totalddeposit=0;
$totalccheck=0;
$totalpcheck=0;
$totalcollection=0;
$dct='';
include('connectDb.php');

$sql="SELECT gltrans.typeno, 
                gltrans.trandate, 
                gltrans.jobref, 
                gltrans.narrative, 
                gltrans.voucherno, 
                SUM(CASE WHEN gltrans.amount >0 THEN gltrans.amount ELSE 0 END ) AS totalamount, 
                gltrans.invoice
        FROM gltrans
        WHERE gltrans.type = '12'
        AND gltrans.invoice LIKE '".$_GET['dctno']."%'
        AND gltrans.amount > 0
        GROUP BY gltrans.typeno
        ORDER BY gltrans.typeno";


?>

<div id="IIAP DCT Form_32382" align=center x:publishsource="Excel">

<table border=0 cellpadding=0 cellspacing=0 width=814 class=xl6432382
 style='border-collapse:collapse;table-layout:fixed;width:614pt'>
 <col class=xl6432382 width=23 style='mso-width-source:userset;mso-width-alt:
 981;width:17pt'>
 <col class=xl6432382 width=50 style='mso-width-source:userset;mso-width-alt:
 2133;width:38pt'>
 <col class=xl6432382 width=53 span=7 style='mso-width-source:userset;
 mso-width-alt:2261;width:40pt'>
 <col class=xl6432382 width=77 style='mso-width-source:userset;mso-width-alt:
 3285;width:58pt'>
 <col class=xl6432382 width=47 style='mso-width-source:userset;mso-width-alt:
 2005;width:35pt'>
 <col class=xl6432382 width=53 span=4 style='mso-width-source:userset;
 mso-width-alt:2261;width:40pt'>
 <col class=xl6432382 width=17 span=2 style='mso-width-source:userset;
 mso-width-alt:725;width:13pt'>
 <tr height=21 style='height:15.75pt'>
  <td colspan=15 height=21 class=xl11232382 width=780 style='height:15.75pt;
  width:588pt'><a name="RANGE!A1:Q53">Institute of Internal Auditors Philippines, Inc.</a></td>
  <td class=xl11232382 width=17 style='width:13pt'></td>
  <td class=xl6432382 width=17 style='width:13pt'></td>
 </tr>
 <tr height=3 style='mso-height-source:userset;height:2.25pt'>
  <td colspan=15 height=3 class=xl11132382 style='height:2.25pt'></td>
  <td class=xl11132382></td>
  <td class=xl6432382></td>
 </tr>
 <tr height=24 style='height:18.0pt'>
  <td colspan=15 height=24 class=xl11032382 style='height:18.0pt'>DAILY
  COLLECTION TURNOVER</td>
  <td class=xl11032382></td>
  <td class=xl6432382></td>
 </tr>
 <tr class=xl10832382 height=17 style='height:12.75pt'>
  <td colspan=15 height=17 class=xl10932382 style='height:12.75pt'>(CASH/
  CHECK/ DIRECT DEPOSIT)</td>
  <td class=xl10932382></td>
  <td class=xl10832382></td>
 </tr>
 <tr height=6 style='mso-height-source:userset;height:4.9pt'>
  <td height=6 class=xl1532382 style='height:4.9pt'>`</td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl6432382></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl1532382 style='height:12.75pt'></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl6432382></td>
  <td class=xl6432382></td>
  <td class=xl1532382>DATE:</td>
  <td class=xl14832382 colspan=3><center><?=$_GET['tdate']?></center></td>
  <td class=xl1532382></td>
  <td class=xl6432382></td>
 </tr>
 <tr height=5 style='mso-height-source:userset;height:3.75pt'>
  <td height=5 class=xl1532382 style='height:3.75pt'></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl6432382></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 class=xl1532382 style='height:16.5pt'></td>
  <td colspan=2 rowspan=2 class=xl18232382 style='border-bottom:1.0pt solid black'>OR
  Ref#</td>
  <td colspan=8 class=xl18632382>A M O U N T</td>
  <td colspan=4 rowspan=2 class=xl18232382 style='border-right:1.0pt solid black;
  border-bottom:1.0pt solid black'>PARTICULARS</td>
  <td class=xl10732382></td>
  <td class=xl6432382></td>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl1532382 style='height:13.5pt'></td>
  <td colspan=2 class=xl16832382 style='border-right:1.0pt solid black'>CASH</td>
  <td colspan=2 class=xl16832382 style='border-right:1.0pt solid black;
  border-left:none'>DIRECT DEPOSIT</td>
  <td colspan=2 class=xl16832382 style='border-right:1.0pt solid black;
  border-left:none'>CURRENT CHECK</td>
  <td colspan=2 class=xl16832382 style='border-right:1.0pt solid black;
  border-left:none'>POST DATED CHECK</td>
  <td class=xl10732382></td>
  <td class=xl6432382></td>
 </tr>
 <tr height=4 style='mso-height-source:userset;height:3.0pt'>
  <td height=4 class=xl1532382 style='height:3.0pt'></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl6432382></td>
 </tr>
<?php 
//die($sql);
$result=mysql_query($sql);
$x=0;
while($row=mysql_fetch_array($result)){
$cash=0;
$ccheck=0;
$direct=0;
if($row['jobref']=='Cash'){
	$cash=$row['totalamount'];
	$totalcash=$totalcash+$cash;
}elseif($row['jobref']=='Cheque'){
	$ccheck=$row['totalamount'];
	$totalccheck=$totalccheck+$ccheck;
}elseif($row['jobref']=='Direct Credit'){
	$direct=$row['totalamount'];
	$totalddeposit=$totalddeposit+$direct;
}
$dct=$row['invoice'];
?>
 <tr class=xl10632382 height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl7432382 align=right style='height:20.1pt'><?=$x+1?></td>
  <td class="xl13132382 number" colspan=2><?=$row['voucherno']?></td>
  <td class="xl13132382 number" colspan=2><?=number_format($cash,2)?></td>
  <td class="xl13132382 number" colspan=2><?=number_format($direct,2)?></td>
  <td class="xl13132382 number" colspan=2><?=number_format($ccheck,2)?></td>
  <td class="xl13332382 number" colspan=2><?=number_format($post,2)?></td>
  <td class=xl13332382 colspan=4><?=$row['narrative']?></td>
  <td class=xl7432382></td>
  <td class=xl10632382></td>
 </tr>
<?php
$x++;
 }?>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl6432382 style='height:20.1pt'></td>
  <td class=xl10332382 colspan=2>Sub-total Collection</td>
  <td class="xl12832382 number" colspan=2><?=number_format($totalcash,2)?></td>
  <td class="xl12832382 number" colspan=2><?=number_format($totalddeposit,2)?></td>
  <td class="xl12832382 number" colspan=2><?=number_format($totalccheck,2)?></td>
  <td class="xl12832382 number" colspan=2><?=number_format($totalpcheck,2)?></td>
  <td class=xl10432382></td>
  <td class=xl10432382></td>
  <td class=xl10432382></td>
  <td class=xl10432382></td>
  <td class=xl10332382></td>
 </tr>
<?php $totalcol=$totalcash+$totalddeposit+$totalccheck+$totalpcheck;
$totalcheckcol=$totalccheck+$totalpcheck;
?>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl6432382 style='height:20.1pt'></td>
  <td class=xl10532382 colspan=2>Total Collection</td>
  <td class="xl13032382 number" colspan=2><b><?=number_format($totalcol,2)?><b></td>
  <td class=xl10332382></td>
  <td class=xl10332382></td>
  <td class=xl10332382></td>
  <td class=xl10332382></td>
  <td class=xl10332382></td>
  <td class=xl10332382></td>
  <td class=xl10432382></td>
  <td class=xl10432382></td>
  <td class=xl10432382></td>
  <td class=xl10432382></td>
  <td class=xl10432382></td>
  <td class=xl10332382></td>
 </tr>
 <tr height=12 style='mso-height-source:userset;height:9.6pt'>
  <td height=12 class=xl1532382 style='height:9.6pt'></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl6432382></td>
 </tr>
 <tr height=5 style='mso-height-source:userset;height:3.75pt'>
  <td height=5 class=xl10232382 style='height:3.75pt'>&nbsp;</td>
  <td class=xl9932382>&nbsp;</td>
  <td class=xl9932382>&nbsp;</td>
  <td class=xl9932382>&nbsp;</td>
  <td class=xl9932382>&nbsp;</td>
  <td class=xl9932382>&nbsp;</td>
  <td class=xl10132382>&nbsp;</td>
  <td class=xl9932382>&nbsp;</td>
  <td class=xl9932382>&nbsp;</td>
  <td class=xl9932382>&nbsp;</td>
  <td class=xl10132382>&nbsp;</td>
  <td class=xl10032382>&nbsp;</td>
  <td class=xl9932382>&nbsp;</td>
  <td class=xl9932382>&nbsp;</td>
  <td class=xl9932382>&nbsp;</td>
  <td class=xl9832382>&nbsp;</td>
  <td class=xl1532382></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl9732382 colspan=3 style='height:15.0pt'>Cash Breakdown:</td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td colspan=4 class=xl17332382 style='border-right:.5pt solid black'>Check
  Details</td>
  <td class=xl9632382 style='border-left:none'>&nbsp;</td>
  <td class=xl9532382><u style='visibility:hidden;mso-ignore:visibility'>&nbsp;</u></td>
  <td class=xl9432382 colspan=3>Prepared/Turned-over by:</td>
  <td class=xl6532382>&nbsp;</td>
  <td class=xl1532382></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl9332382 style='height:15.0pt'>&nbsp;</td>
  <td class=xl9232382 colspan=2>Denomination</td>
  <td class=xl9132382>Qty</td>
  <td colspan=2 class=xl17632382 style='border-right:.5pt solid black'>Total</td>
  <td colspan=3 class=xl17832382 style='border-right:.5pt solid black;
  border-left:none'>Bank/Check No.</td>
  <td class=xl9032382 style='border-top:none'>Check Date</td>
  <td colspan=2 class=xl18032382 style='border-right:.5pt solid black;
  border-left:none'>Amount</td>
  <td class=xl12632382 colspan=3><center><?=$_GET['uname']?></center></td>
  <td class=xl12532382>&nbsp;</td>
  <td class=xl6532382>&nbsp;</td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl7232382 style='height:18.0pt'>&nbsp;</td>
  <td class=xl8932382 colspan=2>Php 1,000</td>
  <td class=xl8832382>&nbsp;</td>
  <td class=xl1532382></td>
  <td class=xl1532382></td>
  <td class=xl7032382>&nbsp;</td>
  <td class=xl1532382></td>
  <td class=xl6932382>&nbsp;</td>
  <td class=xl1532382></td>
  <td class=xl7032382>&nbsp;</td>
  <td class=xl6932382>&nbsp;</td>
  <td class=xl11332382>&nbsp;</td>
  <td class=xl11332382>&nbsp;</td>
  <td class=xl11332382>&nbsp;</td>
  <td class=xl12532382>&nbsp;</td>
  <td class=xl6532382>&nbsp;</td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl8632382 style='height:18.0pt'>&nbsp;</td>
  <td class=xl8532382>Php 500</td>
  <td class=xl8532382>&nbsp;</td>
  <td class=xl8432382>&nbsp;</td>
  <td class=xl8332382>&nbsp;</td>
  <td class=xl8132382>&nbsp;</td>
  <td class=xl8232382 style='border-left:none'>&nbsp;</td>
  <td class=xl8332382>&nbsp;</td>
  <td class=xl8132382>&nbsp;</td>
  <td class=xl8332382>&nbsp;</td>
  <td class=xl8232382>&nbsp;</td>
  <td class=xl8132382>&nbsp;</td>
  <td colspan=4 class=xl14932382 style='border-right:1.0pt solid black;
  border-left:none'>(Name/Signature/Date)</td>
  <td class=xl6532382>&nbsp;</td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl8632382 style='height:18.0pt;border-top:none'>&nbsp;</td>
  <td class=xl8532382 style='border-top:none'>Php 200</td>
  <td class=xl8532382 style='border-top:none'>&nbsp;</td>
  <td class=xl8432382 style='border-top:none'>&nbsp;</td>
  <td class=xl8332382 style='border-top:none'>&nbsp;</td>
  <td class=xl8132382 style='border-top:none'>&nbsp;</td>
  <td class=xl8232382 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl8332382 style='border-top:none'>&nbsp;</td>
  <td class=xl8132382 style='border-top:none'>&nbsp;</td>
  <td class=xl8332382 style='border-top:none'>&nbsp;</td>
  <td class=xl8232382 style='border-top:none'>&nbsp;</td>
  <td class=xl8132382 style='border-top:none'>&nbsp;</td>
  <td class=xl8732382 colspan=2>Verified by:</td>
  <td class=xl7432382></td>
  <td class=xl7332382>&nbsp;</td>
  <td class=xl6532382>&nbsp;</td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl8632382 style='height:18.0pt;border-top:none'>&nbsp;</td>
  <td class=xl8532382 style='border-top:none'>Php 100</td>
  <td class=xl8532382 style='border-top:none'>&nbsp;</td>
  <td class=xl8432382 style='border-top:none'>&nbsp;</td>
  <td class=xl8332382 style='border-top:none'>&nbsp;</td>
  <td class=xl8132382 style='border-top:none'>&nbsp;</td>
  <td class=xl8232382 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl8332382 style='border-top:none'>&nbsp;</td>
  <td class=xl8132382 style='border-top:none'>&nbsp;</td>
  <td class=xl8332382 style='border-top:none'>&nbsp;</td>
  <td class=xl8232382 style='border-top:none'>&nbsp;</td>
  <td class=xl8132382 style='border-top:none'>&nbsp;</td>
  <td colspan=4 class=xl16532382 style='border-right:1.0pt solid black;
  border-left:none'>Accounting Assistant</td>
  <td class=xl6532382>&nbsp;</td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl8632382 style='height:18.0pt;border-top:none'>&nbsp;</td>
  <td class=xl8532382 style='border-top:none'>Php 50</td>
  <td class=xl8532382 style='border-top:none'>&nbsp;</td>
  <td class=xl8432382 style='border-top:none'>&nbsp;</td>
  <td class=xl8332382 style='border-top:none'>&nbsp;</td>
  <td class=xl8132382 style='border-top:none'>&nbsp;</td>
  <td class=xl8232382 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl8332382 style='border-top:none'>&nbsp;</td>
  <td class=xl8132382 style='border-top:none'>&nbsp;</td>
  <td class=xl8332382 style='border-top:none'>&nbsp;</td>
  <td class=xl8232382 style='border-top:none'>&nbsp;</td>
  <td class=xl8132382 style='border-top:none'>&nbsp;</td>
  <td class=xl7432382></td>
  <td class=xl7432382></td>
  <td class=xl7432382></td>
  <td class=xl7332382>&nbsp;</td>
  <td class=xl6532382>&nbsp;</td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl8632382 style='height:18.0pt;border-top:none'>&nbsp;</td>
  <td class=xl8532382 style='border-top:none'>Php 20</td>
  <td class=xl8532382 style='border-top:none'>&nbsp;</td>
  <td class=xl8432382 style='border-top:none'>&nbsp;</td>
  <td class=xl8332382 style='border-top:none'>&nbsp;</td>
  <td class=xl8132382 style='border-top:none'>&nbsp;</td>
  <td class=xl8232382 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl8332382 style='border-top:none'>&nbsp;</td>
  <td class=xl8132382 style='border-top:none'>&nbsp;</td>
  <td class=xl8332382 style='border-top:none'>&nbsp;</td>
  <td class=xl8232382 style='border-top:none'>&nbsp;</td>
  <td class=xl8132382 style='border-top:none'>&nbsp;</td>
  <td colspan=4 class=xl14932382 style='border-right:1.0pt solid black;
  border-left:none'>(Name/Signature/Date)</td>
  <td class=xl6532382>&nbsp;</td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl8632382 style='height:18.0pt;border-top:none'>&nbsp;</td>
  <td class=xl8532382 colspan=2>USD$ 100/ Php 10</td>
  <td class=xl8432382 style='border-top:none'>&nbsp;</td>
  <td class=xl8332382 style='border-top:none'>&nbsp;</td>
  <td class=xl8132382 style='border-top:none'>&nbsp;</td>
  <td class=xl8232382 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl8332382 style='border-top:none'>&nbsp;</td>
  <td class=xl8132382 style='border-top:none'>&nbsp;</td>
  <td class=xl8332382 style='border-top:none'>&nbsp;</td>
  <td class=xl8232382 style='border-top:none'>&nbsp;</td>
  <td class=xl8132382 style='border-top:none'>&nbsp;</td>
  <td class=xl8732382 colspan=2>Deposited by:</td>
  <td class=xl7432382></td>
  <td class=xl7332382>&nbsp;</td>
  <td class=xl6532382>&nbsp;</td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl8632382 style='height:18.0pt;border-top:none'>&nbsp;</td>
  <td class=xl8532382 colspan=2>USD$ 50/ Php 5</td>
  <td class=xl8432382 style='border-top:none'>&nbsp;</td>
  <td class=xl8332382 style='border-top:none'>&nbsp;</td>
  <td class=xl8132382 style='border-top:none'>&nbsp;</td>
  <td class=xl8232382 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl8332382 style='border-top:none'>&nbsp;</td>
  <td class=xl8132382 style='border-top:none'>&nbsp;</td>
  <td class=xl8332382 style='border-top:none'>&nbsp;</td>
  <td class=xl8232382 style='border-top:none'>&nbsp;</td>
  <td class=xl8132382 style='border-top:none'>&nbsp;</td>
  <td class=xl7432382></td>
  <td class=xl7432382></td>
  <td class=xl7432382></td>
  <td class=xl7332382>&nbsp;</td>
  <td class=xl6532382>&nbsp;</td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl8632382 style='height:18.0pt;border-top:none'>&nbsp;</td>
  <td class=xl8532382 colspan=2>USD$ 20/ Php 1</td>
  <td class=xl8432382 style='border-top:none'>&nbsp;</td>
  <td class=xl8332382 style='border-top:none'>&nbsp;</td>
  <td class=xl8132382 style='border-top:none'>&nbsp;</td>
  <td class=xl8232382 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl8332382 style='border-top:none'>&nbsp;</td>
  <td class=xl8132382 style='border-top:none'>&nbsp;</td>
  <td class=xl8332382 style='border-top:none'>&nbsp;</td>
  <td class=xl8232382 style='border-top:none'>&nbsp;</td>
  <td class=xl8132382 style='border-top:none'>&nbsp;</td>
  <td class=xl7432382></td>
  <td class=xl7432382></td>
  <td class=xl7432382></td>
  <td class=xl7332382>&nbsp;</td>
  <td class=xl6532382>&nbsp;</td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl8632382 style='height:18.0pt;border-top:none'>&nbsp;</td>
  <td class=xl8532382 colspan=2>USD$ 10/ Php 0.25</td>
  <td class=xl8432382 style='border-top:none'>&nbsp;</td>
  <td class=xl8332382 style='border-top:none'>&nbsp;</td>
  <td class=xl8132382 style='border-top:none'>&nbsp;</td>
  <td class=xl8232382 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl8332382 style='border-top:none'>&nbsp;</td>
  <td class=xl8132382 style='border-top:none'>&nbsp;</td>
  <td class=xl8332382 style='border-top:none'>&nbsp;</td>
  <td class=xl8232382 style='border-top:none'>&nbsp;</td>
  <td class=xl8132382 style='border-top:none'>&nbsp;</td>
  <td colspan=4 class=xl14932382 style='border-right:1.0pt solid black;
  border-left:none'>(Name/Signature/Date)</td>
  <td class=xl6532382>&nbsp;</td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl8632382 style='height:18.0pt;border-top:none'>&nbsp;</td>
  <td class=xl8532382 colspan=2>USD$ 5/ Php 0.10</td>
  <td class=xl8432382 style='border-top:none'>&nbsp;</td>
  <td class=xl8332382 style='border-top:none'>&nbsp;</td>
  <td class=xl8132382 style='border-top:none'>&nbsp;</td>
  <td class=xl8232382 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl8332382 style='border-top:none'>&nbsp;</td>
  <td class=xl8132382 style='border-top:none'>&nbsp;</td>
  <td class=xl8332382 style='border-top:none'>&nbsp;</td>
  <td class=xl8232382 style='border-top:none'>&nbsp;</td>
  <td class=xl8132382 style='border-top:none'>&nbsp;</td>
  <td colspan=4 class=xl15632382 style='border-right:1.0pt solid black;
  border-left:none'>CTRL NO.</td>
  <td class=xl6532382>&nbsp;</td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl8032382 style='height:18.0pt;border-top:none'>&nbsp;</td>
  <td class=xl7932382 colspan=2>USD$ 1/ Php 0.05</td>
  <td class=xl7832382 style='border-top:none'>&nbsp;</td>
  <td class=xl7732382 style='border-top:none'>&nbsp;</td>
  <td class=xl7532382 style='border-top:none'>&nbsp;</td>
  <td class=xl7632382 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl7732382 style='border-top:none'>&nbsp;</td>
  <td class=xl7532382 style='border-top:none'>&nbsp;</td>
  <td class=xl7732382 style='border-top:none'>&nbsp;</td>
  <td class=xl7632382 style='border-top:none'>&nbsp;</td>
  <td class=xl7532382 style='border-top:none'>&nbsp;</td>
  <td colspan=4 rowspan=3 class=xl15932382 style='border-right:1.0pt solid black;
  border-bottom:1.0pt solid black'><?=$_GET['dctno']?></td>
  <td class=xl6532382>&nbsp;</td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl7232382 style='height:15.0pt'>&nbsp;</td>
  <td colspan=3 class=xl15232382 style='border-right:.5pt solid black'>Total
  Cash Collection<span style='mso-spacerun:yes'></span></td>
  <td class="xl11932382 number" colspan=2><?=number_format($totalcash,2)?></td>
  
  <td class=xl7032382>&nbsp;</td>
  <td class=xl1532382></td>
 
  <td class=xl7132382 colspan=2>Total Check Collection</td>
  <td class="xl12132382 number" colspan=2><?=number_format($totalcheckcol,2)?></td>
  <td class=xl6532382>&nbsp;</td>
 </tr>
 <tr height=7 style='mso-height-source:userset;height:5.25pt'>
  <td height=7 class=xl6832382 style='height:5.25pt'>&nbsp;</td>
  <td colspan=3 class=xl15432382 style='border-right:.5pt solid black'>&nbsp;</td>
  <td class=xl12032382>&nbsp;</td>
  <td class=xl12032382>&nbsp;</td>
  <td class=xl6732382>&nbsp;</td>
  <td class=xl6632382>&nbsp;</td>
  <td class=xl6632382>&nbsp;</td>
  <td class=xl6632382>&nbsp;</td>
  <td class=xl12332382>&nbsp;</td>
  <td class=xl12432382>&nbsp;</td>
  <td class=xl6532382>&nbsp;</td>
 </tr>
 <tr height=0 style='display:none;mso-height-source:userset;mso-height-alt:
  270'>
  <td class=xl6432382></td>
  <td class=xl6432382></td>
  <td class=xl6432382></td>
  <td class=xl6432382></td>
  <td class=xl6432382></td>
  <td class=xl6432382></td>
  <td class=xl6432382></td>
  <td class=xl6432382></td>
  <td class=xl6432382></td>
  <td class=xl6432382></td>
  <td class=xl6432382></td>
  <td class=xl6432382></td>
  <td class=xl6432382></td>
  <td class=xl6432382></td>
  <td class=xl6432382></td>
  <td class=xl6432382></td>
  <td class=xl6532382>&nbsp;</td>
 </tr>
 <tr height=0 style='display:none;mso-height-source:userset;mso-height-alt:
  255'>
  <td class=xl6432382></td>
  <td class=xl6432382></td>
  <td class=xl6432382></td>
  <td class=xl6432382></td>
  <td class=xl6432382></td>
  <td class=xl6432382></td>
  <td class=xl6432382></td>
  <td class=xl6432382></td>
  <td class=xl6432382></td>
  <td class=xl6432382></td>
  <td class=xl6432382></td>
  <td class=xl6432382></td>
  <td class=xl6432382></td>
  <td class=xl6432382></td>
  <td class=xl6432382></td>
  <td class=xl6432382></td>
  <td class=xl6532382>&nbsp;</td>
 </tr>
 <tr height=11 style='mso-height-source:userset;height:8.25pt'>
  <td height=11 class=xl6432382 style='height:8.25pt'></td>
  <td class=xl6432382></td>
  <td class=xl6432382></td>
  <td class=xl6432382></td>
  <td class=xl6432382></td>
  <td class=xl6432382></td>
  <td class=xl6432382></td>
  <td class=xl6432382></td>
  <td class=xl6432382></td>
  <td class=xl6432382></td>
  <td class=xl6432382></td>
  <td class=xl6432382></td>
  <td class=xl6432382></td>
  <td class=xl6432382></td>
  <td class=xl6432382></td>
  <td class=xl6432382></td>
  <td class=xl6532382>&nbsp;</td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=23 style='width:17pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=53 style='width:40pt'></td>
  <td width=53 style='width:40pt'></td>
  <td width=53 style='width:40pt'></td>
  <td width=53 style='width:40pt'></td>
  <td width=53 style='width:40pt'></td>
  <td width=53 style='width:40pt'></td>
  <td width=53 style='width:40pt'></td>
  <td width=77 style='width:58pt'></td>
  <td width=47 style='width:35pt'></td>
  <td width=53 style='width:40pt'></td>
  <td width=53 style='width:40pt'></td>
  <td width=53 style='width:40pt'></td>
  <td width=53 style='width:40pt'></td>
  <td width=17 style='width:13pt'></td>
  <td width=17 style='width:13pt'></td>
 </tr>
 <![endif]>
</table>

</div>



</body>

</html>

