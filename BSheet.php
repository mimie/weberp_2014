<?php

include ('includes/session.inc');
$title = _('Balance Sheet');
include('includes/header.inc');
include('myFunctions.php');
echo '<p class="page_title_text"><img src="'.$rootpath.'/css/'.$theme.'/images/money_add.png" title="' . _('Search') . '" alt="" />' . ' ' . $title.'</p>';

if (!isset($_POST['Show'])) {
	echo '<form action="' . htmlspecialchars($_SERVER['PHP_SELF'], ENT_QUOTES, 'UTF-8') . '" method="post">';
	echo '<input type="hidden" name="FormID" value="' . $_SESSION['FormID'] . '" />';

	echo '<table class="selection">';
	echo '<tr><th colspan="3">' . _('Selection Date Period') . '</th></tr>';
	


	///~~~~~~Period from

        $NextYear = date('Y-m-d',strtotime('+1 Year'));
        $sql = "SELECT periodno,
                                        lastdate_in_period
                                FROM periods
                                WHERE lastdate_in_period < '" . $NextYear . "'
                                ORDER BY periodno DESC";
        $Periods = DB_query($sql,$db);



	////~~~~~~~~Period To

	 if (!isset($_POST['ToPeriod']) OR $_POST['ToPeriod']==''){
                $DefaultToPeriod = GetPeriod(date($_SESSION['DefaultDateFormat'],mktime(0,0,0,Date('m')+1,0,Date('Y'))),$db);
        } else {
                $DefaultToPeriod = $_POST['ToPeriod'];
        }

        echo '<tr>
                        <td>' . _('Select Period:') .'</td>
                        <td><select name="ToPeriod">';

        $RetResult = DB_data_seek($Periods,0);
        while ($myrow=DB_fetch_array($Periods,$db)){

                if($myrow['periodno']==$DefaultToPeriod){
                        echo '<option selected="selected" value="' 
				. $myrow['periodno'] . '">' 
				. MonthAndYearFromSQLDate($myrow['lastdate_in_period']) 
			. '</option>';
                } else {
                        echo '<option value ="' . $myrow['periodno'] . '">' 
				. MonthAndYearFromSQLDate($myrow['lastdate_in_period']) 
			. '</option>';
                }
        }
        echo '</select></td>
                </tr>
                </table>';

	////~~~~~~~End of Period To

	/*echo '<tr><td>' . _('Journals Dated Between') . ':</td>
		<td>' . _('From') . ':'. '<input type="text" name="FromTransDate" class="date" alt="'.$_SESSION['DefaultDateFormat'].'" maxlength="10" size="11" value="" /></td>
		<td>' . _('To') . ':'. '<input type="text" name="ToTransDate" class="date" alt="'.$_SESSION['DefaultDateFormat'].'" maxlength="10" size="11" value="" /></td>
		</tr>';*/

	echo '</table>';
	echo '<br /><div class="centre"><input type="submit" name="Show" value"' . _('Show transactions'). '" /></div>';
	echo '</form>';
} else {
	$sql2="SELECT * FROM periods WHERE periodno=".$_POST['ToPeriod'];
	$result2 = DB_query($sql2, $db);
        $row= DB_fetch_array($result2); 
        $curPeriod=$row['lastdate_in_period'];
	

	$sql2="SELECT * FROM periods WHERE periodno=".($_POST['ToPeriod']-1);
	$result2 = DB_query($sql2, $db);
	$row= DB_fetch_array($result2);	
	$lastMonth=$row['lastdate_in_period'];

	

	$sql="SELECT 
		gltrans.typeno, 
		gltrans.trandate, 
		gltrans.account, 
		chartmaster.accountname, 
		chartmaster.normal_balance, 
		chartmaster.glacode, 
		chartmaster.group_, 

		SUM(CASE WHEN gltrans.periodno = '".$_POST['ToPeriod']."' THEN gltrans.amount ELSE 0 END ) AS currentBalance, 
		SUM(CASE WHEN gltrans.periodno < '".$_POST['ToPeriod']."' THEN gltrans.amount ELSE 0 END ) AS currentBeg, 
		SUM(CASE WHEN gltrans.periodno = '".($_POST['ToPeriod']-1)."' THEN gltrans.amount ELSE 0 END ) AS lastMonth,
		SUM(CASE WHEN gltrans.periodno < '".($_POST['ToPeriod']-1)."' THEN gltrans.amount ELSE 0 END ) AS lastBeg, 
		SUM(CASE WHEN gltrans.periodno = '".($_POST['ToPeriod']-12)."' THEN gltrans.amount ELSE 0 END ) AS lastYear
		
		FROM gltrans INNER JOIN chartmaster ON chartmaster.accountcode = gltrans.account 
		WHERE chartmaster.glacode LIKE '1-%' OR chartmaster.glacode LIKE '2-%' OR chartmaster.glacode LIKE '3-%'
		GROUP BY gltrans.account 
		ORDER BY chartmaster.glacode";


	//die($sql);
	$result = DB_query($sql, $db);
	if (DB_num_rows($result)==0) {
		prnMsg(_('There are no transactions for this account in the date range selected'), 'info');
	} else {

			$asOf='For the Month of '. MonthAndYearFromSQLDate($curPeriod);
			echo '<b>'.$asOf.'</b>';
                        echo '<table class="selection">';
		

	

		$LastGroup='';
		$totalcp=0;
		$totallp=0;
		$totally=0;
		$subtotalcp=0;
                $subtotallp=0;
                $subtotally=0;
		$head=0;

		$totalbeg=0;
		$totalend=0;
		$list_glacode=array();
		$list_accname=array();
		$list_net=array();
		$list_db=array();
		$list_cr=array();
		$list_beg=array();
		$list_end=array();
		while ($myrow = DB_fetch_array($result)){
		if($myrow['group_']!=$LastGroup){
			 if($head!=0){
			 echo '<tr class="EvenTableRows">	
					<td></td>
					<td>'.$LastGroup.'</td>
					<td class="number">'.reverse_sign($subtotalcp).'</td>
					<td class="number">'.reverse_sign($subtotallp).'</td>
					<td class="number">'.reverse_sign($subtotally).'</td>
				</tr>';
			 }
			 echo '<tr><td colspan=2> <h2>'.$myrow['group_'].'</h2></td></tr>';
                	 echo '<tr>
                                <th>'._('Account Code').'</th>
                                <th>'._('Account Name').'</th>
				<th>'.date('F d',strtotime($curPeriod)).'</th>
                                <th>'.date('F d',strtotime($lastMonth)).'</th>
                                <th>'._('LastYear').'</th>
                        </tr>';
			$subtotalcp=0;
			$subtotallp=0;
			$subtotally=0;
			

		}

			$cur=$myrow['currentBalance']+$myrow['currentBeg'];
			$las=$myrow['lastMonth']+$myrow['lastBeg'];

			echo '<tr>
			 	<td>'.$myrow['glacode'].'</td>
				<td>'.$myrow['accountname'].'</td>
				<td class="number">'.reverse_sign($cur).'</td>
				<td class="number">'.reverse_sign($las).'</td>
				<td class="number">'.reverse_sign($myrow['lastYear']).'</td>
			</tr>';
			$subtotalcp+=$cur;
			$subtotallp+=$las;
			$subtotally+=$myrow['lastYear'];

			$totalcp+=$cur;
                        $totallp+=$las;
                        $totally+=$myrow['lastYear'];

			
			array_push($list_glacode,$myrow['glacode']);
			array_push($list_accname,$myrow['accountname']);
			array_push($list_db,$dbt);			
			array_push($list_cr,$cr);
			array_push($list_net,$net);
			array_push($list_beg,$beg);
			array_push($list_end,$end);
	
			$totaldb=$totaldb+$myrow['totalpositive'];
			$totalcr=$totalcr+$cr;
			$totalnet+=$net;
			$totalbeg+=$beg;
			$totalend+=$end;
			$LastGroup=$myrow['group_'];
			$head=1;

		}
		}
			 echo '<tr class="EvenTableRows">       
                                        <td></td>
                                        <td>'.$LastGroup.'</td>
                                        <td class="number">'.reverse_sign($subtotalcp).'</td>
                                        <td class="number">'.reverse_sign($subtotallp).'</td>
                                        <td class="number">'.reverse_sign($subtotally).'</td>
                                </tr>';

		
		$totalnet=$totaldb-$totalcr;
		$totalend=$totalbeg+$totalnet;	
		echo '<tr>
						<td colspan="1"></td>
						<td colspan="1"><b>Total</b></td>
						<td class="number">'.reverse_sign($totalcp).'</td>
						<td class="number">'.reverse_sign($totallp).'</td>
						<td class="number">'.reverse_sign($totally).'</td>
					</tr>';
		echo '</table>';
		
	 //end if no bank trans in the range to show

	echo '<form action="' . htmlspecialchars($_SERVER['PHP_SELF'], ENT_QUOTES, 'UTF-8') . '" method="post">';
	echo '<input type="hidden" name="FormID" value="' . $_SESSION['FormID'] . '" />';
	echo '<br /><div class="centre"><input type="submit" name="Return" value="' . _('Select Another Date'). '" /></div>';
	echo '</form>';
	//echo 'Here '.$_POST['NumberFrom'];
 $myUrl=$rootpath .'/print/printBSheet.php?uname='.$Uname;
	echo '<form method="POST" action="'.$myUrl.'" target="blank">';
				echo '<input type="hidden" name="period" value="'.$_POST['ToPeriod'].'"/>';
  				echo '<input type="hidden" name="curDate" value="'.$curPeriod.'"/>';
				echo '<input type="hidden" name="lastDate" value="'.$lastMonth.'"/>';
	echo '<button name="Print" onclick="window.open("'.$myUrl.'")">Print';
	echo '</form>';


echo '<form method="POST" action="'.$myUrl.'&amp;export=1" target="blank">';
				echo '<input type="hidden" name="period" value="'.$_POST['ToPeriod'].'"/>';
                                echo '<input type="hidden" name="curDate" value="'.$curPeriod.'"/>';
                                echo '<input type="hidden" name="lastDate" value="'.$lastMonth.'"/>';
echo '<button name="Print" onclick="window.open("'.$myUrl.'")">Export to Excel';
echo '</form>';
}
include('includes/footer.inc');

?>
