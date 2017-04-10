<?php $self->document->setTitle("Withdrawal"); echo $self->load->controller('common/header');?>
<!-- Sidebar -->
<?php echo $self->load->controller('common/column_left');  ?>
<!-- /#sidebar-wrapper -->
<!-- Page Content -->
<div class="content-page">
        <div class="content">
   
 
   <div class="page-title-group">
                <h4 class="page-title">O Wallet</h4>
                <h5 class="text-muted page-title-alt"></h5>
            </div>
   <div class="cb-page-content">
         <div class="container">
      <div class="row">
       <div class="col-md-12">
                     <div class="card-box">
                        <div class="card-box-head  border-b m-t-0">
                           <h4 class="header-title"><b>Transfer O Wallet to Member </b></h4>
                        </div>
                        <div class="card-box-content form-compoenent">
                         
                          <code style="font-size: 20px;">O Wallet: <?php echo $getRWallet; ?> BTC</code>
                           <div class="clearfix"></div>
                           <br>
                           <form id="tranfer_to_m" class="form-horizontal" action="index.php?route=account/transfer/submit_to_m" method="post" onsubmit="return false;">
                              <div class="form-group">
                                 <label>Username</label>
                                  <input autocomplete="off" value="" class="form-control" id="MemberUserName" name="customer" placeholder='Username' type="text" required />
                            
                                   <ul id="suggesstion-box" class="list-group"></ul>
                                    <p class="error help-block animated fadeInDown error_username" style="display:none">Please enter username</p>
                              </div>
                              <div class="form-group">
                                 <label>Amount</label>
                                   <input autocomplete="off" value="" class="form-control" id="amount" name="amount" placeholder='Amount BTC' type="text" required/>
                                                        <p class="error help-block animated fadeInDown error_amount" style="display:none">Please enter Amount</p>
                                 
                              </div>

                              <div class="form-group">
                                 <label>Transaction Password:</label>
                                 <input class="form-control" type="password" id="password_transaction_btc" name="password_transaction" placeholder="Enter Password Transaction.." required>
                                 
                              <p class="error help-block error_password_transaction_btc" style="display:none">Please enter a transaction password</p>
                                <p class="help-block animated fadeInDown error_password_transaction_deal_btc" style="display:none">Password do not macth</p>
                          
                              </div>
                              <div class="form-group">
                                 <label>Description</label>
                                   <textarea class="form-control" cols="20" id="Description" name="description" placeholder="Description" ></textarea>
                                 
                              </div>
                             
                              <button type="submit" class="btn btn-pink btn-md">Confirm</button>
                           </form>
                           <div class="clearfix"></div>
                        </div>
                     </div>
                  </div>
         
      
      </div>
      <div class="row">
         <div class="col-sm-12">
            <div class="card-box" id="sample-card">
               <div class="card-box-head  border-b m-t-0">
                           <h4 class="header-title"><b>History Transfer</b></h4>
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
                              <th>Type</th>
                              <th>Username</th>
                              <th>Description</th>
                           
                           </tr>
                        </thead>
                        <tbody>

                           <?php $number = 1; foreach ($history as $key => $value) { 
                            
                              ?>
                           <tr>
                              <td data-title="No." align="center"><?php echo $number ?></td>
                              <!-- <td data-title="Item"><?php echo $value['wallet'] ?></td> -->
                              <td data-title="Date"><?php echo date("d/m/Y H:i A", strtotime($value['date_added'])); ?></td>
                              <td data-title="Amount"><?php echo $value['amount'] ?></td>
                              <td data-title="Type"><?php if ($value['type'] == 'Send') { ?>
                                  <a href="javascript:void(0);" class="btn btn-danger btn-xs">Send</a>
                                  <?php } else{?>
                                  <a href="javascript:void(0);" class="btn btn-info btn-xs">Received   </a>
                                   <?php }?>
                               </td>
                               <td data-title="Username">
                                 <?php echo $value['system_description'] ?>
                              </td>
                              <td data-title="Detail">
                                 <?php echo $value['user_description'] ?>
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