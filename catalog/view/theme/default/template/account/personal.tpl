<?php echo $header; ?>
<?php echo $column_left; ?>

<div class="content-page">
    <div class="content">
        <div class="page-title-group">
            <h4 class="page-title">Genealogy</h4>
            <h5 class="text-muted page-title-alt"></h5>
        </div>
        <div class="cb-page-content">
            <div class="container">
                <div class="row">
    <div class="col-md-12">
   
      <div class="panel panel-default tab-content">
        <!-- <div class="panel-heading">
          <h3 class="panel-title">Downline Tree</h3>
        </div> -->
        <div id="tab-binary" class="tab-pane panel-body active">
          <div class="row" >
            <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="container-fluid">
                <fieldset>
                  <div class="personal_contain" style="padding:0px;" >
                    <div class="tootbar-top">
                      <ul class="list-unstyled">
                        <li style="margin-bottom:15px;">
                         
                        
                         <!--    -->
                        </li>
                        
                      </ul>
                    </div>
                    <div class="row">
                             <form method="GET" id="frmAccount" class="form-inline" action="<?php echo $self->url->link('account/personal/searchBinary', '', 'SSL'); ?>">
                     <div class="form-group pull-left">
                    <a class="" href="javascript:void(0)" onclick='click_node(
                          <?php echo intval($idCustomer); ?>)'> <span class="btn btn-custom btn-danger btn-md" style="font-weight:700; margin-right: 5px;"><?php echo $lang['top'] ?></span> </a>
                    </div>
                    <div class="form-group pull-left">
                   
                      <input type="text" class="form-control" autocomplete="off" name="account" id="account" placeholder="Username" required ">
                    </div>
                   
                     
                    
                    <button type="submit"  id="btnAccount" class="btn btn-yellow btn-md">Search</button>
                  </form>
                             
                            </div>
                    <div class="clr"></div>
                    <div class="personal-tree" style="text-align: center; min-height:300px">
                      <img src="
                      <?php echo $self -> config -> get('config_ing_loading'); ?>" />
                    </div>
                    
                  </div>
                </fieldset>
              
              </div>
              <div class="detail-icon" style="margin-top: 180px;">
                        <!--   <img src="catalog/view/theme/default/css/icons/packe0.png" width="30px">- New User
                          <img src="catalog/view/theme/default/css/icons/packe1.png" width="30px">- 0.5 BTC
                        
                          <img src="catalog/view/theme/default/css/icons/packe5.png" width="30px">- 20 BTC
                          <img src="catalog/view/theme/default/css/icons/packe6.png" width="30px">- 50 BTC
                          
                         <img src="catalog/view/theme/default/stylesheet/icons/3.png" width="45px"> - Add New User -->
                        </div>
            </div>
          </div>
        </div>
      

                         
        </div>
        </div>

      </div>
    </div>
    <!-- End Row -->
  </div>
</div>

<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/css/tooltipster.bundle.min.css" />
<script type="text/javascript" src="catalog/view/javascript/tooltipster.bundle.min.js"></script>
<script type="text/javascript">
function clearconsole() { 
  console.log(window.console);
  if(window.console || window.console.firebug) {
   console.clear();
  }
}
     $(document).ready(function(){
   
    $('#frmAccount').on('submit', function(envt) {        
          $(this).ajaxSubmit({
              type : 'GET',
              cache: false,
              beforeSubmit :  function(arr, $form, options) { 
                  window.funLazyLoad.start();
                  window.funLazyLoad.show();
           },
              success : function(result){
                  result = $.parseJSON(result);
                  console.log(result);
                  setTimeout(function(){
                    window.click_node(result.id_tree);
                    window.funLazyLoad.reset();
                  },200);
                  clearconsole();

              }
          });
       
      return false;
    });

    
    }); 
    
  </script>
<script type="text/javascript">

  


