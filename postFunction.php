<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<script>
  $(function() {
    $( "#dialog" ).dialog();
  });
  </script>
<?php


function myPost($eventType,$eventName,$amount,$custName,$custID,$billingNo,$billingDate){
$db=mysql_connect('10.110.215.92', 'iiap', 'mysqladmin');
//$db = mysql_connect('localhost', 'root', 'mysqladmin');
//$db = dbConnect();
if (!$db) {
          die('Could not connect: ' . mysql_error());
 }

$narrative="Accounts Receivable of ".$custName." for ".$eventName;

//***************GET LAST TYPENO
mysql_select_db("iiap_weberp2014", $db);
$sql="SELECT typeno FROM systypes WHERE typeid=5;";
$result=mysql_query($sql);
$myrow=mysql_fetch_array($result);

$newNo=$myrow[0]+1;

$sql="UPDATE systypes SET typeno='".$newNo."' WHERE typeid=5";
mysql_query($sql);


//echo "<script>alert('Billing is already posted.');</script>";
echo 'Journal Number: '.$newNo.'<br><br>';
$sql="SELECT * FROM postAccount WHERE transtype='".$eventType."';";
$result=mysql_query($sql) or die(mysql_error());

$a=0;
$b=0;

while($row=mysql_fetch_array($result)){
	//echo $row['id'].'-'.$row['glCode'].'-';
	if($row['debitcredit']==0){
		$sql=myInsert($newNo,$row['glCode'],$narrative,$amount,$custName,$custID,$billingNo,$billingDate,$eventType,$eventName);
		//echo $sql;
		mysql_query($sql);
		//echo $amount;
	}
	elseif($row['withvat']==0){
		$amount=$amount*(-1);
		$sql=myInsert($newNo,$row['glCode'],$narrative,$amount,$custName,$custID,$billingNo,$billingDate,$eventType,$eventName);
    		//echo $sql;
		mysql_query($sql);
		//echo $amount;
	}
	else{
		$vat=$amount/9.3333;

		if($row['vatact']==0){
			$newAmount=$amount-$vat;
			$newAmount=$newAmount*(-1);
			$sql=myInsert($newNo,$row['glCode'],$narrative,$newAmount,$custName,$custID,$billingNo,$billingDate,$eventType,$eventName);
    	//echo $sql;
			mysql_query($sql);
			$a= $amount-$vat;
		}
		else{
			$newVat=$vat*(-1);
			$sql=myInsert($newNo,$row['glCode'],$narrative,$newVat,$custName,$custID,$billingNo,$billingDate,$eventType,$eventName);
	    //echo $sql;
			mysql_query($sql);
			$b=$vat;
		}
	}
	echo '<br>';

}

//echo 'Journal Number: '.$newNo.'<br><br>';

$c=$a+$b;
//echo '<br><br>'.$c;

}


function myInsert($typeno,$act,$narrative,$amount,$custName,$custID,$billingNo,$billingDate,$eventType,$eventName){

$insql="INSERT INTO gltrans (type,
                    typeno,
                    trandate,
                    periodno,
                    account,
                    narrative,
                    amount,
		    suppcust,
		    voucherno,
		    checkdate,
		    jobref)
				VALUES ('5','".
								$typeno."',
								'".date('Y-m-d')."',
								'12',
								'".$act."',
								'".$narrative."',
								'".$amount."',
								'".$custID."',
								'".$billingNo."',
								'".$billingDate."',
								'".$eventType."-".$eventName."');";

return $insql;

}
?>
