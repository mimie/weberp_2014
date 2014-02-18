<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<style type="text/css">
<!--
.style1 {
	font-family: Calibri;
	font-size: 10pt;
}
.style13 {font-family: Calibri; font-size: 10pt; font-weight: bold; }
.style15 {
	font-family: Calibri;
	font-size: 14pt;
	font-weight: bold;
}
.style16 {
	font-size: 18pt;
	font-weight: bold;
	font-family: Calibri;
}
-->
</style>
</head>

<body>
<table width="844" border="0">
  <tr>
    <td width="713"><span class="style13">Institute of Internal Auditors Philippines, Inc.</span></td>
    <td width="121"><div align="right"><span class="style1">Page 2 of 2</span></div></td>
  </tr>
</table>
<p align="center" class="style16">CHECK\PAYMENT VOUCHER - JOURNAL ENTRY</p>
<table width="848" border="0">
  <tr>
    <td width="86"><span class="style13">Payee:</span></td>
    <td width="534"><?=$suppname?></td>
    <td width="101">&nbsp;</td>
    <td width="109">&nbsp;</td>
  </tr>
  <tr>
    <td><span class="style13">Check No.:</span></td>
    <td><?=$checkno?></td>
    <td><div align="right" class="style13">Date:</div></td>
    <td><?=$transdate?></td>
  </tr>
  <tr>
    <td><span class="style13">Check Date:</span></td>
    <td><?=$checkdate?></td>
    <td><div align="right" class="style13">Voucher No.:</div></td>
    <td>CV-<?=$_GET['voucherNum']?></td>
  </tr>
</table>
<table width="849" border="1">
  <tr>
    <th width="240"><span class="style13">ACCT. CODE</span></td>
    <th width="310"><span class="style13">ACCOUNT TITLE</span></td>
    <th width="120"><span class="style13">DEBIT</span></td>
    <th width="151"><span class="style13">CREDIT</span></td>
  </tr>
</table>
<table width="845"  border="1">
  <tr>
    <td><table width="838" border="0">
      <?php for($x=0;$x<$myCtr;$x++){ ?>
      <tr>
        <td width="239"><?=$list_glacode[$x]?></td>
        <td width="311"><?=$list_accname[$x]?></td>
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
<p>&nbsp;</p>
</body>
</html>

