<?php

include ('includes/session.inc');
$title = _('Reprint Check Voucher');
include('includes/header.inc');

echo '<p class="page_title_text"><img src="'.$rootpath.'/css/'.$theme.'/images/money_add.png" title="' . _('Search') . '" alt="" />' . ' ' . $title.'</p>';

if (!isset($_POST['Show'])) {
	echo '<form action="' . htmlspecialchars($_SERVER['PHP_SELF'], ENT_QUOTES, 'UTF-8') . '" method="post">';
	echo '<input type="hidden" name="FormID" value="' . $_SESSION['FormID'] . '" />';

	echo '<table class="selection">';
	echo '<tr><th colspan="3">' . _('Selection Criteria') . '</th></tr>';

	$sql = "SELECT typeno FROM systypes WHERE typeid=2 OR typeid=12";
	$result = DB_query($sql, $db);
	$myrow = DB_fetch_array($result);
	$MaxJournalNumberUsed = $myrow['typeno'];

#	echo '<tr>
#			<td>' . _('Journal Number Range') . ' (' . _('Between') . ' 1 ' . _('and') . ' ' . $MaxJournalNumberUsed . ')</td>
#			<td>' . _('From') . ':'. '<input type="text" class="number" name="NumberFrom" size="10" maxlength="11" value="1" />'.'</td>
			
#		</tr>';


		$FromDate=date('Y-m-d');

	echo '<tr><td>' . _('Enter Voucher Number:') . ':</td>
		<td><input type="text" name="FromTransDate" maxlength="10" size="11" /></td>
		
		</tr>';

	echo '</table>';
	echo '<br /><div class="centre"><input type="submit" name="Show" value"' . _('Show transactions'). '" /></div>';
	echo '</form>';
} else {

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
			LEFT JOIN suppliers
				ON suppliers.supplierid=gltrans.suppcust
			WHERE gltrans.voucherno='" .$_POST['FromTransDate']. "'	
			ORDER BY gltrans.counterindex DESC";
	$result = DB_query($sql, $db);
	#die($sql);
	if (DB_num_rows($result)==0) {
		prnMsg(_('There are no transactions for this account in the date range selected'), 'info');
	} else {

		echo $_POST['FromTransDate'];
		echo '<br><br><a href="'.$rootpath.'/print/printCheckBPI.php?voucherNum='.$_POST['FromTransDate'].'" target="blank" >Re-Print BPI Check </a>';
		echo '<br><br><a href="'.$rootpath.'/print/printCheckBDO.php?voucherNum='.$_POST['FromTransDate'].'" target="blank" >Re-Print BDO Check </a>';
		echo '<br><br><a href="'.$rootpath.'/print/printCheckBIR.php?voucherNum='.$_POST['FromTransDate'].'" target="blank" >Re-Print BIR Check </a>';
		echo '<table class="selection">';
		echo '<tr>
				<th>' . ('Voucher No.') . '</th>
				<th>'. ('Name') . '</th>
				<th>'._('Narrative').'</th>
				<th>'._('Check No.').'</th>
				<th>'._('Check Date').'</th>
				<th>'._('Debit').'</th>
				<th>'._('Credit').'</th>
			</tr>';

		$LastJournal = 0;
		$totaldb=0;
		$totalcr=0;
		$suppname='';
		$list_glacode=array();
		$list_accname=array();
		$list_chequeno=array();
		$list_narrative=array();
		$list_amt=array();
		$list_cr=array();
		$list_db=array();
		$list_tags=array();
		$list_jv=array();
		$list_date=array();
		$list_ref=array();
		while ($myrow = DB_fetch_array($result)){

		$db=0;
    		$cr=0;

			if ($myrow['tag']==0) {
				$myrow['tagdescription']='None';
			}

			
			echo '<tr><td colspan="8"</td></tr><tr>
				<td class="number">'.$myrow['voucherno'].'</td>';
			echo '<td>'.$myrow['suppname'].'</td>';
			echo '<td>'.$myrow['narrative'].'</td>
					<td>'.$myrow['chequeno'].'</td>
					<td>'.$myrow['checkdate'] .'</td>';
			

			if($myrow['normal_balance']=='DR'){
                                if($myrow['amount']>0){
                                $db=$myrow['amount'];
                                $totaldb=$totaldb+$db;
                                }else{
                                $cr=$myrow['amount']*-1;
                                $totalcr=$totalcr+$cr;
                                }
                        }
                        else{
                                if($myrow['amount']<0){
                                $cr=$myrow['amount']*-1;
                                $totalcr=$totalcr+$cr;
                                }else{
                                $db=$myrow['amount'];
                                $totaldb=$totaldb+$db;
                                }
			}
			echo '<td class="number">'.locale_number_format($db,$_SESSION['CompanyRecord']['decimalplaces']).'</td>';
			echo '<td class="number">'.locale_number_format($cr,$_SESSION['CompanyRecord']['decimalplaces']).'</td>';
			
			$suppname=$myrow['suppname'];
			array_push($list_jv,$myrow['voucherno']);
                        array_push($list_ref,$myrow['jobref']);
			array_push($list_narrative,$myrow['narrative']);
			array_push($list_chequeno,$myrow['chequeno']);
			array_push($list_date,$myrow['checkdate']);
			array_push($list_amt,$myrow['amount']);
			array_push($list_glacode,$myrow['glacode']);
			array_push($list_accname,$myrow['accountname']);
			array_push($list_db,$db);
			array_push($list_cr,$cr);
			
		}
		}
		/*echo '<tr>
						<td colspan="3"></td>
						<td colspan="1"><b>Total</b></td>
						<td>'.number_format($totaldb,2).'</td>
					</tr>';*/
		echo '</table>';
		
	 //end if no bank trans in the range to show

	echo '<form action="' . htmlspecialchars($_SERVER['PHP_SELF'], ENT_QUOTES, 'UTF-8') . '" method="post">';
	echo '<input type="hidden" name="FormID" value="' . $_SESSION['FormID'] . '" />';
	echo '<br /><div class="centre"><input type="submit" name="Return" value="' . _('Select Another Voucher'). '" /></div>';
	echo '</form>';
	
 $myUrl=$rootpath .'/print/printCV.php?voucherNum='.$_POST['FromTransDate'].'&amp;Uname='.$Uname;
	echo '<form method="POST" action="'.$myUrl.'" target="blank">';
				echo '<input type="hidden" name="glacode" value="'.implode("+",$list_glacode).'"/>';
  				echo '<input type="hidden" name="accname" value="'.implode("+",$list_accname).'"/>';
				echo '<input type="hidden" name="narrative" value="'.implode("+",$list_narrative).'"/>';
				echo '<input type="hidden" name="chequeno" value="'.implode("+",$list_chequeno).'"/>';
				echo '<input type="hidden" name="myDateList" value="'.implode("+",$list_date).'"/>';
				echo '<input type="hidden" name="jv" value="'.implode("+",$list_jv).'"/>';
				echo '<input type="hidden" name="amt" value="'.implode("+",$list_amt).'"/>';
				echo '<input type="hidden" name="db" value="'.implode("+",$list_db).'"/>';
				echo '<input type="hidden" name="cr" value="'.implode("+",$list_cr).'"/>';
				echo '<input type="hidden" name="totaldb" value="'.$totaldb.'"/>';
				echo '<input type="hidden" name="totalcr" value="'.$totalcr.'"/>';
				echo '<input type="hidden" name="suppname" value="'.$suppname.'">';

	echo '<button name="Print" onclick="window.open("'.$myUrl.'")">Print';
	echo '</form>';

}
include('includes/footer.inc');

?>
