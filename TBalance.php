<?php

include ('includes/session.inc');
$title = _('Trial Balance');
include('includes/header.inc');

echo '<p class="page_title_text"><img src="'.$rootpath.'/css/'.$theme.'/images/money_add.png" title="' . _('Search') . '" alt="" />' . ' ' . $title.'</p>';

if (!isset($_POST['Show'])) {
	echo '<form action="' . htmlspecialchars($_SERVER['PHP_SELF'], ENT_QUOTES, 'UTF-8') . '" method="post">';
	echo '<input type="hidden" name="FormID" value="' . $_SESSION['FormID'] . '" />';

	echo '<table class="selection">';
	echo '<tr><th colspan="3">' . _('Selection Criteria') . '</th></tr>';
	


	///~~~~~~Period from

	echo '<table class="selection">
                        <tr>
                                <td>' . _('Select Period From:') . '</td>
                                <td><select name="FromPeriod">';
        $NextYear = date('Y-m-d',strtotime('+1 Year'));
        $sql = "SELECT periodno,
                                        lastdate_in_period
                                FROM periods
                                WHERE lastdate_in_period < '" . $NextYear . "'
                                ORDER BY periodno DESC";
        $Periods = DB_query($sql,$db);


        while ($myrow=DB_fetch_array($Periods,$db)){
                if(isset($_POST['FromPeriod']) AND $_POST['FromPeriod']!=''){
                        if( $_POST['FromPeriod']== $myrow['periodno']){
                                echo '<option selected="selected" value="' . $myrow['periodno'] . '">' 
				.MonthAndYearFromSQLDate($myrow['lastdate_in_period']) . '</option>';
                        } else {
                                echo '<option value="' . $myrow['periodno'] . '">' 
				.MonthAndYearFromSQLDate($myrow['lastdate_in_period']) . '</option>';
                        }
                } else {
                        if($myrow['lastdate_in_period']==$DefaultFromDate){
                                echo '<option selected="selected" value="' . $myrow['periodno'] . '">' 
				.MonthAndYearFromSQLDate($myrow['lastdate_in_period']) . '</option>';
                        } else {
                                echo '<option value="' . $myrow['periodno'] . '">' 
				.MonthAndYearFromSQLDate($myrow['lastdate_in_period']) . '</option>';
                        }
                }
        }
        echo '</select></td>
                </tr>';


	////~~~~~~~End of Period From

	////~~~~~~~~Period To

	 if (!isset($_POST['ToPeriod']) OR $_POST['ToPeriod']==''){
                $DefaultToPeriod = GetPeriod(date($_SESSION['DefaultDateFormat'],mktime(0,0,0,Date('m')+1,0,Date('Y'))),$db);
        } else {
                $DefaultToPeriod = $_POST['ToPeriod'];
        }

        echo '<tr>
                        <td>' . _('Select Period To:') .'</td>
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
	$sql2="SELECT * FROM periods WHERE periodno=".$_POST['FromPeriod'];
	$result2 = DB_query($sql2, $db);
        $row= DB_fetch_array($result2); 
        $perFrom=$row['lastdate_in_period'];
	

	$sql2="SELECT * FROM periods WHERE periodno=".$_POST['ToPeriod'];
	$result2 = DB_query($sql2, $db);
	$row= DB_fetch_array($result2);	
	$perTo=$row['lastdate_in_period'];

	

	$sql="SELECT gltrans.typeno, 
        	gltrans.trandate, 
        	gltrans.account, 
        	chartmaster.accountname, 
        	chartmaster.normal_balance, 
        	chartmaster.glacode,
		chartmaster.group_,
        	gltrans.narrative, 
        	
		SUM(CASE WHEN gltrans.amount >0 AND  gltrans.periodno >= '".$_POST['FromPeriod']."' 
		AND gltrans.periodno <= '".$_POST['ToPeriod']."' THEN gltrans.amount ELSE 0 END ) AS totalpositive, 
        	
		SUM(CASE WHEN gltrans.amount <0 AND gltrans.periodno >= '".$_POST['FromPeriod']."'
                AND gltrans.periodno <= '".$_POST['ToPeriod']."' THEN gltrans.amount ELSE 0 END ) AS totalnegative, 
        	
        	gltrans.jobref, 
        	gltrans.voucherno
		FROM gltrans
		JOIN chartmaster ON gltrans.account = chartmaster.accountcode
		GROUP BY gltrans.account
		ORDER BY chartmaster.glacode";


	//die($sql);
	$result = DB_query($sql, $db);
	if (DB_num_rows($result)==0) {
		prnMsg(_('There are no transactions for this account in the date range selected'), 'info');
	} else {
		if($_POST['ToPeriod']!=$_POST['FromPeriod']){
			$asOf='From '. MonthAndYearFromSQLDate($perFrom).' to '. MonthAndYearFromSQLDate($perTo);
			echo '<b>'.$asOf.'</b>';
			echo '<table class="selection">';
		}else{
			$asOf='For the Month of '. MonthAndYearFromSQLDate($perFrom);
			echo '<b>'.$asOf.'</b>';
                        echo '<table class="selection">';
		}

		/*echo '<tr>
				<th>'._('Account Code').'</th>
				<th>'._('Account Description').'</th>
				<th>'._('Debit').'</th>
				<th>'._('Credit').'</th>
				<th>'._('Net Transaction').'</th>
				<th>'._('Ending Balance').'</th>
			</tr>';*/

		$LastGroup='';
		$totaldb=0;
		$totalcr=0;
		$totalnet=0;
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
			 echo '<tr><td colspan=2> <h2>'.$myrow['group_'].'</h2></td></tr>';
                	 echo '<tr>
                                <th>'._('Account Code').'</th>
                                <th>'._('Account Description').'</th>
				<th>'._('Beginning Balance').'</th>
                                <th>'._('Debit').'</th>
                                <th>'._('Credit').'</th>
                                <th>'._('Net Transaction').'</th>
                                <th>'._('Ending Balance').'</th>
                        </tr>';

		}

		$dbt=$myrow['totalpositive'];
		$cr=$myrow['totalnegative']*-1;
		$net=$dbt-$cr;


			$key=$myrow['account'];
			$sql2="SELECT SUM(amount) as beg
				FROM gltrans
				WHERE account=".$key." AND periodno<".$_POST['FromPeriod'];
			$result2 = DB_query($sql2, $db);
			//die($sql2);
			$row= DB_fetch_array($result2);
			$beg=$row['beg'];
			//echo $row['beg'].'Here';
		
			$end=$beg+$net;


			echo '<tr>
			 	<td>'.$myrow['glacode'].'</td>
				<td>'.$myrow['accountname'].'</td>
				<td class="number">'.number_format($beg,2).'</td>
				<td class="number">'.number_format($dbt,2).'</td>
				<td class="number">'.number_format($cr,2).'</td>
				<td class="number">'.number_format($net,2).'</td>
				<td class="number">'.number_format($end,2).'</td>
			</tr>';
			
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

		}
		}
		$totalnet=$totaldb-$totalcr;
		$totalend=$totalbeg+$totalnet;	
		echo '<tr>
						<td colspan="1"></td>
						<td colspan="1"><b>Total</b></td>
						<td class="number">'.number_format($totalbeg,2).'</td>
						<td class="number">'.number_format($totaldb,2).'</td>
						<td class="number">'.number_format($totalcr,2).'</td>
						<td class="number">'.number_format($totalnet,2).'</td>
						<td class="number">'.number_format($totalend,2).'</td>
					</tr>';
		echo '</table>';
		
	 //end if no bank trans in the range to show

	echo '<form action="' . htmlspecialchars($_SERVER['PHP_SELF'], ENT_QUOTES, 'UTF-8') . '" method="post">';
	echo '<input type="hidden" name="FormID" value="' . $_SESSION['FormID'] . '" />';
	echo '<br /><div class="centre"><input type="submit" name="Return" value="' . _('Select Another Date'). '" /></div>';
	echo '</form>';
	//echo 'Here '.$_POST['NumberFrom'];
 $myUrl=$rootpath .'/print/printTBalance.php?uname='.$Uname;
	echo '<form method="POST" action="'.$myUrl.'" target="blank">';
				echo '<input type="hidden" name="glacode" value="'.implode(",",$list_glacode).'"/>';
  				echo '<input type="hidden" name="accname" value="'.implode("_",$list_accname).'"/>';
				echo '<input type="hidden" name="db" value="'.implode("_",$list_db).'"/>';
				echo '<input type="hidden" name="cr" value="'.implode("_",$list_cr).'"/>';
				echo '<input type="hidden" name="net" value='.implode("_",$list_net).'/>';
				echo '<input type="hidden" name="beg" value='.implode("_",$list_beg).'/>';
				echo '<input type="hidden" name="end" value='.implode("_",$list_end).'/>';
				echo '<input type="hidden" name="totaldb" value="'.$totaldb.'"/>';
				echo '<input type="hidden" name="totalcr" value="'.$totalcr.'"/>';
				echo '<input type="hidden" name="totalnet" value="'.$totalnet.'"/>';
				echo '<input type="hidden" name="totalbeg" value="'.$totalbeg.'"/>';
				echo '<input type="hidden" name="totalend" value="'.$totalend.'"/>';
				echo '<input type="hidden" name="asOf" value="'.$asOf.'"/>';
	echo '<button name="Print" onclick="window.open("'.$myUrl.'")">Print';
	echo '</form>';


