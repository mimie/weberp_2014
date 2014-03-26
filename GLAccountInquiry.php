<?php

/* $Id: GLAccountInquiry.php 5239 2012-04-12 07:43:22Z vvs2012 $*/

include ('includes/session.inc');
$title = _('General Ledger Account Inquiry');
include('includes/header.inc');
include('includes/GLPostings.inc');

if (isset($_POST['Account'])){
	$SelectedAccount = $_POST['Account'];
} elseif (isset($_GET['Account'])){
	$SelectedAccount = $_GET['Account'];
}

if (isset($_POST['AccountTo'])){
        $SelectedAccount2 = $_POST['AccountTo'];
} elseif (isset($_GET['AccountTo'])){
        $SelectedAccount2 = $_GET['AccountTo'];
}

if (isset($_POST['Period'])){
	$SelectedPeriod = $_POST['Period'];
} elseif (isset($_GET['Period'])){
	$SelectedPeriod = $_GET['Period'];
}

echo '<p class="page_title_text"><img src="'.$rootpath.'/css/'.$theme.'/images/transactions.png" title="' . _('General Ledger Account Inquiry') . '" alt="" />' . ' ' . _('General Ledger Account Inquiry') . '</p>';

//echo '<div class="page_help_text">' . _('Use the keyboard Shift key to select multiple periods') . '</div><br />';

echo '<form method="post" action="' . htmlspecialchars($_SERVER['PHP_SELF'],ENT_QUOTES,'UTF-8') . '">';
echo '<div>';
echo '<input type="hidden" name="FormID" value="' . $_SESSION['FormID'] . '" />';

/*Dates in SQL format for the last day of last month*/
$DefaultPeriodDate = Date ('Y-m-d', Mktime(0,0,0,Date('m'),0,Date('Y')));



/*Show a form to allow input of criteria for TB to show */
echo '<table class="selection">';
echo '<tr><th colspan="2"><b>Accounts</b></th></tr>';
echo '<tr><td>'._('Account From').':</td><td><select name="Account">';
$sql = "SELECT accountcode, accountname, glacode FROM chartmaster ORDER BY glacode";
$Account = DB_query($sql,$db);
while ($myrow=DB_fetch_array($Account,$db)){
	if($myrow['accountcode'] == $SelectedAccount){
		echo '<option selected="selected" value="' . $myrow['accountcode'] . '">' . $myrow['glacode'] . ' ' . htmlspecialchars($myrow['accountname'], ENT_QUOTES, 'UTF-8', false) . '</option>';
	} else {
		echo '<option value="' . $myrow['accountcode'] . '">' . $myrow['glacode'] . ' ' . htmlspecialchars($myrow['accountname'], ENT_QUOTES, 'UTF-8', false) . '</option>';
	}
 }
echo '</select></td></tr>';


echo '<tr><td>'._('Account To').':</td><td><select name="AccountTo">';

$sql = "SELECT accountcode, accountname, glacode FROM chartmaster ORDER BY glacode";
$Account = DB_query($sql,$db);
while ($myrow=DB_fetch_array($Account,$db)){
        if($myrow['accountcode'] == $SelectedAccount2){
                echo '<option selected="selected" value="' . $myrow['accountcode'] . '">' . $myrow['glacode'] . ' ' . htmlspecialchars($myrow['accountname'], ENT_QUOTES, 'UTF-8', false) . '</option>';
        } else {
                echo '<option value="' . $myrow['accountcode'] . '">' . $myrow['glacode'] . ' ' . htmlspecialchars($myrow['accountname'], ENT_QUOTES, 'UTF-8', false) . '</option>';
        }
 }
echo '</select></td></tr>';

echo '<tr><td>&nbsp;</td></tr>';


//Select the tag

echo '<tr><th colspan="2"><b>Tags</b></th></tr>';

//FROM
echo '<tr><td>' . _('Tag From') . ':</td><td><select name="tag">';

$SQL = "SELECT tagref,
			tagdescription
		FROM tags
		ORDER BY tagref";

