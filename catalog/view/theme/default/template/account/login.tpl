<!DOCTYPE html>
<html lang="en">

<head>


<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="A fully featured admin theme which can be used to build CRM, CMS, etc.">
<meta name="author" content="SmartBox">


<title>SmartBox | Bootstrap3 Admin Dashboard Template</title>

<link rel="shortcut icon" href="catalog/view/theme/default/assets/images/favicon.png">

<link rel="stylesheet" href="catalog/view/theme/default/assets/plugins/morris/morris.css">
<link rel="stylesheet" href="catalog/view/theme/default/assets/css/bootstrap.css" type="text/css" />
<link rel="stylesheet" href="catalog/view/theme/default/assets/css/core.css" type="text/css" />
<link rel="stylesheet" href="catalog/view/theme/default/assets/css/components.css" type="text/css" />
<link rel="stylesheet" href="catalog/view/theme/default/assets/css/icons.css" type="text/css" />
<link rel="stylesheet" href="catalog/view/theme/default/assets/css/pages.css" type="text/css" />
<link rel="stylesheet" href="catalog/view/theme/default/assets/css/responsive.css" type="text/css" />


<script src="catalog/view/theme/default/assets/js/modernizr.min.js"></script>

</head>

<body class="loreg-page close-it">
<!-- Begin page -->
<div id="logreg-wrapper" class="login-style2 text-center"> 
   <div class="container">
      <a href="#"><img src="catalog/view/theme/default/assets/images/logo-2.png" class="img-responsive center-block" alt=""/></a>
      <p class="lead">Welcome back</p>
   
      <form action="login.html" method="post">
         <div class="form-group">
            <label>Username</label>
            
            <input type="text" name="email" value="<?php echo $email; ?>" placeholder="Enter your email or username" class="form-control" id="email">
         </div>
         <div class="form-group">
            <label>Password</label>
            
            <input type="password" placeholder="Enter your password" class="form-control" id="pwd" name="password" value="<?php echo $password; ?>" >
         </div>
         <div class="form-group">
            <?php if ($redirect) { ?>
               <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
               <?php } ?>
            
            <?php if ($success) { ?>
            <div class="text-success"><i class="fa fa-check-circle"></i>
               <?php echo $success; ?>
            </div>
            <?php } ?>
            <?php if ($error_warning) { ?>
            <div class="text-warning"><i class="fa fa-exclamation-circle"></i>
               <?php echo $error_warning; ?>
            </div>
            <?php } ?>
         </div>
         <button type="submit" class="btn btn-success btn-md">Login</button>
      </form>
      
      <p class="copy">&copy; 2017. Smart<span>Box</span></p>
   </div>
</div>
<!-- END wrapper --> 

<!-- Page Loader --> 
<div class="page-loader">
   <a href="#"><img src="catalog/view/theme/default/assets/images/logo-2.png" class="img-responsive center-block" alt=""/></a>
   <span class="text-uppercase">Loading...</span>
</div>

<!-- SmartBox Js files --> 
<script>
       var resizefunc = [];
</script> 

<script src="catalog/view/theme/default/assets/js/jquery.min.js"></script> 
<script src="catalog/view/theme/default/assets/js/bootstrap.min.js"></script> 
<script src="catalog/view/theme/default/assets/js/pace.min.js"></script> 
<script src="catalog/view/theme/default/assets/js/loader.js"></script> 
<script src="catalog/view/theme/default/assets/js/detect.js"></script> 
<script src="catalog/view/theme/default/assets/js/fastclick.js"></script> 
<script src="catalog/view/theme/default/assets/js/waves.js"></script> 
<script src="catalog/view/theme/default/assets/js/wow.min.js"></script> 
<script src="catalog/view/theme/default/assets/js/jquery.slimscroll.js"></script> 
<script src="catalog/view/theme/default/assets/js/jquery.nicescroll.js"></script> 
<script src="catalog/view/theme/default/assets/js/jquery.scrollTo.min.js"></script> 
<script src="catalog/view/theme/default/assets/pages/jquery.todo.js"></script> 
<script src="catalog/view/theme/default/assets/plugins/moment/moment.js"></script> 
<script src="catalog/view/theme/default/assets/plugins/morris/morris.min.js"></script> 
<script src="catalog/view/theme/default/assets/plugins/raphael/raphael-min.js"></script> 
<script src="catalog/view/theme/default/assets/plugins/jquery-sparkline/jquery.sparkline.min.js"></script> 
<script src="catalog/view/theme/default/assets/pages/jquery.charts-sparkline.js"></script> 
<script type="text/javascript" src="../../../www.gstatic.com/charts/loader.js"></script> 
<script src="catalog/view/theme/default/assets/js/jquery.app.js"></script> 
<script src="catalog/view/theme/default/assets/js/cb-chart.js"></script> 
<script src="catalog/view/javascript/alertifyjs/alertify.js" type="text/javascript"></script>
<link href="catalog/view/theme/default/css/al_css/alertify.css" rel="stylesheet">
</body>
</html>
<!DOCTYPE html>
<html lang="en">
   
