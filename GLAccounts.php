<?php
/* $Id: GLAccounts.php 5617 2012-09-01 02:14:10Z daintree $*/

include('includes/session.inc');
$title = _('Chart of Accounts Maintenance');

include('includes/header.inc');

if (isset($_POST['SelectedAccount'])){
	$SelectedAccount = $_POST['SelectedAccount'];
} elseif (isset($_GET['SelectedAccount'])){
	$SelectedAccount = $_GET['SelectedAccount'];
}

echo '<p class="page_title_text"><img src="'.$rootpath.'/css/'.$theme.'/images/transactions.png" title="' .
		_('General Ledger Accounts') . '" alt="" />' . ' ' . $title . '</p>';

if (isset($_POST['submit'])) {

	//initialise no input errors assumed initially before we test
	$InputError = 0;

	/* actions to take once the user has clicked the submit button
	ie the page has called itself with some user input */

	//first off validate inputs sensible

	if (!is_long((integer)$_POST['AccountCode'])) {
		$InputError = 1;
		prnMsg(_('The account code must be an integer'),'warn');
	} elseif (mb_strlen($_POST['AccountName']) >50) {
		$InputError = 1;
		prnMsg( _('The account name must be fifty characters or less long'),'warn');
	}

	if (isset($SelectedAccount) AND $InputError !=1) {
		$glacod=$_POST['Segment1'] ."-".  $_POST['Segment2'] ."-". $_POST['Segment3'];
		$sql = "UPDATE chartmaster SET glacode='".$glacod."', accountname='" . $_POST['AccountName'] . "',
						normal_balance='".$_POST['Normal']."',
						group_='" . $_POST['Group'] . "'
				WHERE accountcode ='" . $SelectedAccount . "'";

		$ErrMsg = _('Could not update the account because');
		$result = DB_query($sql,$db,$ErrMsg);
		prnMsg (_('The general ledger account has been updated'),'success');
	} elseif ($InputError !=1) {

	/*SelectedAccount is null cos no item selected on first time round so must be adding a	record must be submitting new entries */

		$ErrMsg = _('Could not add the new account code');


		$glacode=$_POST['Segment1'] ."-".  $_POST['Segment2'] ."-". $_POST['Segment3'];
		$accode=$_POST['Segment1'] .$_POST['Segment2'];
		$sql = "INSERT INTO chartmaster (glacode,
						accountname,
						group_,normal_balance)
					VALUES ('" .$glacode ."',
							'" . $_POST['AccountName'] . "',
							'" . $_POST['Group'] . "',
							'" . $_POST['Normal']."')";
		$result = DB_query($sql,$db,$ErrMsg);

		prnMsg(_('The new general ledger account has been added'),'success');
	}

	unset ($_POST['Group']);
	unset ($_POST['AccountCode']);
	unset ($_POST['AccountName']);
	unset($SelectedAccount);

} elseif (isset($_GET['delete'])) {
//the link to delete a selected record was clicked instead of the submit button

// PREVENT DELETES IF DEPENDENT RECORDS IN 'ChartDetails'

	$sql= "SELECT COUNT(*)
			FROM chartdetails
			WHERE chartdetails.accountcode ='" . $SelectedAccount . "'
			AND chartdetails.actual <>0";
	$result = DB_query($sql,$db);
	$myrow = DB_fetch_row($result);
	if ($myrow[0]>0) {
		$CancelDelete = 1;
		prnMsg(_('Cannot delete this account because chart details have been created using this account and at least one period has postings to it'),'warn');
		echo '<br />' . _('There are') . ' ' . $myrow[0] . ' ' . _('chart details that require this account code');

	} else {
// PREVENT DELETES IF DEPENDENT RECORDS IN 'GLTrans'
		$sql= "SELECT COUNT(*)
				FROM gltrans
				WHERE gltrans.account ='" . $SelectedAccount . "'";

		$ErrMsg = _('Could not test for existing transactions because');

		$result = DB_query($sql,$db,$ErrMsg);

		$myrow = DB_fetch_row($result);
		if ($myrow[0]>0) {
			$CancelDelete = 1;
			prnMsg( _('Cannot delete this account because transactions have been created using this account'),'warn');
			echo '<br />' . _('There are') . ' ' . $myrow[0] . ' ' . _('transactions that require this account code');

		} else {
			//PREVENT DELETES IF Company default accounts set up to this account
			$sql= "SELECT COUNT(*) FROM companies
					WHERE debtorsact='" . $SelectedAccount ."'
					OR pytdiscountact='" . $SelectedAccount ."'
					OR creditorsact='" . $SelectedAccount ."'
					OR payrollact='" . $SelectedAccount ."'
					OR grnact='" . $SelectedAccount ."'
					OR exchangediffact='" . $SelectedAccount ."'
					OR purchasesexchangediffact='" . $SelectedAccount ."'
					OR retainedearnings='" . $SelectedAccount ."'";


			$ErrMsg = _('Could not test for default company GL codes because');

			$result = DB_query($sql,$db,$ErrMsg);

			$myrow = DB_fetch_row($result);
			if ($myrow[0]>0) {
				$CancelDelete = 1;
				prnMsg( _('Cannot delete this account because it is used as one of the company default accounts'),'warn');

			} else  {
				//PREVENT DELETES IF Company default accounts set up to this account
				$sql= "SELECT COUNT(*) FROM taxauthorities
					WHERE taxglcode='" . $SelectedAccount ."'
					OR purchtaxglaccount ='" . $SelectedAccount ."'";

				$ErrMsg = _('Could not test for tax authority GL codes because');
				$result = DB_query($sql,$db,$ErrMsg);

				$myrow = DB_fetch_row($result);
				if ($myrow[0]>0) {
					$CancelDelete = 1;
					prnMsg( _('Cannot delete this account because it is used as one of the tax authority accounts'),'warn');
				} else {
//PREVENT DELETES IF SALES POSTINGS USE THE GL ACCOUNT
					$sql= "SELECT COUNT(*) FROM salesglpostings
						WHERE salesglcode='" . $SelectedAccount ."'
						OR discountglcode='" . $SelectedAccount ."'";

					$ErrMsg = _('Could not test for existing sales interface GL codes because');

					$result = DB_query($sql,$db,$ErrMsg);

					$myrow = DB_fetch_row($result);
					if ($myrow[0]>0) {
						$CancelDelete = 1;
						prnMsg( _('Cannot delete this account because it is used by one of the sales GL posting interface records'),'warn');
					} else {
//PREVENT DELETES IF COGS POSTINGS USE THE GL ACCOUNT
						$sql= "SELECT COUNT(*)
								FROM cogsglpostings
								WHERE glcode='" . $SelectedAccount ."'";

						$ErrMsg = _('Could not test for existing cost of sales interface codes because');

						$result = DB_query($sql,$db,$ErrMsg);

						$myrow = DB_fetch_row($result);
						if ($myrow[0]>0) {
							$CancelDelete = 1;
							prnMsg(_('Cannot delete this account because it is used by one of the cost of sales GL posting interface records'),'warn');

						} else {
//PREVENT DELETES IF STOCK POSTINGS USE THE GL ACCOUNT
							$sql= "SELECT COUNT(*) FROM stockcategory
									WHERE stockact='" . $SelectedAccount ."'
									OR adjglact='" . $SelectedAccount ."'
									OR purchpricevaract='" . $SelectedAccount ."'
									OR materialuseagevarac='" . $SelectedAccount ."'
									OR wipact='" . $SelectedAccount ."'";

							$Errmsg = _('Could not test for existing stock GL codes because');

							$result = DB_query($sql,$db,$ErrMsg);

							$myrow = DB_fetch_row($result);
							if ($myrow[0]>0) {
								$CancelDelete = 1;
								prnMsg( _('Cannot delete this account because it is used by one of the stock GL posting interface records'),'warn');
							} else {
//PREVENT DELETES IF STOCK POSTINGS USE THE GL ACCOUNT
								$sql= "SELECT COUNT(*) FROM bankaccounts
								WHERE accountcode='" . $SelectedAccount ."'";
								$ErrMsg = _('Could not test for existing bank account GL codes because');

								$result = DB_query($sql,$db,$ErrMsg);

								$myrow = DB_fetch_row($result);
								if ($myrow[0]>0) {
									$CancelDelete = 1;
									prnMsg( _('Cannot delete this account because it is used by one the defined bank accounts'),'warn');
								} else {

									$sql = "DELETE FROM chartdetails WHERE accountcode='" . $SelectedAccount ."'";
									$result = DB_query($sql,$db);
									$sql="DELETE FROM chartmaster WHERE accountcode= '" . $SelectedAccount ."'";
									$result = DB_query($sql,$db);
									prnMsg( _('Account') . ' ' . $SelectedAccount . ' ' . _('has been deleted'),'succes');
								}
							}
						}
					}
				}
			}
		}
	}
}