$result=DB_query($SQL,$db);
echo '<option value="0">0 - '._('All tags') . '</option>';
while ($myrow=DB_fetch_array($result)){
	if (isset($_POST['tag']) and $_POST['tag']==$myrow['tagref']){
		echo '<option selected="selected" value="' . $myrow['tagref'] . '">' . $myrow['tagref'].' - ' .$myrow['tagdescription'] . '</option>';
	} else {
		echo '<option value="' . $myrow['tagref'] . '">' . $myrow['tagref'].' - ' .$myrow['tagdescription'] . '</option>';
	}
}
echo '</select></td></tr>';

//TO
echo '<tr><td>' . _('Tag To') . ':</td><td><select name="tagTo">';

$SQL = "SELECT tagref,
                        tagdescription
                FROM tags
                ORDER BY tagref";

$result=DB_query($SQL,$db);
echo '<option value="0">0 - '._('All tags') . '</option>';
while ($myrow=DB_fetch_array($result)){
        if (isset($_POST['tagTo']) and $_POST['tagTo']==$myrow['tagref']){
                echo '<option selected="selected" value="' . $myrow['tagref'] . '">' . $myrow['tagref'].' - ' .$myrow['tagdescription'] . '</option>';
        } else {
                echo '<option value="' . $myrow['tagref'] . '">' . $myrow['tagref'].' - ' .$myrow['tagdescription'] . '</option>';
        }
}
echo '</select></td></tr>';


// End select tag


//dito po
echo '<tr><td>&nbsp;</td></tr>';
echo '<tr><th colspan="2"><b>Period<b></th></tr>';
echo '<tr style="background-color:#FDFEEF"><td colspan="2"><center>Use the keyboard Shift key to select multiple periods</center></td></tr>';
echo '<tr> <td>'._('For Period range').':</td><td><select name="Period[]" size="12" multiple="multiple">';
$sql = "SELECT periodno, lastdate_in_period FROM periods ORDER BY periodno DESC";
$Periods = DB_query($sql,$db);
$id=0;
while ($myrow=DB_fetch_array($Periods,$db)){
	if(isset($SelectedPeriod[$id]) and $myrow['periodno'] == $SelectedPeriod[$id]){
		echo '<option selected="selected" value="' . $myrow['periodno'] . '">' . _(MonthAndYearFromSQLDate($myrow['lastdate_in_period'])) . '</option>';
		$id++;
	} else {
		echo '<option value="' . $myrow['periodno'] . '">' . _(MonthAndYearFromSQLDate($myrow['lastdate_in_period'])) . '</option>';
	}
}
echo '</select></td></tr></table>';
echo '<br /><div class="centre"><input type="submit" name="Show" value="'._('Show Account Transactions').'" /></div>
      </div>
      </form>';

/* End of the Form  rest of script is what happens if the show button is hit*/

