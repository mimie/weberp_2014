<?php
 include('includes/session.inc');
 $title="Add Customer";
 include('includes/header.inc');
?>
<html>
<head>
  <title>Add Customer</title>
  <link rel="stylesheet" type="text/css" href="billingStyle.css"> 
  <link rel="stylesheet" type="text/css" href="menu.css">
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
  <script src="js/jquery-jPaginate.js"></script>
  <script src="js/jquery.tablesorter.js"></script>
<script>
$(function() {
        $( "#tabs" ).tabs().addClass( "ui-tabs-vertical ui-helper-clearfix" );
        $( "#tabs li" ).removeClass( "ui-corner-top" ).addClass( "ui-corner-left" );
        $('#info').jPaginate({
                'max': 20,
                'page': 1,
                'links': 'buttons'
        });
//        $("table").tablesorter( {sortList: [[0,0], [1,0]]} ); 
});
$(function() {
    $( "#confirmation" ).dialog({
      resizable: false,
      width:500,
      modal: true,
      buttons: {
        "OK": function() {
          $( this ).dialog( "close" );
        }
      }
    });
  });
</script>
</head>
<body>
<?php
  include "pdo_conn.php";
  include "postingFunc/customer_functions.php";
  include "menu_functions.php";
  include "billing_functions.php";
  include "postingFunc/eventpost_functions.php";
  include "login_functions.php";

  $dbh = civicrmConnect();
  $weberp = weberpConnect();

  @$searchText = $_GET["searchText"];

  echo "<div style='padding:9px;width:50%;margin:0 auto;'>";
  echo "<form action='' method='POST'>";
  echo '<input type="hidden" name="FormID" value="' . $_SESSION['FormID'] . '" />';
  echo "<fieldset>"
       . "<legend>Search Customer</legend>"
       . "Search name:&nbsp;<input type='text' name='searchName' placeholder='name...' value='$searchText'>"
       . "<input type='submit' value='SEARCH' name='search'>"
       . "</fieldset>";
?>
<?php

  if(isset($_POST["search"])){
    $searchName = $_POST["searchName"];
    $customer = getCustomerByName($dbh,$searchName);
    $display = displayCustomerContacts($customer);
    echo $display;
  }

  elseif(isset($_POST["insert"])){
    $ids = $_POST["contactIds"];

    foreach($ids as $contactId){

       $exist = checkContactRecordExist($weberp,$contactId);
       if($exist == 0){
         $details = getCustomerById($dbh,$contactId);
         $name  = $details["display_name"];
         $email = $details["email"];
         $address = getAddressDetails($dbh,$contactId);
         $street = $address["street"];
         $city = $address["city"];
         $memberId = getMemberId($dbh,$contactId);
         
         $contact = array();
         $contact["contact_id"] = $contactId;
         $contact["participant_name"] = $name;
         $contact["street"] = $street;
         $contact["city"] = $city;
         $contact["email"] = $email;
         $contact["member_id"] = $memberId;

         insertCustomer($weberp,$contact);
         echo "<div id='confirmation' title'Confirmation'>";
         echo "<p>Contact record successfully inserted to weberp.</p>";
         echo "</div>";

         header("Location: CustomerReceipt.php?civiID=IIAP$contactId");
       }

       else{
         echo "<div id='confirmation' title='Confirmation'>";
         echo "<p>Contact record already exist in weberp.</p>";
         echo "</div>";

       }
    }


    $customer = getCustomerDetails($dbh);
    $display = displayCustomerContacts($customer);
    echo $display;
 
  }
  
  else{
    $customer = getCustomerDetails($dbh);
    $display = displayCustomerContacts($customer);
    echo $display;

  }
?>
  </form>
  </div>
</body>
<script type="text/javascript">                                                                
  $("#check").click(function(){                                                                
          
    if($(this).is(":checked")){                                                                
      $("body input[type=checkbox][class=checkbox]").prop("checked",true);                     
    }else{
      $("body input[type=checkbox][class=checkbox]").prop("checked",false);                    
    }
                                                                                               
  });                                                                                          
</script> 
</html>


<?php

include('includes/footer.inc');

?>
