<?php

/* $Id: GLTags.php 5185 2012-04-01 02:42:45Z vvs2012 $*/

include('includes/session.inc');
$title = _('Maintain General Ledger Tags');

include('includes/header.inc');

if (isset($_GET['SelectedTag'])) {
	if($_GET['Action']=='delete'){
		//first off test there are no transactions created with this tag
		$Result = DB_query("SELECT counterindex 
							FROM gltrans 
							WHERE tag='" . $_GET['SelectedTag'] . "'",$db);
		if (DB_num_rows($Result)>0){
			prnMsg(_('This tag cannot be deleted since there are already general ledger transactions created using it.'),'error');
		} else	{
			$Result = DB_query("DELETE FROM tags WHERE tagref='" . $_GET['SelectedTag'] . "'",$db);
			prnMsg(_('The selected tag has been deleted'),'success');
		}
		$Description='';
		$tagId='';
	} else {
		$sql="SELECT tagref, 
					tagdescription,
					tagid,
					startdate,
					enddate,
					budgetRevenue,
					budgetCost,
					venue,
					speaker,
					status
				FROM tags 
				WHERE tagref='".$_GET['SelectedTag']."'";
			
		$result= DB_query($sql,$db);
		$myrow = DB_fetch_array($result,$db);
		$ref=$myrow['tagref'];
		$Description = $myrow['tagdescription'];
		$tagId= $myrow['tagid'];
		$startdate=ConvertSQLDate($myrow['startdate']);
		$enddate=ConvertSQLDate($myrow['enddate']);
		$budget=$myrow['budgetRevenue'];
		$cost=$myrow['budgetCost'];
		//$profit=$budget-$cost;
		$venue=$myrow['venue'];
		$speaker=$myrow['speaker'];
		$status=$myrow['status'];
	}
} else {
	$Description='';
	$tagId='';
	$_GET['SelectedTag']='';
}

if (isset($_POST['submit'])) {
	$tgid=$_POST['Segment1'].'-'.$_POST['Segment2'].'-'.$_POST['Segment3'];
	$sql = "INSERT INTO tags(tagdescription,tagid,budgetRevenue,startdate,enddate,budgetCost,venue,speaker,status)
					values('" . $_POST['Description'] . "',
								'" . $tgid . "',
								'".$_POST['Budget']."',
								'".FormatDateForSQL($_POST['StartDate'])."',
								'".FormatDateForSQL($_POST['EndDate'])."',
								'".$_POST['Cost']."',
								'".$_POST['Venue']."',
								'".$_POST['Speaker']."',
								'".$_POST['Status']."'
								)";
	//die($sql);
	$result= DB_query($sql,$db);
	$sql="SELECT counter FROM tagIdS1 WHERE s1code='".$_POST['Segment1']."'";
	$getResult= DB_query($sql,$db);
	$myrow=DB_fetch_row($getResult);
	$sql="UPDATE tagIdS1 set counter='".($myrow[0]+1)."' WHERE s1code='".$_POST['Segment1']."'";
	$result= DB_query($sql,$db);
}

if (isset($_POST['update'])) {
	$tgid=$_POST['Segment1'].'-'.$_POST['Segment2'].'-'.$_POST['Segment3'];
	$sql = "UPDATE tags SET tagdescription='" . $_POST['Description'] . "', 
					tagid='" . $tgid . "',
				  budgetRevenue='" . $_POST['Budget']. "',
					startdate='".FormatDateForSQL($_POST['StartDate'])."',
					enddate='".FormatDateForSQL($_POST['EndDate'])."',
					budgetCost='".$_POST['Cost']."',
					venue='".$_POST['Venue']."',
					speaker='".$_POST['Speaker']."',
					status='".$_POST['Status']."'
					WHERE tagref='".$_POST['reference']."'";
	$result= DB_query($sql,$db);
	prnMsg(_('The selected tag has been updated'),'success');

}
echo '<p class="page_title_text">
		<img src="'.$rootpath.'/css/'.$theme.'/images/maintenance.png" title="' .
		_('Print') . '" alt="" />' . ' ' . $title . '
	</p>';

echo '<form method="post" action="' . htmlspecialchars($_SERVER['PHP_SELF'],ENT_QUOTES,'UTF-8') . '" id="form">';
echo '<div>';
echo '<input type="hidden" name="FormID" value="' . $_SESSION['FormID'] . '" />';
echo '<br />
	<table border=1>
	<tr>
		<td>'. _('Tag ID') . '</td><td>';
$GLSeg=explode("-",$tagId);
  $sql = "SELECT s1code FROM tagIdS1";
  $result = DB_query($sql, $db);
  echo '<select name="Segment1" onchange="return ReloadForm(ok);">';
  echo '<option value=""></option>';
  while ($myrow = DB_fetch_array($result)){
          if ( $myrow[0]==$GLSeg[0] OR $_POST['Segment1']==$myrow[0]){
              echo '<option selected="selected" value="';
          } else {
              echo '<option value="';
          }
          echo $myrow[0] . '">' . $myrow[0] . '</option>';
       }



$sql="SELECT counter FROM tagIdS1 WHERE s1code='".$_POST['Segment1']."'";
$result=DB_query($sql,$db);
$myrow=DB_fetch_array($result);
$s3=$myrow[0];
$myCtr=strlen($s3);

while($myCtr<4){
$s3='0'.$s3;
$myCtr++;
}

if(isset($GLSeg[1])){
        $s2=$GLSeg[1];
	$s3=$GLSeg[2];
}
else{
        $s2=Date("y");
}


echo	'</select>
				<input type="text" size="3" maxlength="3" name="Segment2" value="'.$s2.'" />
				<input type="text" size="4" maxlength="4" name="Segment3display" value="'.$s3.'" disabled />
				 <input type="hidden" size="4" maxlength="4" name="Segment3" value="'.$s3.'"  />
				<input type="submit" name="ok" value="">';

echo '	<a href="'.$rootpath.'/GLTagS1.php">Add New Segment1 Code</a> </td>
	</tr>';

echo '<tr>
		<td>'. _('Description') . '</td>
                <td><input type="text" size="30" maxlength="30" name="Description" value="'.$Description.'" /></td>
	</tr>
	';

echo '<tr>
    <td>' . _('Starting') . ':</td>
    <td><input type="text" name="StartDate" 
								class="date" alt="'.$_SESSION['DefaultDateFormat'].'" 
								maxlength="10" size="11" 
								onchange="isDate(this, this.value, '."'".$_SESSION['DefaultDateFormat']."'".')" 
								value="' . $startdate . '" /></td>
  </tr>';

echo '<tr>
    <td>' . _('Ending') . ':</td>
    <td><input type="text" name="EndDate" 
								class="date" alt="'.$_SESSION['DefaultDateFormat'].'" 
								maxlength="10" size="11" 
								onchange="isDate(this, this.value, '."'".$_SESSION['DefaultDateFormat']."'".')" 
								value="' . $enddate . '" /></td>
  </tr>';

echo '<tr>
    <td>'. _('Budget Revenue') . '</td>
                <td><input type="text" class="number" size="30" maxlength="30" name="Budget" value="'.$budget.'" /></td>
  </tr>
  ';

echo '<tr>
    <td>'. _('Budget Cost') . '</td>
                <td><input type="text" class="number" size="30" maxlength="30" name="Cost" value="'.$cost.'" /></td>
  </tr>
  ';
echo '<tr>
    <td>'. _('Venue') . '</td>
                <td><input type="text" size="30" maxlength="30" name="Venue" value="'.$venue.'" /></td>
  </tr>
  ';
echo '<tr>
    <td>'. _('Speaker') . '</td>
                <td><input type="text" size="30" maxlength="30" name="Speaker" value="'.$speaker.'" /></td>
  </tr>
  ';

echo '<tr>
	<td>'._('Status').'</td>
		<td><select name="Status">';
	if($status=='Open'){
		echo '<option value="Open">Open</option>
		     <option value="Close">Close</option>';
	}else{
		echo '<option value="Open">Open</option>
                      <option selected="selected" value="Close">Close</option>';	
	}
echo '		    </select>

  ';

echo '<tr>	<td></td>
		<td class="number"><input type="hidden" name="reference" value="'.$_GET['SelectedTag'].'" />';





if (isset($_GET['Action']) AND $_GET['Action']=='edit') {
	echo '<input type="submit" name="update" value="' . _('Update') . '" />';
	echo '<input type="submit" name="cancel" value="' . _('Cancel') . '" />';
} else {
	echo '<input type="submit" name="submit" value="' . _('Insert') . '" />';
}

echo '</td>
	</tr>
	</table>
	<br />';

 echo '<table border="1">
                <tr><th colspan=3 width=400><b>Filter</b></th></tr>
                <tr>
                        <td>Enter partial code OR name:</td>
                        <td><input type="text" name="TextSearch" size="30"/></td>
                        <td><input type="submit" name="Search"  value="Search" ></td>
                </tr>


        </table> <br>';



echo '
    </div>
	</form>
	<table class="selection">
	<tr>
		<th>'. _('Tag ID') .'</th>
		<th>'. _('Description'). '</th>
		<th>'. _('Starting') .'</th>
    		<th>'. _('Ending') .'</th>
    		<th>'. _('Budget Revenue'). '</th>
		<th>'. _('Budget Cost'). '</th>
		<th>'. _('Budget Net Profit'). '</th>
		<th>'. _('Venue').'</th>
		<th>'. _('Speaker').'</th>
		<th>'. _('Status').'</th>
		<th colspan="2">'. _(' ').'</th>
	</tr>';

if(isset($_POST['TextSearch'])){
$sql="SELECT tagref, 
                        tagdescription,
                        tagid,
                        startdate,
                        enddate,
                        budgetRevenue,
                        budgetCost,
                        venue,
                        speaker,
                        status
                FROM tags
		WHERE tagdescription LIKE '%".$_POST['TextSearch']."%' OR
                tagid LIKE '%".$_POST['TextSearch']."%'
		ORDER BY tagid";
}else{
$sql="SELECT tagref, 
			tagdescription,
			tagid,
			startdate,
			enddate,
			budgetRevenue,
			budgetCost,
			venue,
			speaker,
			status
		FROM tags 
		ORDER BY tagid";
}		
$result= DB_query($sql,$db);

$k=0;
while ($myrow = DB_fetch_array($result,$db)){
$profit=$myrow['budgetRevenue']-$myrow['budgetCost'];

 		if ($k==1){
                        $rowclass='<tr class="EvenTableRows">';
                        $k=0;
                } else {
                        $rowclass= '<tr class="OddTableRows">';
                        $k=1;
                }

	echo $rowclass.'
			<td>' . $myrow['tagid'] . '</td>
			<td>' . $myrow['tagdescription'] . '</td>
			<td>' . $myrow['startdate'] . '</td>
      <td>' . $myrow['enddate'] . '</td>
      <td class="number">' . number_format($myrow['budgetRevenue'],2) . '</td>
			<td class="number">' . number_format($myrow['budgetCost'],2) . '</td>
			<td class="number">' . number_format($profit,2). '</td>
			<td>'.$myrow['venue'].'</td>
			<td>'.$myrow['speaker'].'</td>
			<td>'.$myrow['status'].'</td>
			<td><a href="' . htmlspecialchars($_SERVER['PHP_SELF'],ENT_QUOTES,'UTF-8') . '?SelectedTag=' . $myrow['tagref'] . '&amp;Action=edit">' . _('Edit') . '</a></td>
			<td><a href="' . htmlspecialchars($_SERVER['PHP_SELF'],ENT_QUOTES,'UTF-8') . '?SelectedTag=' . $myrow['tagref'] . '&amp;Action=delete" onclick="return confirm(\'' . _('Are you sure you wish to delete this GL tag?') . '\');">' . _('Delete') . '</a></td>
		</tr>';
}

echo '</table>';

echo '<script  type="text/javascript">defaultControl(document.form.Description);</script>';

include('includes/footer.inc');

?>
