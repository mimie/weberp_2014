<?

  function civicrmConnect(){

    $dbh = new PDO('mysql:host=10.110.215.92;dbname=webapp_civicrm', 'iiap', 'mysqladmin');
    $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    return $dbh;

  }

  function weberpConnect(){

   $weberpConn = new PDO('mysql:host=10.110.215.92;dbname=iiap_weberp2014','iiap','mysqladmin');
   $weberpConn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
   return $weberpConn;

  }  

?>
