<?php $route=$self -> request -> get['route']; ?>
<div class="left side-menu">
        <div class="sidebar-inner slimscrollleft">
            <!--- Divider -->
            <div id="sidebar-menu">
                <ul>
                <?php 
                   date_default_timezone_set('America/Los_Angeles'); // or wherever you are

$time = time();

if ($time >= strtotime("Second Sunday March 0")  && $time < strtotime("First Sunday November 0")) 
{

    $date = date('m/d/y h:i a', $time);

} else {

    $date = date('m/d/y h:i a', $time);

} 
                ?>
                    <li class="menu-title" >Server Time: <br><span style="text-transform: uppercase;"><?php echo $date; ?></span></li>
                    <li class="has_sub">
                        <a href="home.html" class="waves-effect"> <i class="fa fa-dashboard"></i> <span> Dashboard </span> </a>  
                    </li>
                    <li> <a href="investment.html" class="waves-effect"> <i class="fa fa-area-chart"></i>
                     <?php if(count($pd_march) > 0){

                     ?> <span class="label label-danger pull-right">1</span> 
                      <?php } ?> <span> Investment </span> </a> </li>
                      <li> <a href="withdraw" class="waves-effect"> <i class="fa fa-btc"></i>
                     <span> Withdrawal </span> </a> </li>
              
                     <li class="has_sub">
                        <a href="javascript:void(0);" class="waves-effect"> <i class="fa fa-paper-plane"></i> <span> Transfer Money </span> <span class="fa fa-angle-right cb-nav-arrow"></span> </a>
                     <ul class="list-unstyled">
                            <li><a href="transfer-o-wallet">C Wallet</a> </li>
                            <li><a href="transfer-member">O Wallet</a> </li>
                          
                        </ul>
                     </li>
                  
                     <li class="has_sub>">
                        <a href="javascript:void(0);" class="waves-effect"> <i class="fa fa-group"></i> <span> Network </span> <span class="fa fa-angle-right cb-nav-arrow"></span> </a>
                        <ul class="list-unstyled">
                            <li><a href="column-tree.html">Tree Sytem</a> </li>
                            <li><a href="refferal">My Introducer</a> </li>
                            <li><a href="Team-Network-Summary">Team Network Summary</a> </li>
                        </ul>
                    </li>

                 
                    <li class="has_sub">
                        <a href="javascript:void(0);" class="waves-effect"> <i class="fa fa-table"></i> <span> Transaction History </span> <span class="fa fa-angle-right cb-nav-arrow"></span> </a>
                        <ul class="list-unstyled">
                            <li><a href="everyday-profit.html">Daily Profit</a> </li>
                            <li><a href="binary-profit.html">Pairing Bonus</a> </li>
                            <li><a href="refferal-profit.html">Refferal Profit</a> </li>
                        </ul>
                    </li>
                    <li> <a href="your-profile.html" class="waves-effect"> <i class="fa fa-user"></i> <span> Setting</span> </a> </li>
                    <li> <a href="logout.html" class="waves-effect"> <i class="fa fa-outdent"></i> <span> Logout</span> </a> </li>
                </ul>
                <div class="clearfix"></div>
            </div>
            <div class="clearfix"></div>
            
        </div>
    </div>
    <!-- Left Sidebar End --> 