echo '<form method="POST" action="'.$myUrl.'&amp;export=1" target="blank">';
				echo '<input type="hidden" name="glacode" value="'.implode(",",$list_glacode).'"/>';
                                echo '<input type="hidden" name="accname" value="'.implode("_",$list_accname).'"/>';
                                echo '<input type="hidden" name="db" value="'.implode("_",$list_db).'"/>';
                                echo '<input type="hidden" name="cr" value="'.implode("_",$list_cr).'"/>';
                                echo '<input type="hidden" name="net" value='.implode("_",$list_net).'/>';
                                echo '<input type="hidden" name="beg" value='.implode("_",$list_beg).'/>';
                                echo '<input type="hidden" name="end" value='.implode("_",$list_end).'/>';
                                echo '<input type="hidden" name="totaldb" value="'.$totaldb.'"/>';
                                echo '<input type="hidden" name="totalcr" value="'.$totalcr.'"/>';
                                echo '<input type="hidden" name="totalnet" value="'.$totalnet.'"/>';
                                echo '<input type="hidden" name="totalbeg" value="'.$totalbeg.'"/>';
                                echo '<input type="hidden" name="totalend" value="'.$totalend.'"/>';
				echo '<input type="hidden" name="asOf" value="'.$asOf.'"/>';
echo '<button name="Print" onclick="window.open("'.$myUrl.'")">Export to Excel';
echo '</form>';
}
include('includes/footer.inc');

?>
