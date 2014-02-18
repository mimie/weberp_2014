<?php

function myPost($eventType,$amount,$custName){
$db=mysql_connect('localhost', 'root', 'mysqladmin');
if (!$db) {
          die('Could not connect: ' . mysql_error());
 }

//************testing area
/*
echo date('Y-m-d');
echo '<br>';
echo myInsert('1','2','3','4');
die("**dito muna**");
*/




$narrative="Payment of ".$custName." for ".$eventType;

//***************GET LAST TYPENO
mysql_select_db("IIAP_DEV", $db);
$sql="SELECT typeno FROM systypes WHERE typeid=0;";
$result=mysql_query($sql);
$myrow=mysql_fetch_array($result);

$newNo=$myrow[0]+1;

$sql="UPDATE systypes SET typeno='".$newNo."' WHERE typeid=0";
mysql_query($sql);


//echo $sql;
//**********die('**dito muna**');





echo 'Journal Number: '.$newNo.'<br><br>';

$sql="SELECT * FROM postAccount WHERE transtype='".$eventType."';";

$result=mysql_query($sql) or die(mysql_error());

$a=0;
$b=0;
while($row=mysql_fetch_array($result)){

	echo $row['id'].'-'.$row['glCode'].'-';
	if($row['debitcredit']==0){
		$sql=myInsert($newNo,$row['glCode'],$narrative,$amount);
		echo $sql;
		mysql_query($sql);
		echo $amount;
	}
	elseif($row['withvat']==0){
		$amount=$amount*(-1);
		$sql=myInsert($newNo,$row['glCode'],$narrative,$amount);
    echo $sql;
		mysql_query($sql);
		echo $amount;
	}
	else{
		$vat=$amount/9.3333;

		if($row['vatact']==0){
			$newAmount=$amount-$vat;
			$newAmount=$newAmount*(-1);
			$sql=myInsert($newNo,$row['glCode'],$narrative,$newAmount);
    	echo $sql;
			mysql_query($sql);
			$a= $amount-$vat;
		}
		else{
			$newVat=$vat*(-1);
			$sql=myInsert($newNo,$row['glCode'],$narrative,$newVat);
	    echo $sql;
			mysql_query($sql);
			$b=$vat;
		}
	}
	echo '<br>';

}

$c=$a+$b;
echo '<br><br>'.$c;

}


function myInsert($typeno,$act,$narrative,$amount){

$insql="INSERT INTO gltrans (type,
                    typeno,
                    trandate,
                    periodno,
                    account,
                    narrative,
                    amount)
				VALUES ('0','".
								$typeno."',
								'".date('Y-m-d')."',
								'6',
								'".$act."',
								'".$narrative."',
								'".$amount."');";

return $insql;




}
?>
