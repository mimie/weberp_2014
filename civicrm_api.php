<?php
  require_once '/mnt/html/webapp/sites/all/modules/civicrm/civicrm.config.php';
  require_once 'CRM/Core/Config.php';
  
  $events = civicrm_api('Event', 'Get', array(
    'version' => 3,
  ));
?>
  
  <?php if ( civicrm_error ( $events )):?> 
  <?php echo $events['error_message']; ?>
  <?php else:?>
  <form>
     <select name=eventsList>
      <?php foreach($events['values'] as $event):?>
        <option value=<?=$event['id']?>><?=$event['event_title']?></option>
      <?php endforeach;?>
     </select>
     <input type=submit>
  </form>
  <?php endif;?>

  <?php if ( isset($_GET['eventsList']) && !civicrm_error ( $participants )):?> 
    <?php
      $participants = civicrm_api('Participant', 'Get', array(
        'version' => 3,
        'event_id' => $_GET['eventsList']['event_id'],
     //   'status_id' => 3,
      ));
     ?>
    <table>
    <th>Civicrm ID</th>
    <th>Customer Code</th>
    <th>Customer Name</th>
    <th>Billing No.</th>
    <th>Amount</th>
    <?php foreach($participants['values'] as $participant):?>
      <tr>
        <td><?= $participant['contact_id']?></td>
        <td>IIAP<?= $participant['contact_id']?></td>
        <td><?= $participant['display_name']?></td>
        <td><?= $participant['participant_type'].$participant['participant_id']?></td>
        <td><?= isset($participant['participant_fee_amount']) ? $participant['participant_fee_amount'] : 0?></td>
      </tr>
    <?php endforeach;?>
    </table>
  <?php else:?>
    <?php echo $participants['error_message']; ?>
  <?php endif;?>
