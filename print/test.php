<?php 

include('connectDb.php');

$accountList=array();


//$ctr=0;
/*$sql="SELECT accountcode FROM bankaccounts";

$result=mysql_query($sql);
while($row=mysql_fetch_array($result)){
	array_push($accountList,$row['accountcode']);

}*/



$sql="SELECT * FROM gltrans WHERE voucherno='2013-12-0002'";

//die($sql);
$result=mysql_query($sql);
echo '<table border=1>';
while($row=mysql_fetch_array($result)){

	$sql2="SELECT accountcode,currcode FROM bankaccounts WHERE accountcode='".$row['account']."'";
	
	$result2=mysql_query($sql2);
	$row2=mysql_fetch_array($result2);
	$curCode=$row2['currcode'];
	if(mysql_num_rows($result2)!=0){

		if($row['amount'] < 0){
                                $transtype='Direct Debit';
                }else{
                                $transtype='Direct Credit';
                        }
	
		$sql3="INSERT INTO banktrans(type,
                                                        transno,
                                                        bankact,
                                                        ref,
                                                        transdate,
                                                        banktranstype,
                                                        amount,
                                                        currcode)
			VALUES('".$row['type']."',
					'".$row['typeno']."',
					'".$row['account']."',
					'".$row['narrative']."',
					'".$row['trandate']."',
					'".$transtype."',
					'".$row['amount']."',
					'".$curCode."'
		
		)";
		mysql_query($sql3);		
	
	}

	/*else{
		$inList='This';
	}*/

?>




<?php
}
echo ' Ok? Check mo nah!';
?>