if (isset($_POST['Show'])){

	if (!isset($SelectedPeriod)){
		prnMsg(_('A period or range of periods must be selected from the list box'),'info');
		include('includes/footer.inc');
		exit;
	}
	/*Is the account a balance sheet or a profit and loss account */
	$result = DB_query("SELECT pandl
				FROM accountgroups
				INNER JOIN chartmaster ON accountgroups.groupname=chartmaster.group_
				WHERE chartmaster.accountcode='" . $SelectedAccount ."'",$db);
	$PandLRow = DB_fetch_row($result);
	if ($PandLRow[0]==1){
		$PandLAccount = True;
	}else{
		$PandLAccount = False; /*its a balance sheet account */
	}

	$FirstPeriodSelected = min($SelectedPeriod);
	$LastPeriodSelected = max($SelectedPeriod);

	if ($_POST['tag']==0) {
 		$sql= "SELECT type,
			typename,
			doc_ref,
			gltrans.typeno,
			trandate,
			narrative,
			amount,
			periodno,
			tag,
			glacode,
			gltrans.account,
			gltrans.voucherno
		FROM gltrans
		JOIN chartmaster ON gltrans.account=chartmaster.accountcode, systypes
		WHERE gltrans.account BETWEEN '" . $SelectedAccount . "' AND '" . $SelectedAccount2 . "'
		AND systypes.typeid=gltrans.type
		AND posted=1
		AND periodno>='" . $FirstPeriodSelected . "'
		AND periodno<='" . $LastPeriodSelected . "'
		ORDER BY periodno, gltrans.trandate, counterindex";

	} else {
 		$sql= "SELECT type,
			typename,
			doc_ref,
			gltrans.typeno,
			trandate,
			narrative,
			amount,
			periodno,
			tag,
			glacode,
			gltrans.account,
			normal_balance,
			gltrans.voucherno
		FROM gltrans
		JOIN chartmaster ON gltrans.account=chartmaster.accountcode, systypes
		WHERE gltrans.account BETWEEN '" . $SelectedAccount . "' AND '" . $SelectedAccount2 . "'
		AND systypes.typeid=gltrans.type
		AND posted=1
		AND periodno>= '" . $FirstPeriodSelected . "'
		AND periodno<= '" . $LastPeriodSelected . "'
		AND tag BETWEEN '".$_POST['tag']."' AND '".$_POST['tagTo']."'
		ORDER BY periodno, gltrans.trandate, counterindex";
	}
	//die($sql);
	$namesql = "SELECT accountname FROM chartmaster WHERE accountcode='" . $SelectedAccount . "'";
	$nameresult = DB_query($namesql, $db);
	$namerow=DB_fetch_array($nameresult);
	$SelectedAccountName=$namerow['accountname'];
	$ErrMsg = _('The transactions for account') . ' ' . $SelectedAccount . ' ' . _('could not be retrieved because') ;
	$TransResult = DB_query($sql,$db,$ErrMsg);

	echo '<br /><table class="selection">';

	echo '<tr><th colspan="9"><b>' ._('Transactions for account').' '.$SelectedAccount. ' - '. $SelectedAccountName.'</b></th></tr>';
	$TableHeader = '<tr>
			<th>' . _('Type') . '</th>
			<th>' . _('Ref. No') . '</th>
			<th>' . _('Date') . '</th>
			<th>' . _('Debit') . '</th>
			<th>' . _('Credit') . '</th>
			<th>' . _('Narrative') . '</th>
			<th>' . _('Balance') . '</th>
			<th>' . _('Account') . '</th>
			<th>' . _('Tag') . '</th>
			</tr>';

	echo $TableHeader;

	if ($PandLAccount==True) {
		$RunningTotal = 0;
	} else {
			// added to fix bug with Brought Forward Balance always being zero
					$sql = "SELECT bfwd,
						actual,
						period
					FROM chartdetails
					WHERE chartdetails.accountcode='" . $SelectedAccount . "'
					AND chartdetails.period='" . $FirstPeriodSelected . "'";

				$ErrMsg = _('The chart details for account') . ' ' . $SelectedAccount . ' ' . _('could not be retrieved');
				$ChartDetailsResult = DB_query($sql,$db,$ErrMsg);
				$ChartDetailRow = DB_fetch_array($ChartDetailsResult);
				// --------------------

		$RunningTotal =$ChartDetailRow['bfwd'];
		if ($RunningTotal < 0 ){ //its a credit balance b/fwd
			echo '<tr style="background-color:#FDFEEF">
				<td colspan="3"><b>' . _('Brought Forward Balance') . '</b><td>
				</td></td>
				<td class="number"><b>' . locale_number_format(-$RunningTotal,$_SESSION['CompanyRecord']['decimalplaces']) . '</b></td>
				<td></td>
				</tr>';
		} else { //its a debit balance b/fwd
			echo '<tr style="background-color:#FDFEEF">
				<td colspan="3"><b>' . _('Brought Forward Balance') . '</b></td>
				<td class="number"><b>' . locale_number_format($RunningTotal,$_SESSION['CompanyRecord']['decimalplaces']) . '</b></td>
				<td colspan="5"></td>
				</tr>';
		}
	}
	$PeriodTotal = 0;
	$PeriodNo = -9999;
	$ShowIntegrityReport = False;
	$j = 1;
	$k=0; //row colour counter
	$IntegrityReport='';
	while ($myrow=DB_fetch_array($TransResult)) {
		if ($myrow['periodno']!=$PeriodNo){
			if ($PeriodNo!=-9999){ //ie its not the first time around
				/*Get the ChartDetails balance b/fwd and the actual movement in the account for the period as recorded in the chart details - need to ensure integrity of transactions to the chart detail movements. Also, for a balance sheet account it is the balance carried forward that is important, not just the transactions*/

				$sql = "SELECT bfwd,
						actual,
						period
					FROM chartdetails
					WHERE chartdetails.accountcode='" . $SelectedAccount . "'
					AND chartdetails.period='" . $PeriodNo . "'";

				$ErrMsg = _('The chart details for account') . ' ' . $SelectedAccount . ' ' . _('could not be retrieved');
				$ChartDetailsResult = DB_query($sql,$db,$ErrMsg);
				$ChartDetailRow = DB_fetch_array($ChartDetailsResult);

				echo '<tr style="background-color:#FDFEEF">
					<td colspan="3"><b>' . _('Total for period') . ' ' . $PeriodNo . '</b></td>';
				if ($PeriodTotal < 0 ){ //its a credit balance b/fwd
					if ($PandLAccount==True) {
						$RunningTotal = 0;
					}
					echo '<td></td>
						<td class="number"><b>' . locale_number_format(-$PeriodTotal,$_SESSION['CompanyRecord']['decimalplaces']) . '</b></td>
						<td></td>
						</tr>';
				} else { //its a debit balance b/fwd
					if ($PandLAccount==True) {
						$RunningTotal = 0;
					}
					echo '<td class="number"><b>' . locale_number_format($PeriodTotal,$_SESSION['CompanyRecord']['decimalplaces']) . '</b></td>
						<td colspan="2"></td>
						</tr>';
				}
				$IntegrityReport .= '<br />' . _('Period') . ': ' . $PeriodNo  . _('Account movement per transaction') . ': '  . locale_number_format($PeriodTotal,$_SESSION['CompanyRecord']['decimalplaces']) . ' ' . _('Movement per ChartDetails record') . ': ' . locale_number_format($ChartDetailRow['actual'],$_SESSION['CompanyRecord']['decimalplaces']) . ' ' . _('Period difference') . ': ' . locale_number_format($PeriodTotal -$ChartDetailRow['actual'],3);

				if (ABS($PeriodTotal -$ChartDetailRow['actual'])>0.01){
					$ShowIntegrityReport = True;
				}
			}
			$PeriodNo = $myrow['periodno'];
			$PeriodTotal = 0;
		}

		if ($k==1){
			echo '<tr class="EvenTableRows">';
			$k=0;
		} else {
			echo '<tr class="OddTableRows">';
			$k++;
		}

		$RunningTotal += $myrow['amount'];
		$PeriodTotal += $myrow['amount'];


		$dr=0;
		$cr=0;

		if($myrow['normal_balance']=='DR'){
                                if($myrow['amount']<0){
                                        $cr=$myrow['amount']*-1;
                                        $totalcr=$totalcr+$cr;
                                }else{
                                        $dr=$myrow['amount'];
                                        $totaldb=$totaldb+$dr;
                                }
                }else{
                                if($myrow['amount']<0){
                                $cr=$myrow['amount']*-1;
                                $totalcr=$totalcr+$cr;
                                }else{
                                $dr=$myrow['amount'];
                                $totaldb=$totaldb+$dr;
                                }

                }

		/*if($myrow['amount']>=0){
			$DebitAmount = locale_number_format($myrow['amount'],$_SESSION['CompanyRecord']['decimalplaces']);
			$CreditAmount = '';
		} else {
			$CreditAmount = locale_number_format(-$myrow['amount'],$_SESSION['CompanyRecord']['decimalplaces']);
			$DebitAmount = '';
		}*/

		$FormatedTranDate = ConvertSQLDate($myrow['trandate']);
		$URL_to_TransDetail = $rootpath . '/GLTransInquiry.php?' . SID . '&amp;TypeID=' . $myrow['type'] . '&amp;TransNo=' . $myrow['typeno'];

		$tagsql="SELECT tagdescription FROM tags WHERE tagref=".$myrow['tag'];
		$tagresult=DB_query($tagsql,$db);
		$tagrow = DB_fetch_array($tagresult);
		
		if ($tagrow['tagdescription']=='') {
			$tagrow['tagdescription']=_('None');
		}
		printf('<td>%s</td>
			<td class="number"><a href="%s">%s</a></td>
			<td>%s</td>
			<td class="number">%s</td>
			<td class="number">%s</td>
			<td>%s</td>
			<td class="number"><b>%s</b></td>
			<td>%s</td>
			<td>%s</td>
			</tr>',
			$myrow['typename'],
			$URL_to_TransDetail,
			$myrow['doc_ref'].'-'.$myrow['voucherno'],
			$FormatedTranDate,
			number_format($dr,2),
			number_format($cr,2),
			$myrow['narrative'],
			locale_number_format($RunningTotal,$_SESSION['CompanyRecord']['decimalplaces']),
			$myrow['glacode'],
			$tagrow['tagdescription']);

	}

	echo '<tr style="background-color:#FDFEEF"><td colspan="3"><b>';
	if ($PandLAccount==True){
		echo _('Total Period Movement');
	} else { /*its a balance sheet account*/
		echo _('Balance C/Fwd');
	}
	echo '</b></td>';

	if ($RunningTotal >0){
		echo '<td class="number"><b>' . locale_number_format(($RunningTotal),$_SESSION['CompanyRecord']['decimalplaces']) . '</b></td><td colspan="2"></td></tr>';
	}else {
		echo '<td></td><td class="number"><b>' . locale_number_format((-$RunningTotal),$_SESSION['CompanyRecord']['decimalplaces']) . '</b></td><td colspan="2"></td></tr>';
	}
	echo '</table>';
 $myUrl=$rootpath .'/print/printAccountInquiry.php?';
 echo '<form method="POST" action="'.$myUrl.'" target="blank">';
 echo '<input name="AccountFrom" type="hidden" value="'.$SelectedAccount.'"/>';
 echo '<input name="AccountTo" type="hidden" value="' .$SelectedAccount2.'"/>';
 echo '<input name="TagFrom" type="hidden" value="'.$_POST['tag'].'"/>';
 echo '<input name="TagTo" type="hidden" value="' .$_POST['tagTo'].'"/>';
 echo '<input name="FirstPeriod" type="hidden" value="'. $FirstPeriodSelected.'"/>';
 echo '<input name="LastPeriod" type="hidden" value="' . $LastPeriodSelected.'"/>';

 echo '<button name="Print" onclick="window.open("'.$myUrl.'")">Print </button><br>';
 echo '</form>';



echo '<form method="POST" action="'.$myUrl.'export=1" target="blank">';
 echo '<input name="AccountFrom" type="hidden" value="'.$SelectedAccount.'"/>';
 echo '<input name="AccountTo" type="hidden" value="' .$SelectedAccount2.'"/>';
 echo '<input name="TagFrom" type="hidden" value="'.$_POST['tag'].'"/>';
 echo '<input name="TagTo" type="hidden" value="' .$_POST['tagTo'].'"/>';
 echo '<input name="FirstPeriod" type="hidden" value="'. $FirstPeriodSelected.'"/>';
 echo '<input name="LastPeriod" type="hidden" value="' . $LastPeriodSelected.'"/>';

 echo '<button name="CSV" onclick="window.open("'.$myUrl.'")">Export To Excel</button>';
 echo '</form>';

} /* end of if Show button hit */

//echo 'Here';


if (isset($ShowIntegrityReport) and $ShowIntegrityReport==True){
	if (!isset($IntegrityReport)) {$IntegrityReport='';}
	prnMsg( _('There are differences between the sum of the transactions and the recorded movements in the ChartDetails table') . '. ' . _('A log of the account differences for the periods report shows below'),'warn');
	echo '<p>'.$IntegrityReport;
}
include('includes/footer.inc');
?>
