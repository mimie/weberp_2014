<?php

/* $Id: GLTags.php 5185 2012-04-01 02:42:45Z vvs2012 $*/

include('includes/session.inc');
$title = _('Maintain General Ledger Tags');

include('includes/header.inc');

if (isset($_GET['SelectedTag'])) {
	if($_GET['Action']=='delete'){
		//first off test there are no transactions created with this tag
	
		
			$Result = DB_query("DELETE FROM tagIdS1 WHERE id='" . $_GET['SelectedTag'] . "'",$db);
			prnMsg(_('The selected tag has been deleted'),'success');
		
		$description='';
		$tagId='';
	}
	 else {
		$sql="SELECT id,
				s1code,
				description,
				counter
				FROM tagIdS1 
				WHERE id='".$_GET['SelectedTag']."'";
			
		$result= DB_query($sql,$db);
		$myrow = DB_fetch_array($result,$db);
		$id=$myrow['id'];
		$description = $myrow['description'];
		$code= $myrow['s1code'];
		$starting=$myrow['counter'];
	}
} else {
	$Description='';
	$tagId='';
	$_GET['SelectedTag']='';
}

if (isset($_POST['submit'])) {
	if(isset($_POST['Code']) AND $_POST['Code']!=''){
	$sql = "INSERT INTO tagIdS1(s1code,description,counter)
					values('" . $_POST['Code'] . "',
								'" . $_POST['Description'] . "',
								'".$_POST['Starting']."'
								)";
	//die($sql);
	$result= DB_query($sql,$db);
	 prnMsg(_('Successfully added'),'success');
	echo '<a href="'.$rootpath.'/GLTags.php">Return to GL Tags</a>';
	}else{
	 prnMsg(_('Please Enter Code'),'error');
	}
}

if (isset($_POST['update'])) {
	$tgid=$_POST['Segment1'].'-'.$_POST['Segment2'].'-'.$_POST['Segment3'];
	$sql = "UPDATE tagIdS1 SET s1code='" . $_POST['Code'] . "', 
				   description='" . $_POST['Description'] . "',
				   counter='" . $_POST['Starting']. "'
					WHERE id='".$_POST['reference']."'";
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
	<table border="1">';


echo '<tr>
		<td>'. _('Code') . '</td>
                <td><input type="text" size="10" maxlength="3" name="Code" value="'.$code.'" /></td>
	</tr>
	';


echo '<tr>
    <td>'. _('Description') . '</td>
                <td><input type="text" size="30" maxlength="30" name="Description" value="'.$description.'" /></td>
  </tr>
  ';

echo '<tr>
    <td>'. _('Starting') . '</td>
                <td><input type="text" class="number" size="10" maxlength="10" name="Starting" value="'.$starting.'" /></td>
  </tr>
  ';
     
echo '<tr>
		<td><input type="hidden" name="reference" value="'.$_GET['SelectedTag'].'" />';





if (isset($_GET['Action']) AND $_GET['Action']=='edit') {
	echo '</td><td><input type="submit" name="update" value="' . _('Update') . '" />';
	echo '<input type="submit" name="cancel" value="' . _('Cancel') . '" /></td>';
} else {
	echo '</td><td><input type="submit" name="submit" value="' . _('Add') . '" />';
}

echo '</td>
	</tr>
	</table>
	<br />
    </div>
	</form>
	<table class="selection">
	<tr>
		<th>'. _('Code ID') .'</th>
		<th>'. _('Code') .'</th>
		<th>'. _('Description'). '</th>
		<th>'. _('Starting') .'</th>
		<th colspan="2">'. _(' ').'</th>
	</tr>';

$sql="SELECT id,
	     s1code,
	     description,
	     counter
		FROM tagIdS1 
		ORDER BY id";
		
$result= DB_query($sql,$db);

while ($myrow = DB_fetch_array($result,$db)){
$profit=$myrow['budgetRevenue']-$myrow['budgetCost'];
	echo '<tr>
			<td>' . $myrow['id'] . '</td>
			<td>' . $myrow['s1code'] . '</td>
			<td>' . $myrow['description'] . '</td>
			<td>' . $myrow['counter'] . '</td>
      
			<td><a href="' . htmlspecialchars($_SERVER['PHP_SELF'],ENT_QUOTES,'UTF-8') . '?SelectedTag=' . $myrow['id'] . '&amp;Action=edit">' . _('Edit') . '</a></td>
			<td><a href="' . htmlspecialchars($_SERVER['PHP_SELF'],ENT_QUOTES,'UTF-8') . '?SelectedTag=' . $myrow['id'] . '&amp;Action=delete" onclick="return confirm(\'' . _('Are you sure you wish to delete this GL tag?') . '\');">' . _('Delete') . '</a></td>
		</tr>';
}

echo '</table>';

echo '<script  type="text/javascript">defaultControl(document.form.Description);</script>';

include('includes/footer.inc');

?>
