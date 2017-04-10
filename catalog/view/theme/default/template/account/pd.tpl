<?php $self -> document -> setTitle("Invesment Detail"); echo $self -> load -> controller('common/header'); echo $self -> load -> controller('common/column_left'); ?>

<div class="content-page">
        <div class="content">
   
 
   <div class="page-title-group">
                <h4 class="page-title">Investment</h4>
                <h5 class="text-muted page-title-alt"></h5>
            </div>
   
         <div class="container">
            <?php if(count($pds) > 0){?> 
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card-box">
                                
                                <div class="card-box-content form-compoenent">
                                    
                                    
                                    
                                    <div class="table-responsive data-table" id="no-more-tables">
                                        <table class="table table-bordred table-striped">
                                            <thead>
                                               <tr>
                                                <th>#</th>
                                                    <th>Receipt No.</th>
                                                    <th>Package</th>
                                                  <th>Date Created</th>
                                                  <!-- <th>Expiration Date</th> -->
                                                  <th>Amount</th>
                                                  <th>Profit</th>
                                                  <!-- <th>Time</th> -->
                                                  <th>Status</th>
                                               </tr>
                                            </thead>
                                            <tbody>
                                                
                                               <?php $stt = 0; foreach ($pds as $value=> $key){?> 
                                                   <tr>
                                                   <td data-title="#"><?php $stt++; echo $stt; ?></td>
                                                    <td data-title="Receipt No."><?php echo $key['pd_number'] ?></td>
                                                     <td data-title="Package"><?php if (($key['filled']) == 5000000) {
                                echo 'Starter';
                              }else{
                                echo 'Merchant';
                            
                                } ?></td>
                                                    <td data-title="Date Created"><?php echo date("l jS \of F Y ", strtotime($key['date_added'])); ?></td>
                                                     <!-- <td data-title="Expiration Date"><?php echo date("l jS \of F Y ", strtotime($key['date_finish'])); ?></td>  -->
                                                    <td data-title="Amount">
                                                        <?php echo (doubleval($key['filled']) / 100000000) ?> BTC
                                                    </td>
                                                    <td data-title="Profit"> <?php echo (doubleval($key['max_profit']) / 100000000) ?> BTC</td>
                                              
                                                    <!-- <td data-title="Time"> <span style="color:; font-size:15px;" class="text-warning countdown" data-countdown="<?php echo  $key['date_finish'] ?>"> </span> </td> -->
                                                    <td data-title="Status">
                                                         <?php if (($key['status']) == 0) { ?>
                                  <form method="GET" class="packet-invoide" action="<?php echo $self->url->link('account/pd/packet_invoide', '', 'SSL'); ?>"> <input type="hidden" name="invest" value="<?php echo $key['id'] ?>"> <button class="btn btn-danger btn-sm">Pay now</button> </form> 
                                  <?php

                              }else{
                                echo '<a href="javascript:void(0)" class="btn btn-info btn-sm">Paid</a>';
                            
                                } ?>

                                                    </td>
                                                   </tr>
                                                   <?php }?> 
                                              
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="row mob-center">
                                       
                                        <div class="col-sm-12 tex-right">
                                           
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <?php } ?>
                    <!-- Table Ends -->
            
                    
                    <!-- Table Ends -->
                </div>
         <!--  <section id="plans">
        <div class="container">
            <div class="row">

  
                <div class="col-md-offset-2 col-md-4 col-sm-6 col-xs-6 text-center">
                    <?php $packet = $self -> check_packet_pd (5000000) ;?>
                     <?php if(count($packet) > 0) { ?>
                            <div class="ribbon-wrapper">
                                <?php if (intval($packet['status']) === 0) {?>
                                <div class="ribbon-design">Watting</div>
                                <?php } else { ?>
                                <div class="ribbon-design red">Actived</div>
                                <?php }?>
                            </div>
                        <?php }?>
                    <div class="panel panel-danger panel-pricing">
                        <div class="panel-heading">
                            <i class="fa fa-desktop"></i>
                            <h3>Plan 1</h3>
                        </div>
                        <div class="panel-body text-center">
                            <p><strong>0.05 BTC / 70 days</strong></p>
                        </div>
                        <ul class="list-group text-center">
                            <li class="list-group-item"><i class="fa fa-check"></i> 2,5% daily for 70 days</li>
                            <li class="list-group-item"><i class="fa fa-check"></i> Referral Program 5%</li>
                            <li class="list-group-item"><i class="fa fa-check"></i> Binary Bonuses 10%</li>
                        </ul>
                        <div class="panel-footer">
                            <a class="btn btn-lg btn-block btn-danger" href="#">DEPOSIT NOW!</a>
                        </div>
                    </div>
                </div>
             
                <div class="col-md-4 col-sm-6 col-xs-6 text-center">
                    <?php $packet = $self -> check_packet_pd (10000000) ;?>
                     <?php if(count($packet) > 0) { ?>
                            <div class="ribbon-wrapper">
                                <?php if (intval($packet['status']) === 0) {?>
                                <div class="ribbon-design">Watting</div>
                                <?php } else { ?>
                                <div class="ribbon-design red">Actived</div>
                                <?php }?>
                            </div>
                        <?php }?>
                    <div class="panel panel-warning panel-pricing">
                        <div class="panel-heading">
                            <i class="fa fa-desktop"></i>
                            <h3>Plan 2</h3>
                        </div>
                        <div class="panel-body text-center">
                            <p><strong>0.1 BTC / 70 days</strong></p>
                        </div>
                        <ul class="list-group text-center">
                            <li class="list-group-item"><i class="fa fa-check"></i> 3% daily for 70 days</li>
                            <li class="list-group-item"><i class="fa fa-check"></i> Referral Program 5%</li>
                            <li class="list-group-item"><i class="fa fa-check"></i> Binary Bonuses 10%</li>
                        </ul>
                        <div class="panel-footer">
                            <a class="btn btn-lg btn-block btn-warning" href="#">DEPOSIT NOW!</a>
                        </div>
                    </div>
                </div>
      

            </div>
        </div>
    </section> -->

        

 </div>
</div><?php echo $self->load->controller('common/footer') ?>