
            
        
    <!DOCTYPE html>
        <html lang="es-ES" data-oe-company-name="Odoo S.A." data-website-id="1">
            

<!--
        ___  ___   ___   ___           
       / _ \|   \ / _ \ / _ \          
      | (_) | |) | (_) | (_) |         
       \___/|___/ \___/ \___/          
   ___ _         _ _                   
  / __| |_  __ _| | |___ _ _  __ _ ___ 
 | (__| ' \/ _` | | / -_| ' \/ _` / -_)
  \___|_||_\__,_|_|_\___|_||_\__, \___|
                             |___/     
                             
  If you're the kind of person who reads source code, you should try our challenge:
  https://www.odoo.com/jobs/challenge
-->

<meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<head>
                <meta charset="utf-8"/>
                <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
                <meta name="viewport" content="width=device-width, initial-scale=1"/>

                <title>Reset Password | Odoo</title>
                <link type="image/x-icon" rel="shortcut icon" href="http://odoocdn.com/web/image/website/1/favicon/"/>

                <script type="text/javascript">
                    var odoo = {
                        csrf_token: "c6d03727bb30bfed2c8d98b08a1279b126b10515o",
                    };
                </script>

                
            <meta name="description"/>
            <meta name="keywords"/>
            
           
        <meta name="generator" content="Odoo"/>
    <meta name="google-site-verification" content="pgjyH0qvN69B0m_HrTKV6h8TVnbRXp5etEHo19unPy4"/>


            <meta property="og:title" content="Sign up login"/>
            <meta property="og:site_name" content="Odoo S.A."/>
            

          
            <script type="text/javascript">
                odoo.session_info = {
                    is_superuser: false,
                    is_system: false,
                    is_frontend: true,
                };
            </script>

            
            <link href="catalog/view/theme/default/template_home/assets/css/web.assets_common.0.css" rel="stylesheet" />

    <link href="catalog/view/theme/default/template_home/assets/css/web.assets_frontend.0.css" rel="stylesheet" />
    <link href="catalog/view/theme/default/template_home/assets/css/web.assets_frontend.1.css" rel="stylesheet" />
    <link href="catalog/view/theme/default/template_home/assets/css/web.assets_frontend.2.css" rel="stylesheet" />



    <script src="catalog/view/theme/default/template_home/assets/js/jquery-min.js"></script>
    <script src="catalog/view/theme/default/template_home/assets/js/bootstrap.min.js"></script>
    <script src="catalog/view/theme/default/template_home/assets/js/script.js"></script>

    <!-- <script  type="text/javascript" src="catalog/view/theme/default/template_home/assets/js/web.assets_common.js"></script> -->

    <!-- <script  type="text/javascript" src="catalog/view/theme/default/template_home/assets/js/web.assets_frontend.js"></script> -->

            
            </head>
            <body>
                

            
        
        <div id="wrapwrap" class="o_sign_up_login">
            <header id="header" class="o_not_editable o_main_header ">
      <div class="o_main_header_main">
        <a class="pull-left o_logo" href="index.html"></a>
        <a href="#" class="o_mobile_menu_toggle visible-xs-block pull-right">
          <i class="fa fa-bars"></i>
        </a>
        <div class="o_header_buttons">

                    <a href="#" class="hidden">
                        <i class="fa fa-shopping-cart"></i>
                        <sup class="my_cart_quantity label label-primary"></sup>
                    </a>

                    <div>
                        <a href="login.html">Sign in</a>
                    </div>
                    <a class="btn btn-primary" href="register?ref=146333582723">Sign up</a>
                </div>
                 <ul class="o_primary_nav">
                     <li>
                        <a href="about.html" style="position: relative; overflow: hidden;">About</a>
                    </li>
                    <li>
                        <a href="tour.html" style="position: relative; overflow: hidden;">Tour</a>
                    </li>
                    <li>
                        <a href="pricing.html" style="position: relative; overflow: hidden;">Pricing</a>
                    </li>
               
                   <li>
                        <a href="contact.html" style="position: relative; overflow: hidden;">Contact</a>
                    </li>
                </ul>
      </div>
      
    
            
        </header>
  <main>
                
            <div class="oe_website_login_container panel shadow">
            <span class="o_logo center-block mb8 mt32"></span>
            <div class="panel-body">
                
     
          
          
          
          <div class="alert alert-info">
            <p>Access and manage your instances from this Odoo account.</p>
          </div>
        <form class="oe_login_form" role="form" method="post" onsubmit="this.action = this.action + location.hash" action="forgot.html">
              
                  <?php if ($error_warning) { ?>
               <div class="text-warning"><i class="fa fa-exclamation-circle"></i>
                  <?php echo $error_warning; ?>
               </div>
               <?php } ?>

                <div class="form-group field-login">
                    <label for="login" class="control-label">Your Username</label>
                    <input type="text" name="email" value="" id="input-email" class="form-control" required="required" autofocus="autofocus" autocapitalize="off"/>
                </div>

                
                     <?php
              $ranStr = md5(microtime());
              $ranStr = hexdec( crc32($ranStr));
              $ranStr = substr($ranStr, 0, 6);
              $_SESSION['cap_code'] = $ranStr;
            ?>
            <div class="form-group field-login">
             <label for="capcha" class="control-label">Captcha</label>
             <br>
              <img class="img_capcha" style="float: right; height: 35px;" src="captcha_code.php"/>
              <input style="width: 75%; margin-left: px; float: left" autocomplete="off" type="text" name="capcha" placeholder="Capcha" id="input-password" value="" class="form-control" />
                </div>  
<div class="clearfix"></div>
                
                <div class="clearfix oe_login_buttons">
                    
           
                <a class="btn btn-link pull-right" href="login.html">Back to login</a>
            <button type="submit" class="btn btn-primary pull-left">
            
            
            
            
            
            Confirm
          </button>
        </div>
            </form>
            </div>
        </div>
    
            </main>
            <footer>
            <div id="footer" class="container o_not_editable">
                <span class="o_logo o_logo_inverse center-block o_footer_logo"></span>
                <div class="row">
                    <div class="col-sm-7 col-md-7 col-lg-6">
                          <div class="row">
                            <div class="col-xs-6 col-sm-4">
                              <span class="menu_title">Community</span>
                              <ul>
                                
                                <li class="divider"></li>
                              
                                <li>
                                  <a href="https://odoo.com/page/odoo-community" target="_blank">Mailing Lists</a>
                                </li>
                                <li>
                                  <a href="https://odoo.com/forum/help-1" target="_blank">Forum</a>
                                </li>
                              </ul>
                            </div>
                            <div class="col-xs-6 col-sm-4">
                              <span class="menu_title">Services</span>
                              <ul>
                                <li>
                                  <a href="https://odoo.com/help" target="_blank">Support</a>
                                </li>
                               
                                <li class="divider"></li>
                                <li>
                                  <a href="https://odoo.com/partners" target="_blank">Find a partner</a>
                                </li>
                                <li>
                                  <a href="https://odoo.com/page/become-a-partner" target="_blank">Become a partner</a>
                                </li>
                                <li class="divider"></li>
                              
                                <li>
                                  <a href="https://odoo.com/page/education-program" target="_blank">Education</a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                  <a href="https://odoo.com/page/security" target="_blank">Security</a>
                                </li>
                              </ul>
                            </div>
                            <div class="col-xs-12 col-sm-4 mb64">
                              <span class="menu_title">About us</span>
                              <ul>
                                <li>
                                  <a href="about.html" >Our company</a>
                                </li>
                                <li>
                                  <a href="contact.html">Contact</a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                  <a href="https://odoo.com/event" target="_blank">Events</a>
                                </li>
                                <li>
                                  <a href="https://odoo.com/blog/" target="_blank">Blog</a>
                                </li>
                                <li>
                                  <a href="https://odoo.com/blog/6" target="_blank">Customers</a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                  <a href="https://odoo.com/jobs" target="_blank">Jobs</a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                  <a href="https://odoo.com/page/legal" target="_blank">Legal Info</a>
                                </li>
                              </ul>
                            </div>
                          </div>
                        </div>
                    <div class="col-sm-5 col-md-4 col-md-offset-1 col-lg-5 col-lg-offset-1">
                        <ul class="o_language_selector">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">





                                    <img alt="" src="catalog/view/theme/default/template_home/assets/images/en_US.png" /> English
                                    <span class="caret"></span>





                                </a>
                                <ul class="dropdown-menu js_language_selector">

                                    <li>
                                        <a class="js_change_lang" href="#" data-lang="zh_CN">
                                            <img alt="" src="catalog/view/theme/default/template_home/assets/images/zh_CN.png" /> 简体中文
                                        </a>
                                    </li>

                                    <li>
                                        <a class="js_change_lang" href="#" data-lang="nl_NL">
                                            <img alt="" src="catalog/view/theme/default/template_home/assets/images/nl_NL.png" /> Nederlands
                                        </a>
                                    </li>



                                    <li>
                                        <a class="js_change_lang" href="#" data-lang="fr_FR">
                                            <img alt="" src="catalog/view/theme/default/template_home/assets/images/fr_FR.png" /> Français
                                        </a>
                                    </li>

                                    <li>
                                        <a class="js_change_lang" href="#" data-lang="de_DE">
                                            <img alt="" src="catalog/view/theme/default/template_home/assets/images/de_DE.png" /> Deutsch
                                        </a>
                                    </li>

                                    <li>
                                        <a class="js_change_lang" href="#" data-lang="es_ES">
                                            <img alt="" src="catalog/view/theme/default/template_home/assets/images/es_ES.png" /> Español
                                        </a>
                                    </li>


                                </ul>
                            </li>
                        </ul>

                        <hr/>
                        <p>
                            <small>Odoo is a suite of open source business apps that cover all your company needs: CRM, eCommerce, accounting, inventory, point of sale, project management, etc.<br/><br/>
                            Odoo's unique value proposition is to be at the same time very easy to use and fully integrated.</small>
                        </p>
                    </div>
                </div>
            </div>

            <div class="o_footer_bottom o_not_editable">
                <div class="container">
                    <a class="small" href="#">Website made with <span class="o_logo o_logo_inverse o_logo_15"></span></a>
                    <div class="social-links pull-right">
                        <a href="https://www.facebook.com/odoo">
                            <i class="fa fa-facebook"></i>
                        </a>
                        <a href="https://twitter.com/Odoo">
                            <i class="fa fa-twitter"></i>
                        </a>
                        <a href="https://www.linkedin.com/company/odoo">
                            <i class="fa fa-linkedin"></i>
                        </a>
                        <a href="mailto:info@odoo.com">
                            <i class="fa fa-envelope"></i>
                        </a>
                    </div>
                </div>
            </div>
        </footer>
        </div>
            
        
              

    
        



</body>

</html>