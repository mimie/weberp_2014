<?php

/* $Id: PrintCustTrans.php 5103 2012-03-13 08:28:01Z ExsonQu $ */
function mailInvoice($FromTransNo,$PrintPDF,$InvOrCredit,$Email,$user,$password){


		$Errors = array();
		$db = db($user, $password);
		if (gettype($db)=='integer') {
			$Errors[0]=NoAuthorisation;
			return $Errors;
		}


$FirstTrans = $FromTransNo; /* Need to start a new page only on subsequent transactions */
  global $PathPrefix;
If (isset($PrintPDF)
	and $PrintPDF!=''
	and isset($FromTransNo)
	and isset($InvOrCredit)
	and $FromTransNo!=''){


    $Page_Width=842;
    $Page_Height=595;
    $Top_Margin=30;
    $Bottom_Margin=30;
    $Left_Margin=40;
    $Right_Margin=30;

	$pdf = new Cpdf('L', 'pt', 'A4');
	$pdf->addInfo('Author','webERP ' . $Version);
	$pdf->addInfo('Creator','webERP http://www.weberp.org');

	if ($InvOrCredit=='Invoice'){
		$pdf->addInfo('Title',_('Sales Invoice') . ' ' . $FromTransNo );
		$pdf->addInfo('Subject',_('Invoices from') . ' ' . $FromTransNo) ;
	} else {
		$pdf->addInfo('Title',_('Sales Credit Note') );
		$pdf->addInfo('Subject',_('Credit Notes from') . ' ' . $FromTransNo);
	}

	$pdf->setAutoPageBreak(0);
	$pdf->setPrintHeader(false);
	$pdf->AddPage();
	$pdf->cMargin = 0;

	$FirstPage = true;
	$line_height=16;


	/*retrieve the invoice details from the database to print
	notice that salesorder record must be present to print the invoice purging of sales orders will
	nobble the invoice reprints */

	// check if the user has set a default bank account for invoices, if not leave it blank
		$sql = "SELECT bankaccounts.invoice,
					bankaccounts.bankaccountnumber,
					bankaccounts.bankaccountcode
				FROM bankaccounts
				WHERE bankaccounts.invoice = '1'";
		$result=DB_query($sql,$db,'','',false,false);
		if (DB_error_no($db)!=1) {
			if (DB_num_rows($result)==1){
				$myrow = DB_fetch_array($result);
				$DefaultBankAccountNumber = _('Account:') .' ' .$myrow['bankaccountnumber'];
				$DefaultBankAccountCode =  _('Bank Code:') .' ' .$myrow['bankaccountcode'];
			} else {
				$DefaultBankAccountNumber = '';
				$DefaultBankAccountCode =  '';
			}
		} else {
			$DefaultBankAccountNumber = '';
			$DefaultBankAccountCode =  '';
		}
// gather the invoice data

		if ($InvOrCredit=='Invoice') {
			$sql = "SELECT debtortrans.trandate,
							debtortrans.ovamount,
							debtortrans.ovdiscount,
							debtortrans.ovfreight,
							debtortrans.ovgst,
							debtortrans.rate,
							debtortrans.invtext,
							debtortrans.consignment,
							debtorsmaster.name,
							debtorsmaster.address1,
							debtorsmaster.address2,
							debtorsmaster.address3,
							debtorsmaster.address4,
							debtorsmaster.address5,
							debtorsmaster.address6,
							debtorsmaster.currcode,
							debtorsmaster.invaddrbranch,
							debtorsmaster.taxref,
							paymentterms.terms,
							salesorders.deliverto,
							salesorders.deladd1,
							salesorders.deladd2,
							salesorders.deladd3,
							salesorders.deladd4,
							salesorders.deladd5,
							salesorders.deladd6,
							salesorders.customerref,
							salesorders.orderno,
							salesorders.orddate,
							locations.locationname,
							shippers.shippername,
							custbranch.brname,
							custbranch.braddress1,
							custbranch.braddress2,
							custbranch.braddress3,
							custbranch.braddress4,
							custbranch.braddress5,
							custbranch.braddress6,
							custbranch.brpostaddr1,
							custbranch.brpostaddr2,
							custbranch.brpostaddr3,
							custbranch.brpostaddr4,
							custbranch.brpostaddr5,
							custbranch.brpostaddr6,
							salesman.salesmanname,
							debtortrans.debtorno,
							debtortrans.branchcode,
							currencies.decimalplaces
						FROM debtortrans INNER JOIN debtorsmaster
						ON debtortrans.debtorno=debtorsmaster.debtorno
						INNER JOIN custbranch
						ON debtortrans.debtorno=custbranch.debtorno
						AND debtortrans.branchcode=custbranch.branchcode
						INNER JOIN salesorders
						ON debtortrans.order_ = salesorders.orderno
						INNER JOIN shippers
						ON debtortrans.shipvia=shippers.shipper_id
						INNER JOIN salesman
						ON custbranch.salesman=salesman.salesmancode
						INNER JOIN locations
						ON salesorders.fromstkloc=locations.loccode
						INNER JOIN paymentterms
						ON debtorsmaster.paymentterms=paymentterms.termsindicator
						INNER JOIN currencies
						ON debtorsmaster.currcode=currencies.currabrev
						WHERE debtortrans.type=10
						AND debtortrans.transno='" . $FromTransNo . "'";

			if (isset($_POST['PrintEDI']) and $_POST['PrintEDI']=='No') {
				$sql = $sql . " AND debtorsmaster.ediinvoices=0";
			}
		} else {
			$sql = "SELECT debtortrans.trandate,
							debtortrans.ovamount,
							debtortrans.ovdiscount,
							debtortrans.ovfreight,
							debtortrans.ovgst,
							debtortrans.rate,
							debtortrans.invtext,
							debtorsmaster.invaddrbranch,
							debtorsmaster.name,
							debtorsmaster.address1,
							debtorsmaster.address2,
							debtorsmaster.address3,
							debtorsmaster.address4,
							debtorsmaster.address5,
							debtorsmaster.address6,
							debtorsmaster.currcode,
							debtorsmaster.taxref,
							custbranch.brname,
							custbranch.braddress1,
							custbranch.braddress2,
							custbranch.braddress3,
							custbranch.braddress4,
							custbranch.braddress5,
							custbranch.braddress6,
							custbranch.brpostaddr1,
							custbranch.brpostaddr2,
							custbranch.brpostaddr3,
							custbranch.brpostaddr4,
							custbranch.brpostaddr5,
							custbranch.brpostaddr6,
							salesman.salesmanname,
							debtortrans.debtorno,
							debtortrans.branchcode,
							paymentterms.terms,
							currencies.decimalplaces
						FROM debtortrans INNER JOIN debtorsmaster
						ON debtortrans.debtorno=debtorsmaster.debtorno
						INNER JOIN custbranch
						ON debtortrans.debtorno=custbranch.debtorno
						AND debtortrans.branchcode=custbranch.branchcode
						INNER JOIN salesman
						ON custbranch.salesman=salesman.salesmancode
						INNER JOIN paymentterms
						ON debtorsmaster.paymentterms=paymentterms.termsindicator
						INNER JOIN currencies
						ON debtorsmaster.currcode=currencies.currabrev
						WHERE debtortrans.type=11
						AND debtortrans.transno='" . $FromTransNo . "'";


			if (isset($_POST['PrintEDI']) and $_POST['PrintEDI']=='No'){
				$sql = $sql . ' AND debtorsmaster.ediinvoices=0';
			}
		}

	   $result=DB_query($sql,$db,'','',false,false);

	   if (DB_error_no($db)!=0) {


	    echo "There was a problem retrieving the invoice or credit note details for note number  $InvoiceToPrint from the database. To print an invoice, the sales order record, the customer transaction record and the branch record for the customer must not have been purged To print a credit note only requires the customer, transaction, salesman and branch records be available";
			if ($debug==1){
			    echo "The SQL used to get this information that failed was <br /> $sql ";
			}
			exit;
	    }
	    if (DB_num_rows($result)==1){
			$myrow = DB_fetch_array($result);

			$ExchRate = $myrow['rate'];

			if ($InvOrCredit == 'Invoice') {
				$sql = "SELECT stockmoves.stockid,
						stockmaster.description,
						-stockmoves.qty as quantity,
						stockmoves.discountpercent,
						((1 - stockmoves.discountpercent) * stockmoves.price * " . $ExchRate . "* -stockmoves.qty) AS fxnet,
						(stockmoves.price * " . $ExchRate . ") AS fxprice,
						stockmoves.narrative,
						stockmaster.controlled,
						stockmaster.serialised,
						stockmaster.units,
						stockmoves.stkmoveno,
						stockmaster.decimalplaces
					FROM stockmoves INNER JOIN stockmaster
					ON stockmoves.stockid = stockmaster.stockid
					WHERE stockmoves.type=10
					AND stockmoves.transno='" . $FromTransNo . "'
					AND stockmoves.show_on_inv_crds=1";
			} else {
				/* only credit notes to be retrieved */
				$sql = "SELECT stockmoves.stockid,
						stockmaster.description,
						stockmoves.qty as quantity,
						stockmoves.discountpercent,
						((1 - stockmoves.discountpercent) * stockmoves.price * " . $ExchRate . " * stockmoves.qty) AS fxnet,
						(stockmoves.price * " . $ExchRate . ") AS fxprice,
						stockmoves.narrative,
						stockmaster.controlled,
						stockmaster.serialised,
						stockmaster.units,
						stockmoves.stkmoveno,
						stockmaster.decimalplaces
					FROM stockmoves INNER JOIN stockmaster
					ON stockmoves.stockid = stockmaster.stockid
					WHERE stockmoves.type=11
					AND stockmoves.transno='" . $FromTransNo . "'
					AND stockmoves.show_on_inv_crds=1";
			} // end else

		$result=DB_query($sql,$db);
		if (DB_error_no($db)!=0) {
			echo "<br />There was a problem retrieving the invoice or credit note stock movement details for invoice number $FromTransNo from the database";
			if ($debug==1){
			    echo "<br />The SQL used to get this information that failed was <br /> $sql";
			}
			exit;
		}


		if (DB_num_rows($result)>0){

			$FontSize = 10;
			$PageNumber = 1;

			include($PathPrefix.'includes/PDFTransPageHeader.inc');
			$FirstPage = False;
		    while ($myrow2=DB_fetch_array($result)){
					if ($myrow2['discountpercent'] == 0) {
						$DisplayDiscount = '';
					} else {
						$DisplayDiscount = locale_number_format($myrow2['discountpercent'] * 100, 2) . '%';
						$DiscountPrice = $myrow2['fxprice'] * (1 - $myrow2['discountpercent']);
					}
				$DisplayNet = locale_number_format($myrow2['fxnet'],$myrow['decimalplaces']);
				$DisplayPrice = locale_number_format($myrow2['fxprice'],$myrow['decimalplaces']);
				$DisplayQty = locale_number_format($myrow2['quantity'],$myrow2['decimalplaces']);

				$LeftOvers = $pdf->addTextWrap($Left_Margin+5,$YPos,71,$FontSize,$myrow2['stockid']);
				$LeftOvers = $pdf->addTextWrap($Left_Margin+80,$YPos,186,$FontSize,$myrow2['description']);
				$lines=1;

				while ($LeftOvers!='') {
					$LeftOvers = $pdf->addTextWrap($Left_Margin+80,$YPos-(10*$lines),186,$FontSize,$LeftOvers);
					$lines++;
				}

				$LeftOvers = $pdf->addTextWrap($Left_Margin+270,$YPos,76,$FontSize,$DisplayPrice,'right');
				$LeftOvers = $pdf->addTextWrap($Left_Margin+350,$YPos,36,$FontSize,$DisplayQty,'right');
				$LeftOvers = $pdf->addTextWrap($Left_Margin+390,$YPos,26,$FontSize,$myrow2['units'],'center');
				$LeftOvers = $pdf->addTextWrap($Left_Margin+420,$YPos,26,$FontSize,$DisplayDiscount,'right');
				$LeftOvers = $pdf->addTextWrap($Left_Margin+450,$YPos,72,$FontSize,$DisplayNet,'right');

				if ($myrow2['controlled']==1){

					$GetControlMovts = DB_query("SELECT moveqty,
														serialno
												 FROM stockserialmoves
												 WHERE stockmoveno='" . $myrow2['stkmoveno'] . "'",$db);

					if ($myrow2['serialised']==1){
						while ($ControlledMovtRow = DB_fetch_array($GetControlMovts)){
							$YPos -= (10*$lines);
							$LeftOvers = $pdf->addTextWrap($Left_Margin+82,$YPos,100,$FontSize,$ControlledMovtRow['serialno'],'left');
							if ($YPos-$line_height <= $Bottom_Margin){
								/* head up a new invoice/credit note page */
								/*draw the vertical column lines right to the bottom */
								PrintLinesToBottom ();
			                                  include($PathPrefix.'includes/PDFTransPageHeader.inc');
			   				} //end if need a new page headed up
						}
					} else {
						while ($ControlledMovtRow = DB_fetch_array($GetControlMovts)){
							$YPos -= (10*$lines);
							$LeftOvers = $pdf->addTextWrap($Left_Margin+82,$YPos,100,$FontSize,(-$ControlledMovtRow['moveqty']) . ' x ' . $ControlledMovtRow['serialno'],'left');
							if ($YPos-$line_height <= $Bottom_Margin){
								/* head up a new invoice/credit note page */
								/*draw the vertical column lines right to the bottom */
								PrintLinesToBottom ();
			                                  include($PathPrefix.'includes/PDFTransPageHeader.inc');
			   				} //end if need a new page headed up
						}
					}
				}
				$YPos -= ($FontSize*$lines);

				$lines=explode('\r\n',htmlspecialchars_decode($myrow2['narrative']));
				for ($i=0;$i<sizeOf($lines);$i++) {
				while (mb_strlen($lines[$i])>1){
					if ($YPos-$line_height <= $Bottom_Margin){
						/* head up a new invoice/credit note page */
						/*draw the vertical column lines right to the bottom */
						PrintLinesToBottom ();
			                include($PathPrefix.'includes/PDFTransPageHeader.inc');
			   		} //end if need a new page headed up
			   		/*increment a line down for the next line item */
			   		if (mb_strlen($lines[$i])>1){
						$lines[$i] = $pdf->addTextWrap($Left_Margin+85,$YPos,181,$FontSize,stripslashes($lines[$i]));
					}
					$YPos -= ($line_height);
				}
				}
				if ($YPos <= $Bottom_Margin){

					/* head up a new invoice/credit note page */
					/*draw the vertical column lines right to the bottom */
					PrintLinesToBottom ();
			                include($PathPrefix.'includes/PDFTransPageHeader.inc');
				} //end if need a new page headed up
			} /*end while there are line items to print out*/

		} /*end if there are stock movements to show on the invoice or credit note*/

		$YPos -= $line_height;

		/* check to see enough space left to print the 4 lines for the totals/footer */
		if (($YPos-$Bottom_Margin)<(2*$line_height)){
			PrintLinesToBottom ();
			include($PathPrefix.'includes/PDFTransPageHeader.inc');
		}
		/*Print a column vertical line  with enough space for the footer*/
		/*draw the vertical column lines to 4 lines shy of the bottom
		to leave space for invoice footer info ie totals etc*/
		$pdf->line($Left_Margin+78, $TopOfColHeadings+12,$Left_Margin+78,$Bottom_Margin+(4*$line_height));

		/*Print a column vertical line */
		$pdf->line($Left_Margin+268, $TopOfColHeadings+12,$Left_Margin+268,$Bottom_Margin+(4*$line_height));

		/*Print a column vertical line */
		$pdf->line($Left_Margin+348, $TopOfColHeadings+12,$Left_Margin+348,$Bottom_Margin+(4*$line_height));

		/*Print a column vertical line */
		$pdf->line($Left_Margin+388, $TopOfColHeadings+12,$Left_Margin+388,$Bottom_Margin+(4*$line_height));

		/*Print a column vertical line */
		$pdf->line($Left_Margin+418, $TopOfColHeadings+12,$Left_Margin+418,$Bottom_Margin+(4*$line_height));

		$pdf->line($Left_Margin+448, $TopOfColHeadings+12,$Left_Margin+448,$Bottom_Margin+(4*$line_height));

		/*Rule off at bottom of the vertical lines */
		$pdf->line($Left_Margin, $Bottom_Margin+(4*$line_height),$Page_Width-$Right_Margin,$Bottom_Margin+(4*$line_height));

		/*Now print out the footer and totals */

		if ($InvOrCredit=='Invoice') {

		     $DisplaySubTot = locale_number_format($myrow['ovamount'],$myrow['decimalplaces']);
		     $DisplayFreight = locale_number_format($myrow['ovfreight'],$myrow['decimalplaces']);
		     $DisplayTax = locale_number_format($myrow['ovgst'],$myrow['decimalplaces']);
		     $DisplayTotal = locale_number_format($myrow['ovfreight']+$myrow['ovgst']+$myrow['ovamount'],$myrow['decimalplaces']);
		} else {
		     $DisplaySubTot = locale_number_format(-$myrow['ovamount'],$myrow['decimalplaces']);
		     $DisplayFreight = locale_number_format(-$myrow['ovfreight'],$myrow['decimalplaces']);
		     $DisplayTax = locale_number_format(-$myrow['ovgst'],$myrow['decimalplaces']);
		     $DisplayTotal = locale_number_format(-$myrow['ovfreight']-$myrow['ovgst']-$myrow['ovamount'],$myrow['decimalplaces']);
		}
	/*Print out the invoice text entered */
		$YPos = $Bottom_Margin+(3*$line_height);
	/* Print out the payment terms */

  		$pdf->addTextWrap($Left_Margin+5,$YPos+3,280,$FontSize,_('Payment Terms') . ': ' . $myrow['terms']);

		$FontSize =8;
		$LeftOvers=explode('\r\n',DB_escape_string($myrow['invtext']));
		for ($i=0;$i<sizeOf($LeftOvers);$i++) {
			$pdf->addText($Left_Margin+5, $YPos-8-($i*8), $FontSize, $LeftOvers[$i]);
		}
		$FontSize = 10;

		$pdf->addText($Page_Width-$Right_Margin-220, $YPos+12,$FontSize, _('Sub Total'));
		$LeftOvers = $pdf->addTextWrap($Left_Margin+450,$YPos+5,72,$FontSize,$DisplaySubTot, 'right');

		$pdf->addText($Page_Width-$Right_Margin-220, ($YPos+12)-$line_height+5,$FontSize, _('Freight'));
		$LeftOvers = $pdf->addTextWrap($Left_Margin+450,$YPos-$line_height+5,72,$FontSize,$DisplayFreight, 'right');

		$pdf->addText($Page_Width-$Right_Margin-220, ($YPos+12)-(2*$line_height)+5,$FontSize, _('Tax'));
		$LeftOvers = $pdf->addTextWrap($Left_Margin+450,$YPos-(2*$line_height)+5,72, $FontSize,$DisplayTax, 'right');

		/*rule off for total */
		$pdf->line($Page_Width-$Right_Margin-222, $YPos-(2*$line_height),$Page_Width-$Right_Margin,$YPos-(2*$line_height));

		/*vertical to separate totals from comments and ROMALPA */
		$pdf->line($Page_Width-$Right_Margin-222, $YPos+$line_height,$Page_Width-$Right_Margin-222,$Bottom_Margin);

		$YPos+=10;
		if ($InvOrCredit=='Invoice'){
			$pdf->addText($Page_Width-$Right_Margin-220, ($YPos+6) - ($line_height*3),$FontSize, _('TOTAL INVOICE'));
			$FontSize=8;
			$LeftOvers = $pdf->addTextWrap($Left_Margin+5,$YPos-18,280,$FontSize,$_SESSION['RomalpaClause']);
			while (mb_strlen($LeftOvers)>0 AND $YPos > $Bottom_Margin){
				$YPos -=10;
				$LeftOvers = $pdf->addTextWrap($Left_Margin+5,$YPos-18,280,$FontSize,$LeftOvers);
			}
/* Add Images for Visa / Mastercard / Paypal */
			if (file_exists($PathPrefix.'companies/' . $_SESSION['DatabaseName'] . '/payment.jpg')) {
				$pdf->addJpegFromFile($PathPrefix.'companies/' . $_SESSION['DatabaseName'] . '/payment.jpg',$Page_Width/2 -60,$YPos-15,0,20);
			}
// Print Bank acount details if available and default for invoices is selected
            $pdf->addText($Page_Width-$Right_Margin-450, $YPos - ($line_height*3)+22,$FontSize, $DefaultBankAccountCode . '  ' . $DefaultBankAccountNumber);
			$FontSize=10;
		} else {
			$pdf->addText($Page_Width-$Right_Margin-220, ($YPos+6)-($line_height*3),$FontSize, _('TOTAL CREDIT'));
 		}
		$LeftOvers = $pdf->addTextWrap($Left_Margin+450,35,72, $FontSize,$DisplayTotal, 'right');
	    } /* end of check to see that there was an invoice record to print */


	if (isset($Email)){ //email the invoice to address supplied
		$FileDir = $PathPrefix.$_SESSION['reports_dir'] . '/' . $_SESSION['DatabaseName'] . '_' . $InvOrCredit . '_' . $FromTransNo . '.pdf';
		$FileName = $InvOrCredit . '_' . $_GET['FromTransNo'] . '.pdf';
		$pdf->Output($FileDir,'F');
		$mail = new htmlMimeMail();

		$Attachment = $mail->getFile($FileDir);
		$mail->setText(_('Please find attached') . ' ' . $InvOrCredit . ' ' . $FromTransNo.'

In payment for 2013 membership dues
Please disregard this notice if payment has already been made.' );
		$mail->SetSubject($InvOrCredit . ' ' . $FromTransNo);
		$mail->addAttachment($Attachment, $FileName, 'application/pdf');
		$mail->setFrom($_SESSION['CompanyRecord']['coyname'] . ' <' . $_SESSION['CompanyRecord']['email'] . '>');
		$result = $mail->send(array($Email),'smtp');

		unlink($FileName); //delete the temporary file
			//$title = _('Emailing') . ' ' .$InvOrCredit . ' ' . _('Number') . ' ' . $FromTransNo;
			//include($PathPrefix.'includes/header.inc');
			//echo '<p>' . $InvOrCredit . ' '  . _('number') . ' ' . $FromTransNo . ' ' . _('has been emailed to') . ' ' . $Email;
			//include($PathPrefix.'includes/footer.inc');

	} else { //its not an email just print the invoice to PDF
		$pdf->OutputD($_SESSION['DatabaseName'] . '_' . $InvOrCredit . '_' . $FirstTrans. '.pdf');

	}
	$pdf->__destruct();
         return $result;
} 


}
function PrintLinesToBottom () {

	global $pdf;
	global $PageNumber;
	global $TopOfColHeadings;
	global $Left_Margin;
	global $Bottom_Margin;
	global $line_height;

/*draw the vertical column lines right to the bottom */
	$pdf->line($Left_Margin+78, $TopOfColHeadings+12,$Left_Margin+78,$Bottom_Margin);

	/*Print a column vertical line */
	$pdf->line($Left_Margin+268, $TopOfColHeadings+12,$Left_Margin+268,$Bottom_Margin);

	/*Print a column vertical line */
	$pdf->line($Left_Margin+348, $TopOfColHeadings+12,$Left_Margin+348,$Bottom_Margin);

	/*Print a column vertical line */
	$pdf->line($Left_Margin+388, $TopOfColHeadings+12,$Left_Margin+388,$Bottom_Margin);

	/*Print a column vertical line */
	$pdf->line($Left_Margin+418, $TopOfColHeadings+12,$Left_Margin+418,$Bottom_Margin);

	$pdf->line($Left_Margin+448, $TopOfColHeadings+12,$Left_Margin+448,$Bottom_Margin);

	$PageNumber++;

}
?>