<!-- Mirrored from florathemes.com/html/porish/porish-left-menu/light/features/login_v3.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 30 Nov 2016 18:18:36 GMT -->
<head>
      <meta charset="utf-8">
      <meta name="description" content="bootstrap material admin template">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
      <title>Login | Smart financial connections</title>
      <!-- Favicons -->
      <link rel="icon" href="catalog/view/theme/default/img/logo_favi.png">
      <link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,300%7CRaleway:400,300%7CRoboto:400,700,300%7CLato' rel='stylesheet' type='text/css' />
      <!-- Icon CSS -->
      <link rel="stylesheet" href="catalog/view/theme/default/catalog/view/theme/default/assets/css/global/iconstyle.css" />
      <link rel="stylesheet" href="catalog/view/theme/default/catalog/view/theme/default/assets/fonts/material-design/material-design.min.css" />
      <!-- Global plugin CSS -->
      <link rel="stylesheet" href="catalog/view/theme/default/catalog/view/theme/default/assets/css/global/bootstrap.min.css" />
      <link rel="stylesheet" href="catalog/view/theme/default/catalog/view/theme/default/assets/css/switchery/switchery.min.css" />
      <link rel="stylesheet" href="catalog/view/theme/default/catalog/view/theme/default/assets/css/global/waves.min.css" />
      <!--  Global Template CSS -->
      <link rel="stylesheet" href="catalog/view/theme/default/catalog/view/theme/default/assets/css/global/style.css" />
                <link id="site-color" rel="stylesheet" href="catalog/view/theme/default/catalog/view/theme/default/assets/css/colors/cyan.css" />
      <link rel="stylesheet" href="catalog/view/theme/default/catalog/view/theme/default/assets/css/global/site.min.css" />
      <!-- Page CSS -->
      <link href="catalog/view/theme/default/catalog/view/theme/default/assets/css/login-page/form.css" rel="stylesheet" type="text/css" />
      <link rel="stylesheet" href="catalog/view/theme/default/catalog/view/theme/default/assets/css/validation/validation.css" type="text/css" />
      <script src="catalog/view/javascript/alertifyjs/alertify.js" type="text/javascript"></script>
      <link href="catalog/view/theme/default/css/al_css/alertify.css" rel="stylesheet">
         <!-- Start Alexa Certify Javascript -->
      
      
   </head>
   <body class="login-form login-form-3">
      <div class="main-login-form">
         <div class="content-login">
            <div class="logo-title logo-login2">
               <!-- Template Logo -->
               <span><img style="width: 250px;" alt="logo" src="catalog/view/theme/default/img/logo.png"></span>
            </div>
            <div class="login-page login-second-page">
               <!-- Start Login Form -->
               
               <form action="login.html" method="post" class="form-login">
                   <div class="input-box input-box-login2">
                     <div class="left-icon-login btn-info"><i class="icon icon_profile"></i></div>
                     <div class="textbox-login">
                        <input  autocomplete="off" type="text" name="email" value="<?php echo $email; ?>" placeholder="Username" id="input-email" class="form-control" />
                     </div>
                  </div>
                  <div class="input-box input-box-login2">
                     <div class="left-icon-login btn-info"><i class="icon icon_lock"></i></div>
                     <div class="textbox-login">
                        <input autocomplete="off" type="password" name="password" value="<?php echo $password; ?>" placeholder="Password" id="input-password" class="form-control" />
                     </div>
                  </div>
                  <?php
                     $ranStr = md5(microtime());
                     $ranStr = hexdec( crc32($ranStr));
                     $ranStr = substr($ranStr, 0, 6);
                     $_SESSION['cap_code'] = $ranStr;
                   ?>
                  <div class="input-box input-box-login2">
                     <div class="left-icon-login btn-info"><i class="icon icon_key"></i></div>
                     <div class="textbox-login">
                        
                        <input style="width: 56%; margin-left: px; float: left" autocomplete="off" type="text" name="capcha" placeholder="Capcha" id="input-password" value="" class="form-control" />
                        <img class="img_capcha" style="float: right; height: 40px;" src="captcha_code.php"/>
                     </div>
                  </div>
                  <div class="bottom-login">
                     <div class="remember-text-login remember-register-3">
                        <span class="checkbox-custom checkbox-primary">
                        <input id="requiredCheckbox" class="all-selectable" type="checkbox">
                        <label for="requiredCheckbox">Remember me</label>
                        </span>
                     </div>
                     <div class="remember-text-login forget-password-login remember-register-3"><a href="forgot.html"  class="forgot">Forgot Password?</a></div>
                  </div>
                  <div class="form-group">
                     <button class="btn btn-info btn-sign waves-effect waves-dark" type="submit">Sign In</button>
                  </div>
                  <?php if ($redirect) { ?>
                     <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
                     <?php } ?>
                  
                  <?php if ($success) { ?>
                  <div class="text-success"><i class="fa fa-check-circle"></i>
                     <?php echo $success; ?>
                  </div>
                  <?php } ?>
                  <?php if ($error_warning) { ?>
                  <div class="text-warning"><i class="fa fa-exclamation-circle"></i>
                     <?php echo $error_warning; ?>
                  </div>
                  <?php } ?>
               
         </form>
            </div>
         </div>
      </div>
      <!-- Global Plugin JavaScript -->
      
   </body>

<!-- Mirrored from florathemes.com/html/porish/porish-left-menu/light/features/login_v3.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 30 Nov 2016 18:18:36 GMT -->

<script type="text/javascript">
   if (location.hash === '#success') {
      alertify.set('notifier','delay', 100000000000);
      alertify.set('notifier','position', 'top-right');
      alertify.success('Activation successful!');
      //alertify.success('Dear all members. <br/> Our Server is temporary stopped for upgarade, we will resume at 03:00 AM EDT <br/>Thank you for your cooperation!');
   }
   jQuery(document).ready(function($) {
      jQuery('.cap_code_new').click(function(){
         jQuery('.img_capcha').attr({'src':'<?php echo HTTPS_SERVER;?>captcha_code.php'});

      });
   });
</script>