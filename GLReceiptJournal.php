<?php

include ('includes/session.inc');
$title = _('Cash Receipts Journal Summary');
include('includes/header.inc');

echo '<p class="page_title_text"><img src="'.$rootpath.'/css/'.$theme.'/images/money_add.png" title="' . _('Search') . '" alt="" />' . ' ' . $title.'</p>';

if (!isset($_POST['Show'])) {
	echo '<form action="' . htmlspecialchars($_SERVER['PHP_SELF'], ENT_QUOTES, 'UTF-8') . '" method="post">';
	echo '<input type="hidden" name="FormID" value="' . $_SESSION['FormID'] . '" />';

	echo '<table class="selection">';
	echo '<tr><th colspan="3">' . _('Selection Criteria') . '</th></tr>';

	$sql = "SELECT typeno FROM systypes WHERE typeid=12";
	$result = DB_query($sql, $db);
	$myrow = DB_fetch_array($result);
	$MaxJournalNumberUsed = $myrow['typeno'];

	echo '<tr>
			<td>' . _('Journal Number Range') . ' (' . _('Between') . ' 1 ' . _('and') . ' ' . $MaxJournalNumberUsed . ')</td>
			<td>' . _('From') . ':'. '<input type="text" class="number" name="NumberFrom" size="10" maxlength="11" value="1" />'.'</td>
			<td>' . _('To') . ':'. '<input type="text" class="number" name="NumberTo" size="10" maxlength="11" value="' . $MaxJournalNumberUsed . '" />'.'</td>
		</tr>';

	$sql = "SELECT MIN(trandate) AS fromdate,
					MAX(trandate) AS todate FROM gltrans WHERE  type=12";
	$result = DB_query($sql, $db);
	$myrow = DB_fetch_array($result);
	if (isset($myrow['fromdate']) and $myrow['fromdate'] != '') {
		$FromDate = $myrow['fromdate'];
		$ToDate = $myrow['todate'];
	} else {
		$FromDate=date('Y-m-d');
		$ToDate=date('Y-m-d');
	}

	echo '<tr><td>' . _('Journals Dated Between') . ':</td>
		<td>' . _('From') . ':'. '<input type="text" name="FromTransDate" class="date" alt="'.$_SESSION['DefaultDateFormat'].'" maxlength="10" size="11" value="' . ConvertSQLDate($FromDate) . '" /></td>
		<td>' . _('To') . ':'. '<input type="text" name="ToTransDate" class="date" alt="'.$_SESSION['DefaultDateFormat'].'" maxlength="10" size="11" value="' . ConvertSQLDate($ToDate) . '" /></td>
		</tr>';

	echo '</table>';
	echo '<br /><div class="centre"><input type="submit" name="Show" value"' . _('Show transactions'). '" /></div>';
	echo '</form>';
} else {

	$sql="SELECT gltrans.typeno,
				gltrans.trandate,
				gltrans.account,
				chartmaster.accountname,
				chartmaster.normal_balance,
				chartmaster.glacode,
				gltrans.narrative,
				gltrans.amount,
				gltrans.tag,
				tags.tagdescription,
				gltrans.jobref,
				gltrans.voucherno,
				gltrans.invoice,
				dm.name
			FROM gltrans
			LEFT JOIN chartmaster
				ON gltrans.account=chartmaster.accountcode
			LEFT JOIN tags
				ON gltrans.tag=tags.tagref
			LEFT JOIN debtortrans d
				ON gltrans.typeno=d.transno
			LEFT JOIN debtorsmaster dm
				ON d.debtorno=dm.debtorno
			WHERE gltrans.type='12'
				AND gltrans.trandate>='" . FormatDateForSQL($_POST['FromTransDate']) . "'
				AND gltrans.trandate<='" . FormatDateForSQL($_POST['ToTransDate']) . "'
				AND gltrans.typeno>='" . $_POST['NumberFrom'] . "'
				AND gltrans.typeno<='" . $_POST['NumberTo'] . "'
			ORDER BY gltrans.invoice, gltrans.voucherno, gltrans.typeno";
	//die($sql);
	$result = DB_query($sql, $db);
	if (DB_num_rows($result)==0) {
		prnMsg(_('There are no transactions for this account in the date range selected'), 'info');
	} else {
		echo '<table class="selection">';
		echo '<tr>
				<th>' .('DCT No.').'</th>
				<th>' . ('OR Number') . '</th>
				<th>'._('Date').'</th>
				<th>'._('Customer Name').'</th>
				<th>'._('Narrative').'</th>
				<th>'._('Account Code').'</th>
				<th>'._('Account Description').'</th>
				<th>'._('Debit').'</th>
				<th>'._('Credit').'</th>
				<th>'._('Tag').'</th>
			</tr>';

		$LastJournal = 0;
		$totaldb=0;
		$totalcr=0;
		$list_glacode=array();
		$list_accname=array();
		$list_narrative=array();
		$list_name=array();
		$list_db=array();
		$list_cr=array();
		$list_tags=array();
		$list_jv=array();
		$list_date=array();
		$list_dct=array();
		while ($myrow = DB_fetch_array($result)){
		$db=0;
    $cr=0;

			if ($myrow['tag']==0) {
				$myrow['tagdescription']='None';
			}

			if ($myrow['typeno']!=$LastJournal) {
				if(strlen($myrow['voucherno'])==4){
					$orar='AR-'.$myrow['voucherno'];
				}else{
					$orar='OR-'.$myrow['voucherno'];
				}
				echo '<tr><td colspan="8"</td></tr><tr>
					<td class="number">'.$myrow['invoice'].'</td>
					<td class="number">'.$orar.'</td>
					<td>'. ConvertSQLDate($myrow['trandate']) . '</td>';
					array_push($list_jv,$orar);
					array_push($list_dct,$myrow['invoice']);
					array_push($list_date, ConvertSQLDate($myrow['trandate']) );
			} else {
				echo '<tr><td colspan="3"></td>';
				array_push($list_jv,'');
				array_push($list_date,'');
				array_push($list_dct,'');
			}
			

			if($myrow['normal_balance']=='DR'){

				if($myrow['amount']<0){
                                        $cr=$myrow['amount']*-1;
                                        $totalcr=$totalcr+$cr;
                                }else{
                                        $db=$myrow['amount'];
                                        $totaldb=$totaldb+$db;
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
			echo '<td>'.$myrow['name'] .'</td>
					<td>'.$myrow['narrative'] .'</td>
					<td>'.$myrow['glacode'].'</td>
					<td>'.$myrow['accountname'].'</td>
					<td class="number">'.locale_number_format($db,$_SESSION['CompanyRecord']['decimalplaces']).'</td>
					<td class="number">'.locale_number_format($cr,$_SESSION['CompanyRecord']['decimalplaces']).'</td>
					<td class="number">'.$myrow['tag'] . ' - ' . $myrow['tagdescription'].'</td>';
			array_push($list_name,$myrow['name']);
			array_push($list_glacode,$myrow['glacode']);
			array_push($list_accname,$myrow['accountname']);
			array_push($list_narrative,$myrow['narrative']);
			array_push($list_db,$db);
			array_push($list_cr,$cr);
			array_push($list_tags,$myrow['tag']. ' - ' . $myrow['tagdescription']);
			if ($myrow['typeno']!=$LastJournal) {
				echo '<td class="number"><a href="PDFGLJournal.php?JournalNo='.$myrow['typeno'].'">'._('Print') .'</a></td></tr>';

				$LastJournal = $myrow['typeno'];
			} else {
				echo '<td colspan="1"></td></tr>';
			}

		}
		}
		echo '<tr>
						<td colspan="4"></td>
						<td colspan="1"><b>Total</b></td>
						<td>'.number_format($totaldb,2).'</td>
						<td>'.number_format($totalcr,2).'</td>
					</tr>';
		echo '</table>';
		
	 //end if no bank trans in the range to show

	echo '<form action="' . htmlspecialchars($_SERVER['PHP_SELF'], ENT_QUOTES, 'UTF-8') . '" method="post">';
	echo '<input type="hidden" name="FormID" value="' . $_SESSION['FormID'] . '" />';
	echo '<br /><div class="centre"><input type="submit" name="Return" value="' . _('Select Another Date'). '" /></div>';
	echo '</form>';
	
 $myUrl=$rootpath .'/print/printReceiptJournal.php?';
	echo '<form method="POST" action="'.$myUrl.'" target="blank">';
				echo '<input type="hidden" name="glacode" value="'.implode(",",$list_glacode).'"/>';
  				echo '<input type="hidden" name="accname" value="'.implode("+",$list_accname).'"/>';
				echo '<input type="hidden" name="custname" value="'.implode("+",$list_name).'"/>';
				echo '<input type="hidden" name="narrative" value="'.implode("+",$list_narrative).'"/>';
				echo '<input type="hidden" name="dct" value="'.implode("_",$list_dct).'"/>';
				echo '<input type="hidden" name="db" value="'.implode("*",$list_db).'"/>';
				echo '<input type="hidden" name="cr" value="'.implode("*",$list_cr).'"/>';
				echo '<input type="hidden" name="tags" value="'.implode("+",$list_tags).'"/>';
				echo '<input type="hidden" name="jv" value="'.implode("+",$list_jv).'"/>';
				echo '<input type="hidden" name="dates" value="'.implode("+",$list_date).'"/>';
				echo '<input type="hidden" name="totaldb" value="'.$totaldb.'"/>';
				echo '<input type="hidden" name="totalcr" value="'.$totalcr.'">';
				echo '<input type="hidden" name="date1" value="'. FormatDateForSQL($_POST['FromTransDate']).'">';
                                echo '<input type="hidden" name="date2" value="'. FormatDateForSQL($_POST['ToTransDate']).'">';
                                echo '<input type="hidden" name="num1" value="'. $_POST['NumberFrom'].'">';
                                echo '<input type="hidden" name="num2" value="'. $_POST['NumberTo'].'">';
	echo '<button name="Print" onclick="window.open("'.$myUrl.'")">Print';
	echo '</form>';


	echo '<form method="POST" action="'.$myUrl.'&amp;export=1" target="blank">';
                                echo '<input type="hidden" name="glacode" value="'.implode(",",$list_glacode).'"/>';
                        	echo '<input type="hidden" name="accname" value="'.implode("+",$list_accname).'"/>';
                                echo '<input type="hidden" name="custname" value="'.implode("+",$list_name).'"/>';
                                echo '<input type="hidden" name="narrative" value="'.implode("+",$list_narrative).'"/>';
				echo '<input type="hidden" name="dct" value="'.implode("_",$list_dct).'"/>';
                                echo '<input type="hidden" name="db" value="'.implode("*",$list_db).'"/>';
                                echo '<input type="hidden" name="cr" value="'.implode("*",$list_cr).'"/>';
                                echo '<input type="hidden" name="tags" value="'.implode("+",$list_tags).'"/>';
                                echo '<input type="hidden" name="jv" value="'.implode("+",$list_jv).'"/>';
                                echo '<input type="hidden" name="dates" value="'.implode("+",$list_date).'"/>';
                                echo '<input type="hidden" name="totaldb" value="'.$totaldb.'"/>';
                                echo '<input type="hidden" name="totalcr" value="'.$totalcr.'">';
                                echo '<input type="hidden" name="date1" value="'. FormatDateForSQL($_POST['FromTransDate']).'">';
                                echo '<input type="hidden" name="date2" value="'. FormatDateForSQL($_POST['ToTransDate']).'">';
                                echo '<input type="hidden" name="num1" value="'. $_POST['NumberFrom'].'">';
                                echo '<input type="hidden" name="num2" value="'. $_POST['NumberTo'].'">';
        echo '<button name="Export" onclick="window.open("'.$myUrl.'")">Export To Excel';
        echo '</form>';


}
include('includes/footer.inc');

?>
