<?php
  include 'api_php.php';
  $cmd = isset($_POST['cmd']) ? $_POST['cmd'] : NULL;
  $user = isset($_POST['user']) ? $_POST['user'] : NULL;
  $pass = isset($_POST['pass']) ? $_POST['pass'] : NULL;
  $params = isset($_POST['params']) ? $_POST['params'] : NULL;
  
  switch($cmd){
    case 'insertCustomer':
      insertCust($params,$user,$pass);
    break;
    case 'insertCustBranch':
      insertCustBranch($params,$user,$pass);
    break;
    case 'modifyCustomer':
      modifyCust($params,$user,$pass);
    break;
    case 'modifyCustBranch':
      modifyCustBranch($params,$user,$pass);
    break;
    case 'getCustomer':
      getCust($params,$user,$pass);
    break;
    case 'getCustomer2':
      getCust2($params,$user,$pass);
    break;
    case 'getCustomerBranch':
      getCustBranch($params,$user,$pass);
    break;
    case 'insertSOH':
      insertSOH($params,$user,$pass);
    break;
    case 'insertSOL':
      insertSOL($params,$user,$pass);
    break;
    case 'invoiceSO':
      invoiceSO($params,$user,$pass);
    break;
    default:
      echo 'Fatal error! Please contact IIAP for assistance.. ERROR CODE: F001';
  }

  function modifyCust($params, $user,$pass){
    $errorMsg = "Error saving member details to accounting software! Please contact IIAP for assistance.. ERROR CODE: MC001 - ";
    $CustomerDetails = json_decode(stripslashes($params),true);
    $modify_customer = ModifyCustomer($CustomerDetails, $user,$pass);
    $error = $modify_customer[0];
    if($error){
      $errorMsg .= $ErrorDescription[$error];
      echo $errorMsg;
    }
  }


  function modifyCustBranch($params, $user,$pass){
    $errorMsg = "Error saving member details to accounting software! Please contact IIAP for assistance.. ERROR CODE: MC001 - ";
    $BranchDetails = json_decode(stripslashes($params),true);
    $modify_branch = ModifyBranch($BranchDetails, $user,$pass);
    $error = $modify_branch[0];
    if($error){
      $errorMsg .= $ErrorDescription[$error];
      echo $errorMsg;
    }
  }

 
  function insertCust($params, $user,$pass){
    $errorMsg = "Error saving member details to accounting software! Please contact IIAP for assistance.. ERROR CODE: MC002 - ";
    $CustomerDetails = json_decode(stripslashes($params),true);
    $insert_customer = InsertCustomer($CustomerDetails, $user,$pass);
    $error = $insert_customer[0];
    if($error){
      $errorMsg .= $ErrorDescription[$error];
      echo $errorMsg;
    }
  }


  function insertCustBranch($params, $user,$pass){
    $errorMsg = "Error saving member details to accounting software! Please contact IIAP for assistance.. ERROR CODE: MC003 - ";
    $branchDetails = json_decode(stripslashes($params),true);
    $insert_branch = InsertBranch($branchDetails, $user,$pass);
    $error = $insert_branch[0];
    if($error){
      $errorMsg .= $ErrorDescription[$error];
      echo $errorMsg;
    }
  }

  function getCust($params, $user,$pass){
    $errorMsg = "Error getting member details to accounting software! Please contact IIAP for assistance.. ERROR CODE: GT001 - ";
    $get_customer = GetCustomer($params, $user,$pass);
    $error = $get_customer[0];
    if($error){
      $errorMsg .= $ErrorDescription[$error];
      echo $errorMsg;
    }
  }

  function getCust2($params, $user,$pass){
    $get_customer2 = GetCustomer($params, $user,$pass);
    echo json_encode($get_customer2);
    
  }
  function getCustBranch($params, $user,$pass){
    $get_customerB = GetCustomerBranch($params,$params, $user,$pass);
    echo json_encode($get_customerB);
  }
  function insertSOH($params,$user,$pass){
    $soh = json_decode(stripslashes($params),true);
    $insert_SOH = InsertSalesOrderHeader($soh, $user,$pass);
    echo json_encode($insert_SOH);
  }

  function insertSOL($params,$user,$pass){
    $sol = json_decode(stripslashes($params),true);
    $insert_SOL = InsertSalesOrderLine($sol, $user,$pass);
    echo json_encode($insert_SOL);
  }
  function invoiceSO($params, $user, $pass){
    $insert_SO = InvoiceSalesOrder($params, $user, $pass);
    echo $params;
  }


?>
