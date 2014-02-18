<?

function number_to_words($Number) {

    if (($Number < 0) OR ($Number > 999999999)) {
                prnMsg(_('Number is out of the range of numbers that can be expressed in words'),'error');
                return _('error');
    }

        $Millions = floor($Number / 1000000);
        $Number -= $Millions * 1000000;
        $Thousands = floor($Number / 1000);
        $Number -= $Thousands * 1000;
        $Hundreds = floor($Number / 100);
        $Number -= $Hundreds * 100;
        $NoOfTens = floor($Number / 10);
        $NoOfOnes = $Number % 10;

        $NumberInWords = '';

        if ($Millions) {
                $NumberInWords .= number_to_words($Millions) . ' ' . _('million');
        }

    if ($Thousands) {
                $NumberInWords .= (empty($NumberInWords) ? '' : ' ') . number_to_words($Thousands) . ' ' . _('thousand');
        }

    if ($Hundreds) {
                $NumberInWords .= (empty($NumberInWords) ? '' : ' ') . number_to_words($Hundreds) . ' ' . _('hundred');
        }

        $Ones = array(  0 => '',
                                        1 => _('one'),
                                        2 => _('two'),
                                        3 => _('three'),
                                        4 => _('four'),
                                        5 => _('five'),
                                        6 => _('six'),
                                        7 => _('seven'),
                                        8 => _('eight'),
                                        9 => _('nine'),
                                        10 => _('ten'),
                                        11 => _('eleven'),
                                        12 => _('twelve'),
                                        13 => _('thirteen'),
                                        14 => _('fourteen'),
                                        15 => _('fifteen'),
                                        16 => _('sixteen'),
                                        17 => _('seventeen'),
                                        18 => _('eighteen'),
                                        19 => _('nineteen')     );

        $Tens = array(  0 => '',
                                        1 => '',
                                        2 => _('twenty'),
                                        3 => _('thirty'),
                                        4 => _('forty'),
                                        5 => _('fifty'),
                                        6 => _('sixty'),
                                        7 => _('seventy'),
                                        8 => _('eighty'),
                                        9 => _('ninety') );


    if ($NoOfTens OR $NoOfOnes) {
                if (!empty($NumberInWords)) {
                        $NumberInWords .= ' ' . _('and') . ' ';
                }

                if ($NoOfTens < 2){
                        $NumberInWords .= $Ones[$NoOfTens * 10 + $NoOfOnes];
                }
                else {
                        $NumberInWords .= $Tens[$NoOfTens];
                        if ($NoOfOnes) {
                                $NumberInWords .= '-' . $Ones[$NoOfOnes];
                        }
                }
        }

        if (empty($NumberInWords)){
                $NumberInWords = _('zero');
    }

        return $NumberInWords;
}
    


?>