(function($) {
jQuery.fn.show_tree = function(node) {  

    positon = node.iconCls.split(" ");

    var line_class = positon[1]+'line '+'linefloor'+node.fl;
    var level_active = positon[0]+'iconLevel';

    var node_class = positon[1]+'_node '+'nodefloor'+node.fl;
    var html = '<div class=\''+line_class+'\'></div>';
// onclick=\'click_node('+node.id+')\' value=\''+node.id+'\'
    x_p = "<p>Username: "+node.username+"<p>";
    x_p += "<p>Sponsor: "+node.sponsor+"<p>";
    // x_p += "<p>Email: "+node.email+"<p>";
    // x_p += "<p>Phone: "+node.telephone+"<p>";
    x_p += "<p>Date: "+node.date_added+"<p>";
    x_p += "<p>Total Package: "+node.totalPD+" BTC<p>";
    x_p += "<p>Amount Left: "+node.leftPD+" BTC</p>";
    x_p += "<p>Amount Right: "+node.rightPD+" BTC</p>";
    html += !node.empty 
        ? '<div class=\''+node_class+' '+level_active+'\'><a data-html="true" data-toggle="tooltip" rel="tooltip" data-placement="top" data-title="<p>'+x_p+'</p>" class="binaryTree" style="display:block"   \'><i class="fa fa-user type-'+node.level+'" onclick=\'click_node('+node.id+')\' value=\''+node.id+'\' aria-hidden="true"></i></a><span class="username_node">'+node.username+'</span>' 
        :  '<div class=\''+node_class+'\'><a class="adduser" data-toggle="tooltip" data-placement="top" style="display:block" title=""><span style="font-size: 14px; position: absolute; top: 23px; color: #826400; left: 10px;"></span><i class="fa fa-circle-o type-add"></i></a>';;

    html += '<div id=\''+node.id+'\' ></div>';

    html += '</div>';

    $(this).append(html);

    node.children && $.each( node.children, function( key, value ) {
       $('#'+node.id).show_tree(value);

        $('[data-toggle="popover"]').popover();
    });



};


jQuery.fn.show_infomation = function(node) {  

  $.getJSON(
      "index.php?route=account/personal/getInfoUser&id="+node,
    function(data){
    $(this).find('dd').html('');      

      if(data.id !=0){

        $.each(data, function (k,v){
        $('#ajax_'+k).html(v);

      });     

      }

    }
  );

};

// xay dung cay voi id truyen vo

jQuery.fn.build_tree = function(id, method) {   

    $('.personal-tree').html('<img src="<?php echo $self -> config -> get('config_ing_loading'); ?>"  />');

    $.ajax({

      url: "index.php?route=account/personal/"+method,

      dataType: 'json',

      data: {id_user : id},

      success: function(json_data){

        var rootnode = json_data[0];
         $('.personal-tree').html('');

         $('.personal-tree').show_tree(rootnode);

         $('.personal_contain').show_infomation(rootnode.id);

         $('#current_top').html("Goto "+rootnode.name + "\'s");

      }

    }); 

};

})(jQuery);
  var click_node_add =  function (p_binary, positon){
    var link = '/register.html';
    link += '&token=' + p_binary;
    link += '_'+ positon;
    link += '_'+ '<?php echo $customer_code; ?>';
    location.href = link;
    
  };
   function click_node(id){
    jQuery(document).build_tree(id,'getJsonBinaryTree_Admin');
    $('.tooltip').hide();
    !_.contains(window.arr_lick, id) && window.arr_lick.push(id);
   }
   window.arr_lick = [];
   function click_back(){
      if(window.arr_lick.length === 0){
        click_node(<?php echo intval($idCustomer); ?>);

      }else{
        window.arr_lick = _.initial(window.arr_lick);
        typeof _.last(window.arr_lick) !== 'undefined' ? click_node(_.last(window.arr_lick)) : click_node(<?php echo intval($idCustomer); ?>);
      }
   }

function upto_level(id){

  var top = jQuery('.personal-tree'+id+' > div a').eq(0).attr('value');

  jQuery(document).build_tree(top,'getJsonBinaryTreeUplevel');

}

function goto_bottom_left(id){

  jQuery(document).build_tree(id,'goBottomLeft');

}

function goto_bottom_right(id){

  jQuery(document).build_tree(id,'goBottomRight');

}

function goto_bottom_left_oftop(id){

  var top = jQuery('.personal-tree'+id+' > div a').eq(0).attr('value');

  jQuery(document).build_tree(top,'goBottomLeft');

}

function goto_bottom_right_oftop(id){

  var top = jQuery('.personal-tree'+id+' > div a').eq(0).attr('value');

  jQuery(document).build_tree(top,'goBottomRight');

}

jQuery(document).ready(function($) {
  click_node(<?php echo intval($idCustomer);?>);
  
  function numberWithCommas(x) {
      x = x.toString();
      var pattern = /(-?\d+)(\d{3})/;
      while (pattern.test(x))
          x = x.replace(pattern, "$1,$2");
      return x;
  }
});

</script>
<style>
  .username_node{
     margin-top: -19px;
    /* float: left; */
    position: absolute;
    /* left: -8px; */
    font-size: 11px;
    width: 100px;
    overflow: hidden;
    left: 0;
    color: #1c2b36;
    text-transform: uppercase;
  }
  
</style>
<?php echo $footer; ?>