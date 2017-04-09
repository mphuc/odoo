</div>
<footer class="footer text-right" style="margin-top: 20px;"> © 2017. All rights reserved. </footer>
<!-- <div class="page-loader">
	<a href="#"><img src="catalog/view/theme/default/assets/images/logo-2.png" class="img-responsive center-block" alt=""/></a>
	<span class="text-uppercase">Loading...</span>
</div> -->

<!-- SmartBox Js files --> 
<script>
       var resizefunc = [];
</script> 

 
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
<script src="catalog/view/theme/default/assets/js/jquery.app.js"></script> 
<script src="catalog/view/theme/default/assets/js/cb-chart.js"></script> 

</body>
</html>
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

   <script type="text/javascript">
   
   	$('.packet-invest').on('submit', function(){
   		var self = $(this);
   		alertify.confirm('<p class="text-center" style="font-size:25px;color: black;text-transform: uppercase;height: 40px">You make sure your choice !</p>',
		  function(){
		    window.funLazyLoad.start();
	   		setTimeout(function(){
				self.ajaxSubmit({
					success : function(result) {
						result = $.parseJSON(result);
						console.log(result);
						
						var package = result.package / 100000000
						
						var xhtml = '<div class="col-md-12">Please send '+package+' BTC to this address.</div><div class="col-md-6"><img style="margin-left:0px" src="https://chart.googleapis.com/chart?chs=225x225&chld=L|0&cht=qr&chl=bitcoin:'+result.input_address+'?amount='+package+'"/><p>'+result.input_address+'</p></div><div class="col-md-6"><p>Your Packet: '+package+' BTC</p>Total: '+ package +' BTC</p></div>'
						alertify.alert(xhtml, function(){
						    window.funLazyLoad.reset();
						    
							    location.reload(true);
							
						    
						  });
						
					}
				});
				check_payment();
			}, 200);
		  },
		  function(){
		});
   		return false;
   	});

   	$('.packet-invoide').on('submit', function(){
   		
   		var self = $(this);
	    window.funLazyLoad.start();
   		setTimeout(function(){
			self.ajaxSubmit({
				success : function(result) {
					result = $.parseJSON(result);
					console.log(result);
					if(_.has(result, 'success') && result['success'] === 1){
						var xhtml = '<div class="col-md-12 text-center"><h3>You have to activate this package! please select another package!</h3></div>'
					}else{
						var amount = result.amount / 100000000;
						
						var package = result.package / 100000000
						var total = package;
						var received = result.received / 100000000;
						var xhtml = '<div class="col-md-12">Please send '+amount+' BTC to this address.</div><div class="col-md-6"><img style="margin-left:-10px" src="https://chart.googleapis.com/chart?chs=225x225&chld=L|0&cht=qr&chl=bitcoin:'+result.input_address+'?amount='+amount+'"/><p>'+result.input_address+'</p></div><div class="col-md-6"><p>Your Packet: '+package+' BTC</p><p>Total: '+ total +' BTC</p><p></p>Paid amount: '+received+' BTC</div>'
					}
					
						alertify.alert(xhtml, function(){
							window.funLazyLoad.reset();
					    	location.reload(true);
					  });
				}
			});
			//check_payment();
		}, 200);
   		return false;
   	});
	 function check_payment(){
	 	$.ajax({
	        url : "<?php echo $check_payment ?>",
	        type : "post",
	        dataType:"text",
	        data : {
	           
	        },
	        success : function (result){
	        	result = $.parseJSON(result);
	            if (result.confirmations == "3"){
	            	$('.ajs-btn.ajs-ok').trigger('click');
	            	var xhtml = '<div style="font-size:25px;color: black;text-transform: uppercase;height: 20px" class="col-md-12 text-center"><h3>You have successfully activate!</h3></div>';
	            	alertify.alert(xhtml, function(){
					    location.reload(true);
					  });
	            }
	            if (result.confirmations == "0")
	            {
	            	setTimeout(function(){ check_payment(); }, 1500);
	            }

	        }
	    });
	 }
   </script>
  
   