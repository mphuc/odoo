<?php 
   $self -> document -> setTitle('Transaction History'); 
   echo $self -> load -> controller('common/header'); 
   echo $self -> load -> controller('common/column_left'); 
   ?>
<div class="content-page">
        <div class="content">
   
 
   <div class="page-title-group">
                <h4 class="page-title">History C Wallet</h4>
                <h5 class="text-muted page-title-alt"></h5>
            </div>
    <div class="container">
    <?php if(count($histotys) > 0){ ?>
    <div class="row">
                        <div class="col-md-12">
                            <div class="card-box">
                              
                                    <div class="table-responsive data-table" id="no-more-tables">
                      <table id="datatable" class="table table-striped ">
                                            <thead>
                                               <tr>
                                                <th class="text-center"><?php echo $lang['column_no'] ?></th>
                                        <th>Type</th>
                                        <th><?php echo $lang['column_date_added'] ?></th>
                                        <th><?php echo $lang['column_amount'] ?></th>
                                        <th><?php echo $lang['column_description'] ?></th>
                                               </tr>
                                            </thead>
                                            <tbody>
                                                
                                                 <?php $number = 1; foreach ($histotys as $key => $value) {?>
                                          <tr>
                                               <td data-title="<?php echo $lang['column_no'] ?>." align="center"><?php echo $number ?></td>
                                              <td data-title="Type"><?php echo $value['wallet'] ?></td>
                                              <td data-title="<?php echo $lang['column_date_added'] ?>"><?php echo date("l jS \of F Y ", strtotime($value['date_added'])); ?></td>
                                              <td data-title="<?php echo $lang['column_amount'] ?>"><?php echo $value['text_amount'] ?></td>
                                              <td data-title="<?php echo $lang['column_description'] ?>">
                                                  <?php echo $value['system_decsription'] ?>
                                              </td>
                                             
                                          </tr>
                                      <?php $number++; } ?>
                                                    
                                              
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="row mob-center">
                                       
                                        <div class="col-sm-12 tex-right">
                                            <?php echo $pagination; ?>
                                        </div>
                                    </div>
                               
                            </div>
                        </div>
                        </div>
                        <?php } ?>
                </div>
              </div>
            </div>
  
<?php echo $self->load->controller('common/footer') ?>