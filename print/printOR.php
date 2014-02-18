<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=Content-Type content="text/html; charset=windows-1252">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 12">
<link rel=File-List href="IIAP%20OR%20Form%20Bago_files/filelist.xml">
<link rel="stylesheet" type="text/css" href="css/or2.css" media="screen" />
<title>Receipt for <?echo $_GET['CustomerName'];?></title>


</head>

<body onload="printTkt()">
<?include('myFunctions.php');?>
<?$myAmount=$_GET['myAmount'];?>

	
<div id="IIAP OR Form Bago_26516" align=center x:publishsource="Excel">

<table border=0 cellpadding=0 cellspacing=0 width=869 class=xl6726516
 style='border-collapse:collapse;table-layout:fixed;width:652pt'>
 <col class=xl6726516 width=14 style='mso-width-source:userset;mso-width-alt:
 512;width:11pt'>
 <col class=xl6726516 width=137 style='mso-width-source:userset;mso-width-alt:
 5010;width:103pt'>
 <col class=xl6726516 width=224 style='mso-width-source:userset;mso-width-alt:
 8192;width:168pt'>
 <col class=xl6726516 width=219 style='mso-width-source:userset;mso-width-alt:
 8009;width:164pt'>
 <col class=xl6726516 width=79 style='mso-width-source:userset;mso-width-alt:
 2889;width:59pt'>
 <col class=xl6726516 width=196 style='mso-width-source:userset;mso-width-alt:
 7168;width:147pt'>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl6726516 width=14 style='height:15.0pt;width:11pt'>&nbsp;</td>
  <td class=xl6926516 width=137 style='width:103pt'>&nbsp;</td>
  <td class=xl6326516 width=224 style='width:168pt'>&nbsp;</td>
  <td class=xl6326516 width=219 style='width:164pt'>&nbsp;</td>
  <td class=xl6426516 width=79 style='width:59pt'>&nbsp;</td>
  <td class=xl6426516 width=196 style='width:147pt'>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl6726516 style='height:15.0pt'>&nbsp;</td>
  <td class=xl7026516>&nbsp;</td>
  <td class=xl6526516>&nbsp;</td>
  <td class=xl6526516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl6726516 style='height:15.0pt'>&nbsp;</td>
  <td class=xl7026516>&nbsp;</td>
  <td class=xl6526516>&nbsp;</td>
  <td class=xl6526516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl6726516 style='height:15.0pt'>&nbsp;</td>
  <td class=xl7026516>&nbsp;</td>
  <td class=xl6526516>&nbsp;</td>
  <td class=xl6526516>&nbsp;</td>
  <td colspan=2 class=xl6626516>Date:<span style='mso-spacerun:yes'>
  </span><?php echo $_GET['myDate'];?></td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:19.5pt'>
  <td height=26 class=xl6726516 style='height:19.5pt'>&nbsp;</td>
  <td class=xl6726516>&nbsp;</td>
  <td class=xl6726516>&nbsp;</td>
  <td class=xl6726516>&nbsp;</td>
  <td colspan=2 rowspan=2 class=xl6826516>NO:<span style='mso-spacerun:yes'>
  </span>:<?php echo $_GET['ReceiptNumber'];?></td>
 </tr>
 <tr height=35 style='height:26.25pt'>
  <td height=35 class=xl6726516 style='height:26.25pt'>&nbsp;</td>
  <td colspan=3 class=xl7126516>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl6726516 style='height:15.0pt'>&nbsp;</td>
  <td class=xl7326516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl7326516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl6726516 style='height:15.0pt'>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516><?php echo $_GET['CustomerName'];?></td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6726516>&nbsp;</td>
  <td class=xl6726516>Tin</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl6726516 style='height:15.0pt'>&nbsp;</td>
  <td class=xl7326516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl6726516 style='height:15.0pt'>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516><?php echo number_to_words($myAmount);?></td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl7526516>&nbsp;</td>
  <td class=xl6726516>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl6726516 style='height:15.0pt'>&nbsp;</td>
  <td class=xl7326516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl7326516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl6726516 style='height:15.0pt'>&nbsp;</td>
  <td class=xl6426516>*Address*</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6726516>&nbsp;</td>
  <td class=xl6726516>(company only)</td>
 </tr>
 <tr height=8 style='mso-height-source:userset;height:6.0pt'>
  <td height=8 class=xl6726516 style='height:6.0pt'>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl6726516 style='height:15.0pt'>&nbsp;</td>
  <td class=xl7326516>&nbsp;</td>
  <td class=xl7326516>&nbsp;</td>
  <td class=xl7326516>&nbsp;</td>
  <td class=xl7326516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl6726516 style='height:15.0pt'>&nbsp;</td>
  <td colspan=2 class=xl7426516>&nbsp;</td>
  <td class=xl7426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl6726516 style='height:15.0pt'>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516><?php echo $_GET['myNarative'];?></td>
  <td class=xl6426516><?php echo number_format($myAmount,2);?></td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl7626516></td> <!--Types of receipt -->
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl6726516 style='height:15.0pt'>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516><?php echo $_GET['formPayment'];?></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl6726516 style='height:15.0pt'>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl6726516 style='height:15.0pt'>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl6726516 style='height:15.0pt'>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl6726516 style='height:15.0pt'>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl6726516 style='height:15.0pt'>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl6726516 style='height:15.0pt'>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl6726516 style='height:15.0pt'>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl6726516 style='height:15.0pt'>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl7226516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl6726516 style='height:15.0pt'>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl7226516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td colspan=2 class=xl7426516>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl6726516 style='height:15.0pt'>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl7226516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6726516>&nbsp;</td>
  <td class=xl6726516>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl6726516 style='height:15.0pt'>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl7226516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6726516>&nbsp;</td>
  <td class=xl6726516>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl6726516 style='height:15.0pt'>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl7226516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6726516>&nbsp;</td>
  <td class=xl6726516>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl6726516 style='height:15.0pt'>&nbsp;</td>
  <td class=xl6326516>&nbsp;</td>
  <td class=xl7226516>&nbsp;</td>
  <td class=xl6426516><?php echo number_format($myAmount,2);?></td>
  <td class=xl6726516>&nbsp;</td>
  <td class=xl6726516>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl6726516 style='height:15.0pt'>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6426516>&nbsp;</td>
  <td class=xl6726516>&nbsp;</td>
  <td class=xl6726516>&nbsp;</td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=14 style='width:11pt'></td>
  <td width=137 style='width:103pt'></td>
  <td width=224 style='width:168pt'></td>
  <td width=219 style='width:164pt'></td>
  <td width=79 style='width:59pt'></td>
  <td width=196 style='width:147pt'></td>
 </tr>
 <![endif]>
</table>

</div>


</body>

</html>

<script>
 function printTkt(){
  window.print();

}
</script>

