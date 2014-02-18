<?php

include ('includes/session.inc');
$title = _('Daily Collection Turnover');
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
	echo '<tr>
		<td>' . _('Enter DCT Number') . ':'. '<input type="text" name="DCTNum" tabindex=1 /></td>
		</tr>';
	echo '</table>';
	echo '<br /><div class="centre"><input type="submit" name="Show" value"' . _('Show transactions'). '" /></div>';
	echo '</form>';
} else {
	$sql="SELECT gltrans.typeno, 
		gltrans.trandate, 
		gltrans.jobref, 
		gltrans.narrative, 
		gltrans.voucherno, 
		SUM(CASE WHEN gltrans.amount >0 THEN gltrans.amount ELSE 0 END ) AS totalamount, 
		gltrans.invoice
	FROM gltrans
	WHERE gltrans.type = '12'
	AND gltrans.invoice = '".$_POST['DCTNum']."'
	AND gltrans.amount > 0
	GROUP BY gltrans.typeno
	ORDER BY gltrans.typeno";
	//die($sql);
	$result = DB_query($sql, $db);
	if (DB_num_rows($result)==0) {
		prnMsg(_('There are no transactions for this account in the date range selected'), 'info');
	} else {
		echo '<table class="selection">';
		echo '<tr>
				<th>' . ('OR-Number') . '</th>
				<th>'._('Date Banked').'</th>
				<th>'._('Particulars').'</th>
				<th>'._('Receipt Type').'</th>
				<th>'._('Amount').'</th>
			</tr>';

		$LastJournal = 0;
		$totaldb=0;
		$totalcr=0;
		$list_glacode=array();
		$list_accname=array();
		$list_narrative=array();
		$list_db=array();
		$list_cr=array();
		$list_tags=array();
		$list_jv=array();
		$list_date=array();
		$list_ref=array();
		$transdate='';
		while ($myrow = DB_fetch_array($result)){
    			echo '<tr>
			<td>'.$myrow['voucherno'].'</td>	
			<td>'.$myrow['trandate'].'</td>
			<td>'.$myrow['narrative'].'</td>
			<td>'.$myrow['jobref'].'</td>
			<td>'.$myrow['totalamount'].'</td>
			</tr>';
			$transdate=$myrow['trandate'];
		}
	}
		echo '</table>';
		
	 //end if no bank trans in the range to show

	echo '<form action="' . htmlspecialchars($_SERVER['PHP_SELF'], ENT_QUOTES, 'UTF-8') . '" method="post">';
	echo '<input type="hidden" name="FormID" value="' . $_SESSION['FormID'] . '" />';
	echo '<br /><div class="centre"><input type="submit" name="Return" value="' . _('Select Another Date'). '" /></div>';
	echo '</form>';
	$myUrl=$rootpath .'/print/printDCT.php?dctno='.$_POST['DCTNum'].'&amp;uname='.$Uname.'&amp;tdate='.$transdate;
	echo '<form method="POST" action="'.$myUrl.'" target="blank">';
	echo '<button name="Print" onclick="window.open("'.$myUrl.'")">Print';
	echo '</form>';

}
include('includes/footer.inc');
?>
