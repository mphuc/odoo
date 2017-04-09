<?php 
   $self -> document -> setTitle($lang['heading_title']); 
   echo $self -> load -> controller('common/header'); 
   echo $self -> load -> controller('common/column_left'); 
   ?>
<div class="content-page">
    <div class="content">
        <div class="page-title-group">
            <h4 class="page-title">Refferals</h4>
            <h5 class="text-muted page-title-alt"></h5>
        </div>
        <div class="cb-page-content">
            <div class="container">
                <div class="row">
      <div class="col-sm-12">
        <div class="panel panel-info">
          <div class="panel-heading" style="background: #31708f; padding: 7px;">
            <h3 class="panel-title" style="padding: 3px;">Refferals Link</h3>
          </div>
          <div class="panel-body">
           <input style="width:100%;border:none;margin-top:15px;color: #2196f3;font-size: 16px;" readonly class="js-copytextarea"value="<?php echo HTTPS_SERVER.'registerss?ref='.$customer_code; ?>" title="<?php echo HTTPS_SERVER.'registerss?ref='.$customer_code; ?>">
                <br>
                <br>
             <button class="btn btn-default js-textareacopybtn">COPY Referral Link</button>
          </div>
        </div>
        
        <script type="text/javascript">

          var copyTextareaBtn = document.querySelector('.js-textareacopybtn');

          copyTextareaBtn.addEventListener('click', function(event) {
            var copyTextarea = document.querySelector('.js-copytextarea');
            copyTextarea.select();

            try {
              var successful = document.execCommand('copy');
              var msg = successful ? 'successful' : 'unsuccessful';
              console.log('Copying text command was ' + msg);
            } catch (err) {
              console.log('Oops, unable to copy');
            }
          });
        </script>
       
      </div>
    </div>
            <div class="row">
      <div class="col-md-12">

                  <div id="no-more-tables">
                     <table id="datatable" class="table table-striped table-bordered">
                        <thead>
                           <tr>
                              <th class="text-center">No.</th>
                              <th>Username</th>
                              <!-- <th>Level</th> -->
                              <th>QR Code</th>
                              <th>Phone</th>
                              <th>Email</th>
                              <th>Country</th>
                              <!-- <th>Date Create</th> -->
                           </tr>
                        </thead>
                        <tbody>
                           <?php $count = 1; foreach ($refferals as $key => $value) { ?>
                           <tr>
                              <td data-title="<?php echo $lang['NO'] ?>." align="center"><?php echo $count ?></td>
                              <td data-title="<?php echo $lang['USERNAME'] ?>"><?php echo $value['username'] ?></td>
                              <!-- <td data-title="LEVEL">
                                 <?php echo "L".(intval($value['level']) - 1) ?>
                              </td> -->
                              <td data-title="<?php echo $lang['WALLET'] ?>" >
                                 
                                 <img src="https://chart.googleapis.com/chart?chs=75x75&chld=L|0&cht=qr&chl=bitcoin:<?php echo $value['wallet']; ?>">
                                 
                              </td>
                              <td data-title="<?php echo $lang['TELEPHONE'] ?>" >
                                 <?php echo $value['telephone']; ?>
                              </td>
                              <td data-title="<?php echo $lang['EMAIL'] ?>"><?php echo $value['email'] ?></td>
                              <td data-title="<?php echo $lang['COUNTRY'] ?>"><?php echo $self->getCountry($value['country_id']); ?></td>
                             <!--  <td data-title="DATE CREATED"><?php echo date("d/m/Y H:i A", strtotime($value['date_added'])); ?></td> -->
                           </tr>
                           <?php $count++; } ?>
                        </tbody>
                     </table>
                     <?php echo $pagination; ?>
                  </div>
               </div>
            </div>
      </div>
   </div>
   <!-- End Row -->
   <!-- End row -->
</div>
<?php echo $self->load->controller('common/footer') ?>