if (!isset($_GET['delete'])) {

	echo '<form method="post" id="GLAccounts" action="' . htmlspecialchars($_SERVER['PHP_SELF'],ENT_QUOTES,'UTF-8') . '">';
    echo '<div>';
	echo '<input type="hidden" name="FormID" value="' . $_SESSION['FormID'] . '" />';

	if (isset($SelectedAccount)) {
		//editing an existing account

		$sql = "SELECT accountcode,glacode, accountname, group_, normal_balance FROM chartmaster WHERE accountcode='" . $SelectedAccount ."'";

		$result = DB_query($sql, $db);
		$myrow = DB_fetch_array($result);

		$_POST['AccountCode'] = $myrow['accountcode'];
		$_POST['AccountName']	= $myrow['accountname'];
		$_POST['GLCode']= $myrow['glacode'];
		$_POST['Group'] = $myrow['group_'];
		$nb=$myrow['normal_balance'];

		echo '<input type="hidden" name="SelectedAccount" value="' . $SelectedAccount . '" />';
		echo '<input type="hidden" name="AccountCode" value="' . $_POST['AccountCode'] .'" />';
		echo '<table class="selection" border=1>';
				/*'<tr><td>' . _('Account Code') . ':</td>
					<td>' . $_POST['AccountCode'] . '</td></tr>';*/
	} else {
	/*	echo '<table class="selection">';
		echo '<tr><td>' . _('Account Code') . ':</td>
				<td>
					<input type="text" name="Segment1" size="3" class="number" maxlength="1" />
			
					<input type="text" name="Segment2" size="3" class="number" maxlength="3" />
					

';
		 

		$sql = "SELECT s3code FROM accountcodeS3";
		 $result = DB_query($sql, $db);

 	    	 echo '<select name="Segment3">';

        	while ($myrow = DB_fetch_array($result)){
                if (isset($_POST['Group']) and $myrow[0]==$_POST['Group']){
                        echo '<option selected="selected" value="';
                } else {
                        echo '<option value="';
                }
                echo $myrow[0] . '">' . $myrow[0] . '</option>';
       		 }

		

*/
	}

	if (!isset($_POST['AccountName'])) {$_POST['AccountName']='';}
	
	echo '<table class="selection" border=1>';

	$GLSeg=explode("-",$_POST['GLCode']);
	//print_r( $GLSeg);	

  echo '<tr><td>' . _('Account Code') . ':</td>
                                <td>
   <input type="text" name="Segment1" size="3" class="number" maxlength="1" value="'.$GLSeg[0].'" />
   <input type="text" name="Segment2" size="3" class="number" maxlength="3" value="'.$GLSeg[1].'"/>
	';
  $sql = "SELECT s3code FROM accountcodeS3";
     $result = DB_query($sql, $db);
      echo '<select name="Segment3">';
       while ($myrow = DB_fetch_array($result)){
          if (isset($_POST['Group']) and $myrow[0]==$GLSeg[2]){
              echo '<option selected="selected" value="';
          } else {
              echo '<option value="';
          }
          echo $myrow[0] . '">' . $myrow[0] . '</option>';
       }
      
     echo '</select><a href="'.$rootpath.'/GLAccountS3.php"> Add New Segment3 Code</a></td></tr>';

	echo '<tr><td>' . _('Account Name') . ':</td><td><input type="text" size="51" maxlength="50" name="AccountName" value="' . $_POST['AccountName'] . '" /></td></tr>';

	$sql = "SELECT groupname FROM accountgroups ORDER BY sequenceintb";
	$result = DB_query($sql, $db);

	echo '<tr>
			<td>' . _('Account Group') . ':</td>
			<td><select name="Group">';

	while ($myrow = DB_fetch_array($result)){
		if (isset($_POST['Group']) and $myrow[0]==$_POST['Group']){
			echo '<option selected="selected" value="';
		} else {
			echo '<option value="';
		}
		echo $myrow[0] . '">' . $myrow[0] . '</option>';
	}
    echo '</select></td>
		</tr>';
echo '<tr><td>Normal Balance:</td>
					<td><select name="Normal">';
					if($nb=='CR'){
					echo '
                                        <option selected="selected" value="CR">CR</option>
                                        <option value="DR">DR</option>
                                        </select></td></tr>';
					}else{
					echo '
					<option selected="selected" value="DR">DR</option>
					<option value="CR">CR</option>
					</select></td></tr>';
					}

	if (!isset($_GET['SelectedAccount']) or $_GET['SelectedAccount']=='') {
		echo '<script  type="text/javascript">defaultControl(document.GLAccounts.AccountCode);</script>';
	} else {
		echo '<script  type="text/javascript">defaultControl(document.GLAccounts.AccountName);</script>';
	}

	echo '<tr><td></td><td><input type="submit" name="submit" value="'. _('Enter Information') . '" /></td></tr></table>';
    echo '</div>';


	echo '</form>';

} //end if record deleted no point displaying form to add record


