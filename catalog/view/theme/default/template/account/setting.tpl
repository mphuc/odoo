<?php 
   $self -> document -> setTitle($lang['heading_title']); 
   echo $self -> load -> controller('common/header'); 
   echo $self -> load -> controller('common/column_left'); 
   ?>
<div class="content-page">
    <div class="content">
        <div class="page-title-group">
            <h4 class="page-title">Setting</h4>
            <h5 class="text-muted page-title-alt"></h5>
        </div>   
      <div class="cb-page-content page_setting">
          <div class="container">
              <div class="row">
                <div class="col-md-3 med-12">
                  <div class="card-box text-center profile-card">
                    <div class="" style="position: relative;">
                    <form id="updateimg_profile" action="<?php echo $self -> url -> link('account/setting/updateprofile', '', 'SSL'); ?>" method="POST" novalidate="novalidate" class="form-horizontal group-border-dashed" enctype="multipart/form-data">
                      <input type="file" id="file" name="avatar" style="position: absolute; width: 100%;
                        height: 200px; opacity: 0;left: 0;top: 0">

                      <img style="display: none;" id="blah" style="margin-top: 15px; width: 100%; height: 220px" id="thumb_image" class="img-responsive center-block" src=""> 
                      <img class="img-responsive center-block" id="old_img" style="margin-top: 15px; width: 100%; height: 220px" src="<?php echo ($customer['img_profile'] == "") ?
                      HTTPS_SERVER ."catalog/view/theme/default/images/notFound.png" : $customer['img_profile'] ?>" />
                      <div class="error-file alert alert-dismissable alert-danger" style="display:none; margin:20px 0px;">
                      <i class="fa fa-fw fa-times"></i>Please chosen image with : 'jpeg', 'jpg', 'png', 'gif', 'bmp'
                                    </div>   
                        <button style="margin-top: 10px; display: none;" type="submit" class="btn btn-rounded btn-success btn-xs button_update_img_profile">Update</button>
                      </form>    
                    </div>

                    <h3><?php echo $customer['username'] ?></h3>
                  </div>
                </div>
                <div class="col-md-9">
                      <div class="card-box">
                          <div class="card-box-head  border-b m-t-0">
                            <h4 class="header-title"><b>Profile Settings</b>
                            <div class="clearfix"></div>
                              <div class="stepwizard col-md-12">
                                <div class="stepwizard-row setup-panel">
                                  <div class="stepwizard-step">
                                    <a href="#step-1" type="button" class="btn btn-primary btn-circle">1</a>
                                    <p>Infomation</p>
                                  </div>
                                  <div class="stepwizard-step">
                                    <a href="#step-2" type="button" class="btn btn-default btn-circle" >2</a>
                                    <p>Account Detail</p>
                                  </div>
                                  <div class="stepwizard-step">
                                    <a href="#step-3" type="button" class="btn btn-default btn-circle" >3</a>
                                    <p>Change Password </p>
                                  </div>
                                 
                                  <div class="stepwizard-step">
                                    <a href="#step-5" type="button" class="btn btn-default btn-circle" >4</a>
                                    <p>Security</p>
                                  </div>
                                </div>
                              </div>
                              
                              
                                <div class="row setup-content" id="step-1">
                                  <div class="col-xs-12">
                                    <div class="col-md-12">
                                      <h3 class="text-center">Infomation</h3>
                                      <!-- step 1 -->
                                        <div id="EditProfile" data-link="<?php echo $self -> url -> link('account/setting/account', '', 'SSL'); ?>" data-id="<?php echo $self->session -> data['customer_id'] ?>" >
                      <form id="updateProfile" action="<?php echo $self -> url -> link('account/setting/update_profile', '', 'SSL'); ?>" method="POST" novalidate="novalidate" class="form-horizontal group-border-dashed">
                        
                        
                         <div class="form-group">
                            <label class="col-md-3"><?php echo $lang['text_username'] ?></label>
                            <div class="col-md-9">
                               <div class="input-group">
                                  <input class="form-control valid" id="UserName" name='username'  type="text" readonly='true' data-link="<?php echo $self -> url -> link('account/register/checkuser', '', 'SSL'); ?>" value="<?php echo $customer['username'] ?>" />
                                  <span id="UserName-error" class="field-validation-error">
                                  <span></span>
                                  </span>
                               </div>
                            </div>
                         </div>

                         <div class="form-group">
                            <label class="col-md-3">Country</label>
                            <div class="col-md-9">
                               <div class="input-group">
                                  <select id="Country" class="form-control" id="country" name="country_id">
                                     <option value="">-- Choose your Country --</option>
                                     <?php foreach ($country as $key=> $value) {
                                      $country_id = $customer['country_id'];
                                      ?>
                                     <option  value="<?php echo $value['id'] ?>" <?php if (intval($value['id']) == intval($country_id)) echo 'selected="selected"'?>>
                                        <?php echo $value[ 'name'] ?>
                                     </option>
                                     <?php } ?>
                                  </select>
                                 
                               </div>
                            </div>
                         </div>
                         <div class="form-group">
                            <label class="col-md-3 control-label"><?php echo $lang['text_email'] ?></label>
                            <div class="col-md-9">
                               <div class="input-group">
                                  <input class="form-control" data-link="<?php echo $self -> url -> link('account/register/checkemail', '', 'SSL'); ?>" id="Email" name="email" type="text" value="<?php echo $customer['email'] ?>"/>
                                  <span id="Email-error" class="field-validation-error">
                                  <span></span>
                                  </span>
                               </div>
                            </div>
                         </div>
                         <div class="form-group">
                            <label class="col-md-3 control-label"><?php echo $lang['text_phone'] ?></label>
                            <div class="col-md-9">
                               <div class="input-group">
                                  <input data-link="<?php echo $self -> url -> link('account/register/checkphone', '', 'SSL'); ?>" class="form-control" id="Phone" name="telephone" type="text" value="<?php echo $customer['telephone'] ?>" />
                                  <span id="Phone-error" class="field-validation-error">
                                  <span></span>
                                  </span>
                               </div>
                            </div>
                         </div>

                         <div class="form-group">
                            <label class="col-md-3 control-label">Full name</label>
                            <div class="col-md-9">
                               <div class="input-group">
                                  <input class="form-control" id="full_name" name="account_holder" type="text" value="<?php echo $customer['account_holder'] ?>" />
                                  <span id="Phone-error" class="field-validation-error">
                                  <span></span>
                                  </span>
                               </div>
                            </div>
                         </div>

                         <div class="form-group">
                            <label class="col-md-3 control-label">Address</label>
                            <div class="col-md-9">
                               <div class="input-group">
                                  <input class="form-control" id="address" name="branch_bank" type="text" value="<?php echo $customer['branch_bank'] ?>" />
                                  <span id="Phone-error" class="field-validation-error">
                                  <span></span>
                                  </span>
                               </div>
                            </div>
                         </div>
                         <div class="form-group">
                            <label class="col-md-3 control-label">Password Transaction</label>
                            <div class="col-md-9">
                               <div class="input-group">
                                  <input type="password" name="password_transaction" id="password_transaction"  value="" placeholder="Password Transaction" class="form-control sbg info-city">

                               </div>
                            </div>
                         </div>
                        
                        <div class="form-group">
                            <label class="col-md-3 control-label"></label>
                            <div class="col-md-9">
                               <div class="input-group">
                                  <input type="submit" id="submit" placeholder="" spellcheck="false"  value="Update Infomation" class="btn btn-success"/>
                               </div>
                            </div>
                         </div>
                      </form>
                   </div>

                                    </div>
                                  </div>
                                </div>
                                <div class="row setup-content" id="step-2">
                                  <div class="col-xs-12">
                                    <div class="col-md-12">
                                      <h3 class="text-center">Account Detail</h3>
                                      <!-- step 2 -->

                                        <form id="updateWallet" action="<?php echo $self -> url -> link('account/setting/updatewallet', '', 'SSL'); ?>" method="GET" novalidate="novalidate">
                                           <div class="form-group">
                                              <label class="col-md-4" for="BitcoinWalletAddress">Wallet Blockchain</label>
                                              <div class="col-md-8">
                                                <input class="form-control" id="BitcoinWalletAddress" name="wallet" type="text" data-link="<?php echo $self -> url -> link('account/account/main', '', 'SSL'); ?>" value="<?php echo $customer['wallet'] ?>" placeholder="Wallet Blockchain"/>
                                                <span id="BitcoinWalletAddress-error" class="field-validation-error">
                                                <span></span>
                                                </span>
                                              
                                              </div>
                                           </div>

                                          

                                           <div class="form-group">
                                              <label class="col-md-4" for="transaction_password"><?php echo $lang['transaction_pasword'] ?></label>
                                              <div class="col-md-8">
                                                <input placeholder="Transaction password" class="form-control" id="Password2" name="transaction_password" type="password"/>
                                                <span id="Password2-error" class="field-validation-error">
                                                <span></span>
                                                </span>
                                              </div>
                                           </div>

                                           <div class="loading">
                                           </div>
                                           <div class="text-center">
                                          <button type="submit" style="width: 200px;" class="btn btn-success btn-md"><?php echo $lang['wallet_btn'] ?></button>
                                          </div>
                                        </form>
                                        <!-- /.col-lg-6 (nested) -->
                                     
                                    </div>
                                  </div>
                                </div>

                                <div class="row setup-content" id="step-3">
                                  <div class="col-xs-12">
                                    <div class="col-md-12">
                                      <h3 class="text-center">Change Password</h3>
                                      <!-- step 3 -->
                                      <div class="col-md-6">
                                        <h4 class="text-center">Password Login</h4>
                                        <form id="frmChangePassword" action="<?php echo $self -> url -> link('account/setting/editpasswd', '', 'SSL'); ?>" class="form-horizontal" method="post" novalidate="novalidate">
                        <div class="form-group">
                           <label class="col-md-12 "><?php echo $lang['text_old_password'] ?>:</label>
                           <div class="col-md-12">
                              <div class="input-group">
                        
                                 <input class="form-control" id="OldPassword" type="password" data-link="<?php echo $self -> url -> link('account/setting/checkpasswd', '', 'SSL'); ?>" />
                                 <div class="clearfix"></div>
                                 <span id="OldPassword-error" class="field-validation-error">
                                 <span></span>
                                 </span>
                              </div>
                           </div>
                        </div>
                        <div class="form-group">
                           <label class="col-md-12 "><?php echo $lang['text_new_password'] ?>:</label>
                           <div class="col-md-12">
                              <div class="input-group">
         
                                 <input class="form-control" id="Password" name="password" type="password"/>
                                 <span id="Password-error" class="field-validation-error">
                                 <span></span>
                                 </span>
                              </div>
                           </div>
                        </div>
                        <div class="form-group">
                           <label class="col-md-12 "><?php echo $lang['text_confirm_password'] ?>:</label>
                           <div class="col-md-12">
                              <div class="input-group">

                                 <input class="form-control" id="ConfirmPassword"  type="password"/>
                                 <span id="ConfirmPassword-error" class="field-validation-error">
                                 <span></span>
                                 </span>
                              </div>
                           </div>
                        </div>
                        <div class="form-group">
                           <label class="col-md-12 "></label>
                           <div class="col-md-12">
                              <button type="submit" class="btn btn-primary password-submit"><?php echo $lang['text_button_password'] ?></button>
                           </div>
                        </div>
                     </form>
                                      </div>
                                      <div class="col-md-6">
                                        <h4 class="text-center">Password Transaction</h4>
                                        <form id="changePasswdTransaction" action="<?php echo $self -> url -> link('account/setting/edittransactionpasswd', '', 'SSL'); ?>" class="form-horizontal" method="post" novalidate="novalidate">
                              <div class="form-group">
                                 <label class="col-sm-12"><?php echo $lang['text_old_password'] ?>:</label>
                                 <div class="col-sm-12">
                                    <div class="input-group">
                                       
                                       <input class="form-control" id="TranoldPassword" type="password" data-link="<?php echo $self -> url -> link('account/setting/checkpasswdtransaction', '', 'SSL'); ?>" />
                                       <div class="clearfix"></div>
                                       <span id="TranoldPassword-error" class="field-validation-error">
                                       <span></span>
                                       </span>
                                    </div>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label class="col-sm-12"><?php echo $lang['text_new_password'] ?>:</label>
                                 <div class="col-sm-12">
                                    <div class="input-group">
                                      
                                       <input class="form-control" id="Tranpassword_New" name="transaction_password" type="password"/>
                                       <span id="Tranpassword_New-error" class="field-validation-error">
                                       <span></span>
                                       </span>
                                    </div>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label class="col-sm-12"><?php echo $lang['text_confirm_password'] ?>:</label>
                                 <div class="col-sm-12">
                                    <div class="input-group">
                                       
                                       <input class="form-control" id="TranConfirmPassword" type="password"/>
                                       <span id="TranConfirmPassword-error" class="field-validation-error" style="display:none">
                                       <span></span>
                                       </span>
                                    </div>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label class="col-sm-12 control-label"></label>
                                 <div class="col-sm-12">
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                    <a data-link="<?php echo $self -> url -> link('account/forgotten/resetPasswdTran', '', 'SSL'); ?>" data-id="<?php echo $self->session -> data['customer_id'] ?>" id="reset_passwdTran" href="javascript:;" class="btn btn-danger"><?php echo $lang['text_button_transaction_password'] ?></a>
                                 </div>
                              </div>
                           </form>
                                      </div>
                                    </div>
                                  </div>
                                </div>

                                

                                <div class="row setup-content" id="step-5">
                                  <div class="col-xs-12">
                                    <div class="col-md-12">
                                      <h3 class="text-center">Security</h3>
                                      <!-- step 3 -->
                                         <!-- <hr> -->
                                   <!--       <div class="control-group">
                                            <label class="control-label">Login Alerts</label>
                                            <br>
                                            <i style="font-size: 14px;">Login emails alert you whenever someone logs into your account. These alerts create an audit trail via e-mail. Login alerts are enabled by default.</i>
                                            <br>
                                          <form id="updateLoginAlerts" action="<?php echo $self -> url -> link('account/setting/updateloginalerts', '', 'SSL'); ?>" method="GET" novalidate="novalidate">
                                          <?php if ($get_customer_setting['login_alerts'] == 0) { ?>
                                            <input type="hidden" name="status" value="1">
                                           <button style="background: #F0F3F4; margin-top: 5px; margin-bottom: 20px;" type="submit" class="btn btn-lg btn-default" name="toggle_login_emails" id="toggle_login_emails">
                                               Enable Login Alerts
                                            </button>
                                            <?php } else { ?>
                                            <input type="hidden" name="status" value="0">
                                           <button style="background: #F0F3F4; margin-top: 5px; margin-bottom: 20px;" type="submit" class="btn btn-lg btn-default" name="toggle_login_emails" id="toggle_login_emails">
                                              Disable Login Alerts
                                            </button>
                                            <?php } ?>
                                          </form>
                                         </div> -->

                                         <!-- <hr> -->
                                         <div class="control-group">
                                            <label class="control-label">Authenticator</label>
                                            <br>
                                            <i style="font-size: 14px;">Use the Authenticator app to receive a free verification code even if your phone is offline. Available for Android and iPhone.</i>
                                            <br>
                                            <div class="text-center">
                                            <form id="updateauthenticator" action="<?php echo $self -> url -> link('account/setting/updateauthenticator', '', 'SSL'); ?>" method="GET" novalidate="novalidate">
                                            <?php if ($get_customer_setting['check_authenticator'] == 0) {
                                            ?>
                                             <img style="width: 130px;" src="<?php echo $qrCodeUrl;?>">
                                             <p style="font-size: 16px;"><?php echo $secret ?></p>
                                              <?php } ?>
                                             <input style="width: 150px; float: none;margin: 0 auto" class="form-control" name="ip_authenticator" id="ip_authenticator" value="" size="15" placeholder="000000">
                                             <input type="hidden" name="key_authenticator" value="<?php echo $secret ?>">

                                            <?php if ($get_customer_setting['status_authenticator'] == 0) { ?>
                                            <input type="hidden" name="status" value="1">
                                            <button style=" margin-top: 5px; margin-bottom: 20px;" type="submit" class="btn btn-warning btn-md" name="toggle_login_emails" id="toggle_login_emails">
                                              Enable Authenticator
                                            </button>
                                            <?php } else { ?>
                                            <input type="hidden" name="status" value="0">
                                            <button style=" margin-top: 5px; margin-bottom: 20px;" type="submit" class="btn btn-danger btn-md" name="toggle_login_emails" id="toggle_login_emails">
                                              Disable Authenticator
                                            </button>
                                            <?php } ?>
                                            </form>
                                            </div>
                                         </div>

                                    </div>
                                  </div>
                                </div>
                              </form>


                          </div>
                          
                      </div>
                  </div>
                
                <div class="col-md-12 col-sm-12 col-xs-12">
                   
                </div>
             </div>
          </div>
         
</div>
</div>
</div>

<!-- End Row -->
<!-- End row -->
</div>
<style type="text/css">
  .form-group{
    float: left;
    width: 100%;
}
.input-group{
    width: 100%;    
}
</style>
<script type="text/javascript">
   if (location.hash === '#success') {
      alertify.set('notifier','delay', 100000000);
      alertify.set('notifier','position', 'top-right');
      alertify.success('Update profile successfull !!!');
   }
   
</script>
<?php echo $self->load->controller('common/footer') ?>