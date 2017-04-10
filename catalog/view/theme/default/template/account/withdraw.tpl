<?php $self->document->setTitle("Withdrawal"); echo $self->load->controller('common/header');?>
<!-- Sidebar -->
<?php echo $self->load->controller('common/column_left');  ?>
<!-- /#sidebar-wrapper -->
<!-- Page Content -->
<div class="content-page">
        <div class="content">
   
 
   <div class="page-title-group">
                <h4 class="page-title">Investment</h4>
                <h5 class="text-muted page-title-alt"></h5>
            </div>
   <div class="cb-page-content">
         <div class="container">
      <div class="row">
         <div class="col-lg-6 col-sm-6">
            <!-- Colors -->
            <div class="card-box" style="min-height: 271px;">
               <div class="card-header">
              
                  <h4>Available for withdrawal</h4>
                
               </div>
               <div class="card-block">
                  <div class="row">
                   <?php if (intval($access_withdrawal) == 1){ ?>
                     <form id="tranfer_cm_btc" action="index.php?route=account/withdraw/submit_my_transaction" method="post" onsubmit="return false;">


                        <div class="col-xs-11">
                <code style="font-size: 30px;"><?php echo $getCWallet; ?> BTC</code>
                              <!--   
                                 <p><span class="text-info">Min Withdrawal: 0.005 BTC</span></p> -->
                           <div class="form-group">
                              <label for="example-nf-password">Amount</label>
                                    <input class="form-control" type="text"  id="amount_usd" name="amount_usd" placeholder="Amount withdrawal">

                           </div>
                             <div class="form-group has-error">
                              <p class="error help-block error_amount" style="display:none">Please enter amount</p>
                               
                           </div>
                           <div class="form-group">
                              <label for="example-nf-password">Password Transaction</label>
                              <input class="form-control" type="password" id="password_transaction_btc" name="password_transaction" placeholder="Enter Password Transaction..">
                               
                           </div>
                           <div class="form-group has-error">
                              <p class="error help-block error_password_transaction_btc" style="display:none">Please enter a transaction password</p>
                                <p class="help-block animated fadeInDown error_password_transaction_deal_btc" style="display:none">Password do not macth</p>
                           </div>
                           <div class="form-group m-b-0">
                              <button class="btn btn-app" type="submit">Confirm</button>
                           </div>
                        </div>
                     </form>
                   <?php } else{ ?>
                  
                        <div class="col-xs-11">
                <code style="font-size: 30px;">C Wallet <?php echo $getCWallet; ?> BTC</code>
                            
                              <a href="javascript:void(0)" class="btn btn-rounded btn-custom btn-pink btn-md" style=" margin-top: 40px; white-space: initial">The withdrawal function will be reopened on a Sunday each week</a>
                           
                            <p></p>
                        </div>
                 
                  <?php } ?>
                     
                  </div>
               </div>
               <!-- .card-block -->
            </div>
            <!-- .card -->
            <!-- End Colors -->
         </div>
         <!-- .col-lg-6 -->
         <div class="col-lg-6 col-sm-6">
            <!-- Sizes -->
            <div class="card-box">
               <div class="card-header">
                  <h4>Your Wallet</h4>
               </div>
               <div class="card-block">
                  <div class="row">
                     <div class="col-xs-12 text-center">
                        <div class="item_wallet">
                           <div class="wallet wallet_blockcio">
                              <img src="https://chart.googleapis.com/chart?chs=150x150&cht=qr&chl=<?php echo $customer['wallet'] ?>" alt="" style=" float: none;  height: 200px;">
                           </div>
                           <p><?php echo $customer['wallet'] ?></p>
                         
                           <p></p>
                        </div>
                     </div>
                  </div>
               </div>
               <!-- .card-block -->
            </div>
            <!-- .card -->
            <!-- End Sizes -->
         </div>
         <!-- .col-lg-6 -->
      </div>
      <div class="row">
         <div class="col-sm-12">
            <div class="card-box" id="sample-card">
               <div class="card-header">
                  <h4>History Withdrawal</h4>
                 
               </div>
               <div class="card-block">
                  <div id="no-more-tables" class="table-responsive">
                     <table id="datatable" class="table  table-hover">
                        <thead>
                           <tr>
                              <th class="text-center">No.</th>
                              <!-- <th>Item</th> -->
                              <th>Date</th>
                              <th>Amount</th>
                              <th>Detail</th>
                              <th>Link</th>
                           </tr>
                        </thead>
                        <tbody>
                           <?php $number = 1; foreach ($histotys as $key => $value) {?>
                           <tr>
                              <td data-title="No." align="center"><?php echo $number ?></td>
                              <!-- <td data-title="Item"><?php echo $value['wallet'] ?></td> -->
                              <td data-title="Date"><?php echo date("d/m/Y H:i A", strtotime($value['date_added'])); ?></td>
                              <td data-title="Amount"><?php echo $value['text_amount'] ?></td>
                              <td data-title="Detail">
                                 <?php echo $value['system_decsription'] ?>
                              </td>
                              <td data-title="Link">
                              <?php if (($value['url']) == ' ') {
                                echo '<button class="btn btn-warning btn-xs" type="button">Pending</button>';
                              }else{
                                echo '<button class="btn btn-xs btn-success" type="button">'.$value['url'].'</button>';
                            
                                } ?>
                                
                              </td>
                           </tr>
                           <?php $number++; } ?>
                        </tbody>
                     </table>
                     <?php echo $pagination; ?>
                  </div>
               </div>
            </div>
         </div>
      </div>
    </div>
   </div>
</div>
</div>
<!-- /#page-content-wrapper -->
<?php echo $self->load->controller('common/footer') ?>