if (!isset($SelectedAccount)) {
/* It could still be the second time the page has been run and a record has been selected for modification - SelectedAccount will exist because it was sent with the new call. If its the first time the page has been displayed with no parameters
then none of the above are true and the list of ChartMaster will be displayed with
links to delete or edit each. These will call the same page again and allow update/input
or deletion of the records*/

  echo '<form method="post" id="GLAccounts" action="' . htmlspecialchars($_SERVER['PHP_SELF'],ENT_QUOTES,'UTF-8') . '">';

        echo '<input type="hidden" name="FormID" value="' . $_SESSION['FormID'] . '" /> <br>';

 echo '<table border="1">
                <tr><th colspan=3 width=400><b>Filter</b></th></tr>
                <tr>
                        <td>Enter partial code OR name:</td>
                        <td><input type="text" name="TextSearch" size="30"/></td>
                        <td><input type="submit" name="Search"  value="Search" ></td>
                </tr>


        </table>';





if(!isset($_POST['TextSearch']) AND $_POST['TextSearch']==''){
	$sql = "SELECT accountcode,
			glacode,
			accountname,
			group_,
			normal_balance
		FROM chartmaster
		ORDER BY glacode";


}elseif(isset($_POST['TextSearch'])){

	$sql = "SELECT accountcode,
                        glacode,
                        accountname,
                        group_,
                        normal_balance
                FROM chartmaster
		WHERE glacode LIKE '%".$_POST['TextSearch']."%' OR
		accountname LIKE '%".$_POST['TextSearch']."%'
                ORDER BY glacode";
}
#die($sql);




/* $sql = "SELECT accountcode,
      glacode,
      accountname,
      group_,
      normal_balance,
      CASE WHEN pandl=0 THEN '" . _('Balance Sheet') . "' ELSE '" . _('Profit/Loss') . "' END AS acttype
    FROM chartmaster,
      accountgroups
    WHERE chartmaster.group_=accountgroups.groupname
    ORDER BY chartmaster.accountcode";
*/


	$ErrMsg = _('The chart accounts could not be retrieved because');
	echo '<br>';
	$result = DB_query($sql,$db,$ErrMsg);
	echo '</form>';
	$myUrl=$rootpath .'/print/printAccountList.php?totalbeg='.$totalbeg.'&amp;ctr='.$j;
	echo '<form method="POST" action="'.$myUrl.'" target="blank">';
        echo '<input type="hidden" name="glacode" value="'.implode(",",$list_glacode).'"/>';
        echo '<button name="Print" onclick="window.open("'.$myUrl.'")">Download Account List</button>';
	echo '<br>';
	//echo '</form>';


	echo '<br /><table class="selection">';
	echo '<tr>
		<th>' . _('Account Code') . '</th>
		<th>' . _('Account Name') . '</th>
		<th>' . _('Account Group') . '</th>
		<th>' . _('Normal Balance'). '</th>
		<th colspan="2">&nbsp;</th>

	</tr>';

	$k=0; //row colour counter

	while ($myrow = DB_fetch_row($result)) {
		if ($k==1){
			echo '<tr class="EvenTableRows">';
			$k=0;
		} else {
			echo '<tr class="OddTableRows">';
			$k=1;
		}


	printf("<td>%s</td>
		<td>%s</td>
		<td>%s</td>
		<td>%s</td>
		<td><a href=\"%s&amp;SelectedAccount=%s\">" . _('Edit') . "</a></td>
		<td><a href=\"%s&amp;SelectedAccount=%s&amp;delete=1\" 
												onclick=\"return confirm('" . _
												('Are you sure you wish to delete this account? Additional checks will be performed in any event to ensure data integrity is not compromised.')
 								. "');\">" . _('Delete') . "</a></td>
		</tr>",
		htmlspecialchars($myrow[1],ENT_QUOTES,'UTF-8'),
		$myrow[2],
		$myrow[3],
		$myrow[4],
		htmlspecialchars($_SERVER['PHP_SELF'],ENT_QUOTES,'UTF-8') . '?',
		$myrow[0],
		htmlspecialchars($_SERVER['PHP_SELF'],ENT_QUOTES,'UTF-8') . '?',
		$myrow[0]);

	}
	//END WHILE LIST LOOP
	echo '</table>';

	echo '</form>';
} //END IF selected ACCOUNT

//end of ifs and buts!

echo '<br />';

if (isset($SelectedAccount)) {
	echo '<div class="centre"><a href="' . htmlspecialchars($_SERVER['PHP_SELF'],ENT_QUOTES,'UTF-8') . '">' .  _('Show All Accounts') . '</a></div>';
}

include('includes/footer.inc');
?>
