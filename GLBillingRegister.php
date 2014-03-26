<?php

include ('includes/session.inc');
$title = _('Billing Register');
include('includes/header.inc');

echo '<p class="page_title_text"><img src="'.$rootpath.'/css/'.$theme.'/images/money_add.png" title="' . _('Search') . '" alt="" />' . ' ' . $title.'</p>';

if (!isset($_POST['Show'])) {
	echo '<form action="' . htmlspecialchars($_SERVER['PHP_SELF'], ENT_QUOTES, 'UTF-8') . '" method="post">';
	echo '<input type="hidden" name="FormID" value="' . $_SESSION['FormID'] . '" />';

	echo '<table class="selection">';
	echo '<tr><th colspan="3">' . _('Selection Criteria') . '</th></tr>';

	$sql = "SELECT typeno FROM systypes WHERE typeid=5";
	$result = DB_query($sql, $db);
	$myrow = DB_fetch_array($result);
	$MaxJournalNumberUsed = $myrow['typeno'];

	echo '<tr>
			<td>' . _('Journal Number Range') . ' (' . _('Between') . ' 1 ' . _('and') . ' ' . $MaxJournalNumberUsed . ')</td>
			<td>' . _('From') . ':'. '<input type="text" class="number" name="NumberFrom" size="10" maxlength="11" value="1" />'.'</td>
			<td>' . _('To') . ':'. '<input type="text" class="number" name="NumberTo" size="10" maxlength="11" value="' . $MaxJournalNumberUsed . '" />'.'</td>
		</tr>';

	$sql = "SELECT MIN(trandate) AS fromdate,
					MAX(trandate) AS todate FROM gltrans WHERE type=5";
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
				gltrans.suppcust,			
				gltrans.checkdate,
				debtorsmaster.name
			FROM gltrans
			INNER JOIN chartmaster
				ON gltrans.account=chartmaster.accountcode
			INNER JOIN debtorsmaster
				ON debtorsmaster.debtorno=gltrans.suppcust
			LEFT JOIN tags
				ON gltrans.tag=tags.tagref
			WHERE gltrans.type='5'
				AND gltrans.trandate>='" . FormatDateForSQL($_POST['FromTransDate']) . "'
				AND gltrans.trandate<='" . FormatDateForSQL($_POST['ToTransDate']) . "'
				AND gltrans.typeno>='" . $_POST['NumberFrom'] . "'
				AND gltrans.typeno<='" . $_POST['NumberTo'] . "'
			ORDER BY gltrans.typeno";
	//die($sql);
	$result = DB_query($sql, $db);
	if (DB_num_rows($result)==0) {
		prnMsg(_('There are no transactions for this account in the date range selected'), 'info');
	} else {
		echo '<b>From '.$_POST['FromTransDate'].' to '.$_POST['ToTransDate'].'</b>';
		echo '<table class="selection">';
		echo '<tr>
				<th>' ._('BS Date') . '</th>
				<th>' ._('BS No. ') . '</th>
				<th>' ._('Customer ID') . '</th>
				<th>' ._('Name') . '</th>
				<th>'._('Amount').'</th>
				<th>'._('Event').'</th>
			</tr>';

		$LastJournal = 0;
		$totaldb=0;
		$list_glacode=array();
		$list_accname=array();
		$list_name=array();
		$list_db=array();
		$list_custId=array();
		$list_jv=array();
		$list_event=array();
		$list_date=array();
		while ($myrow = DB_fetch_array($result)){
		$db=0;
    		$cr=0;

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

			if($db!=0){
			  if ($myrow['typeno']!=$LastJournal) {
                                  echo '<tr><td colspan="8"</td></tr><tr>
                                          <td class="number">'.$myrow['trandate'].'</td>
                                          <td>'.$myrow['voucherno'] . '</td>';
                                          array_push($list_jv,$myrow['voucherno']);
                                          array_push($list_date, ConvertSQLDate($myrow['trandate']) );
                          } else {
                                  echo '<tr><td colspan="2"></td>';
                                  array_push($list_jv,'');
                                  array_push($list_date,'');
                          }

			  echo '<td>'.$myrow['suppcust'].'</td>
					<td>'.$myrow['name'].'</td>
					<td class="number">'.locale_number_format($db,$_SESSION['CompanyRecord']['decimalplaces']).'</td>
					<td class="">'.$myrow['jobref'].'</td>';
			  array_push($list_custId,$myrow['suppcust']);
			  array_push($list_name,$myrow['name']);
			  array_push($list_db,$db);
			  array_push($list_event,$myrow['jobref']);
			}

		}
		}
		echo '<tr>
						<td colspan="3"></td>
						<td colspan="1"><b>Total</b></td>
						<td>'.number_format($totaldb,2).'</td>
					</tr>';
		echo '</table>';
		
	 //end if no bank trans in the range to show

	echo '<form action="' . htmlspecialchars($_SERVER['PHP_SELF'], ENT_QUOTES, 'UTF-8') . '" method="post">';
	echo '<input type="hidden" name="FormID" value="' . $_SESSION['FormID'] . '" />';
	echo '<br /><div class="centre"><input type="submit" name="Return" value="' . _('Select Another Date'). '" /></div>';
	echo '</form>';
	//echo 'Here '.$_POST['NumberFrom'];
 $myUrl=$rootpath .'/print/printBillingRegister.php?uname='.$Uname;
	echo '<form method="POST" action="'.$myUrl.'" target="blank">';
				echo '<input type="hidden" name="name" value="'.implode("+",$list_name).'"/>';
				echo '<input type="hidden" name="db" value="'.implode("*",$list_db).'"/>';
				echo '<input type="hidden" name="custId" value="'.implode("+",$list_custId).'"/>';
				echo '<input type="hidden" name="jv" value="'.implode("+",$list_jv).'"/>';
				echo '<input type="hidden" name="dates" value="'.implode("+",$list_date).'"/>';
				echo '<input type="hidden" name="event" value="'.implode("+",$list_event).'"/>';
				echo '<input type="hidden" name="totaldb" value="'.$totaldb.'"/>';
				echo '<input type="hidden" name="date1" value="'. FormatDateForSQL($_POST['FromTransDate']).'">';
				echo '<input type="hidden" name="date2" value="'. FormatDateForSQL($_POST['ToTransDate']).'">';
				echo '<input type="hidden" name="num1" value="'. $_POST['NumberFrom'].'">';
				echo '<input type="hidden" name="num2" value="'. $_POST['NumberTo'].'">';
	echo '<button name="Print" onclick="window.open("'.$myUrl.'")">Print';
	echo '</form>';


echo '<form method="POST" action="'.$myUrl.'&amp;export=1" target="blank">';
        
				echo '<input type="hidden" name="name" value="'.implode("+",$list_name).'"/>';
                                echo '<input type="hidden" name="db" value="'.implode("*",$list_db).'"/>';
                                echo '<input type="hidden" name="custId" value="'.implode("+",$list_custId).'"/>';
                                echo '<input type="hidden" name="jv" value="'.implode("+",$list_jv).'"/>';
                                echo '<input type="hidden" name="dates" value="'.implode("+",$list_date).'"/>';
                                echo '<input type="hidden" name="event" value="'.implode("+",$list_event).'"/>';
                                echo '<input type="hidden" name="totaldb" value="'.$totaldb.'"/>';
                                echo '<input type="hidden" name="date1" value="'. FormatDateForSQL($_POST['FromTransDate']).'">';
                                echo '<input type="hidden" name="date2" value="'. FormatDateForSQL($_POST['ToTransDate']).'">';
                                echo '<input type="hidden" name="num1" value="'. $_POST['NumberFrom'].'">';
                                echo '<input type="hidden" name="num2" value="'. $_POST['NumberTo'].'">';



echo '<button name="Print" onclick="window.open("'.$myUrl.'")">Export to Excel';
echo '</form>';
}
include('includes/footer.inc');

?>
