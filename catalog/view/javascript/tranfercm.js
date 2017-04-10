$(function() {
  $('#tranfer_cm_btc input[type=checkbox]').change(function() {
      if ($('#amount_usd').val() == "")
          var total_BTC = 0;
      var valRadio = parseInt($(this).val());
      var valBTC = null;
      var total = 0;
      $('#tranfer_cm_btc input[type=checkbox]').each(function() {
          if (this.checked) {

            total = parseFloat(total) + parseFloat($('#daily').data('value'));
             
          }
      });
    $('#password_transaction_btc').attr("readonly", false);
      $('#amount_usd').val(parseFloat(total));
  });
  // ==================================================
  var delay = (function() {
      var timer = 0;
      return function(callback, ms) {
          clearTimeout(timer);
          timer = setTimeout(callback, ms);
      };
  })();

  function conver_usd_to_btc(amount_usd) {
      delay(function() {
          $.ajax({
              url: $('#amount_btc').data('link'),
              type: "post",
              dateType: "text",
              data: {
                  usd: amount_usd
              },
              success: function(result) {
                  result = $.parseJSON(result);
                  $('#amount_btc_val').val(parseFloat(result.btc));
                  $('#password_transaction_btc').attr("readonly", false);
              }
          });
      }, 500);
  }
function validateChecks() {
    var chks = document.getElementsByName('FromWallet');
    var checkCount = 0;
    for (var i = 0; i < chks.length; i++) {
      if (chks[i].checked) {
        checkCount++;
      }
    }
    if (checkCount < 1) {
      return false;
    }
    return true;
  }

    $('#tranfer_cm_btc').on('submit', function() {
        alertify.confirm('<p class="text-center" style="font-size:25px;color: black;text-transform: ;height: 20px">Are you sure ?</p>', function(e) {
            if (e) {
        
                $('#tranfer_cm_btc').ajaxSubmit({
                    type: 'POST',
                    beforeSubmit: function(arr, $form, options) {                      
                        window.funLazyLoad.start();
                        $('.choose_wallet').hide();
                
                        $('.error_password_transaction_btc').hide();

                        if ($('#amount_usd').val() == "") {
                            $('.error_amount').show();
                            window.funLazyLoad.reset();
                            return false;
                        }
                        if ($('#password_transaction_btc').val() == "") {
                            $('.error_password_transaction_btc').show();
                            window.funLazyLoad.reset();
                            return false;
                        }

                    },
                    success: function(result) {
                      console.log(result);
                        window.funLazyLoad.reset();
                        result = $.parseJSON(result);
                      
                        if (result.password == -1) {
                            window.funLazyLoad.reset();
                            $('.error_password_transaction_deal_btc').show();
                            return false;
                        }
                        if (result.amount == -1) {
                            window.funLazyLoad.reset();
                            var html = '<div class="col-md-12">';
                            html += '<p class="text-center" style="font-size:19px !important;color: black;text-transform: ;height: 20px">You are not enough BTC!</p>';
                            alertify.alert(html, function() {
                                location.reload(true);
                            });
                            return false;

                        }
                         if (result.amount == -1) {
                            window.funLazyLoad.reset();
                            $('.choose_wallet').show().html('The amount withdrawal > 0.005');
                            return false;
                        }
                        if (result.ok == -1) {
                          alert('Please try again!');
                            return false;
                        }
                         if (result.admin_none == -1) {
                            window.funLazyLoad.reset();
                            var html = '<div class="col-md-12">';
                            html += '<p class="text-center" style="font-size:19px !important;color: black;text-transform: ;height: 20px">Please try again!</p>';
                            alertify.alert(html, function() {
                                location.reload(true);
                            });
                            return false;

                        }
                        if (result.ok==1) {
                            var html = '<div class="col-md-12">';
                            html += '<p class="text-center" style="font-size:19px;color: black;text-transform: ;height: 20px">Successful Withdrawal!</p>';
                            alertify.alert(html, function() {
                                location.reload(true);
                            });

                        }
                      
                    }
                });
            } else {
                return false;
            }
        });

        return false;
    });


     $('#tranfer_to_o').on('submit', function() {
        alertify.confirm('<p class="text-center" style="font-size:25px;color: black;text-transform: ;height: 20px">Are you sure transfer C Wallet to O Wallet?</p>', function(e) {
            if (e) {
        
                $('#tranfer_to_o').ajaxSubmit({
                    type: 'POST',
                    beforeSubmit: function(arr, $form, options) {                      
                        window.funLazyLoad.start();
                        $('.error_amount').hide();
                
                        $('.error_password_transaction_btc').hide();

                        if ($('#amount').val() == "") {
                            $('.error_amount').show();
                            window.funLazyLoad.reset();
                            return false;
                        }
                        if ($('#password_transaction_btc').val() == "") {
                            $('.error_password_transaction_btc').show();
                            window.funLazyLoad.reset();
                            return false;
                        }

                    },
                    success: function(result) {
                      console.log(result);
                        window.funLazyLoad.reset();
                        result = $.parseJSON(result);
                      
                        if (result.password == -1) {
                            window.funLazyLoad.reset();
                            $('.error_password_transaction_deal_btc').show();
                            return false;
                        }
                        if (result.amount == -1) {
                            window.funLazyLoad.reset();
                            var html = '<div class="col-md-12">';
                            html += '<p class="text-center" style="font-size:19px !important;color: black;text-transform: ;height: 20px">You are not enough BTC!</p>';
                            alertify.alert(html, function() {
                                location.reload(true);
                            });
                            return false;

                        }
                       
                        if (result.ok == -1) {
                          alert('Please try again!');
                            return false;
                        }
                  
                        if (result.ok==1) {
                            var html = '<div class="col-md-12">';
                            html += '<p class="text-center" style="font-size:19px;color: black;text-transform: ;height: 20px">Successful Transfer to O Wallet!</p>';
                            alertify.alert(html, function() {
                                location.reload(true);
                            });

                        }
                      
                    }
                });
            } else {
                return false;
            }
        });

        return false;
    });

     $('#tranfer_to_m').on('submit', function() {
        alertify.confirm('<p class="text-center" style="font-size:25px;color: black;text-transform: ;height: 20px">Are you sure transfer C Wallet to member O Wallet?</p>', function(e) {
            if (e) {
        
                $('#tranfer_to_m').ajaxSubmit({
                    type: 'POST',
                    beforeSubmit: function(arr, $form, options) {                      
                        window.funLazyLoad.start();
                        $('.error_amount').hide();
                
                        $('.error_password_transaction_btc').hide();
                        if ($('#MemberUserName').val() == "") {
                            $('.error_username').show();
                            window.funLazyLoad.reset();
                            return false;
                        }
                        if ($('#amount').val() == "") {
                            $('.error_amount').show();
                            window.funLazyLoad.reset();
                            return false;
                        }
                        if ($('#password_transaction_btc').val() == "") {
                            $('.error_password_transaction_btc').show();
                            window.funLazyLoad.reset();
                            return false;
                        }

                    },
                    success: function(result) {
                      console.log(result);
                        window.funLazyLoad.reset();
                        result = $.parseJSON(result);
                      
                        if (result.password == -1) {
                            window.funLazyLoad.reset();
                            $('.error_password_transaction_deal_btc').show();
                            return false;
                        }
                        if (result.amount == -1) {
                            window.funLazyLoad.reset();
                            var html = '<div class="col-md-12">';
                            html += '<p class="text-center" style="font-size:19px !important;color: black;text-transform: ;height: 20px">You are not enough BTC!</p>';
                            alertify.alert(html, function() {
                                location.reload(true);
                            });
                            return false;

                        }
                       
                        if (result.ok == -1) {
                          alert('Please try again!');
                            return false;
                        }
                  
                        if (result.ok==1) {
                            var html = '<div class="col-md-12">';
                            html += '<p class="text-center" style="font-size:19px;color: black;text-transform: ;height: 20px">Successful Transfer to O Wallet!</p>';
                            alertify.alert(html, function() {
                                location.reload(true);
                            });

                        }
                      
                    }
                });
            } else {
                return false;
            }
        });

        return false;
    });



   
    

});


String.prototype.reverse = function() {
    return this.split("").reverse().join("");
}

function reformatText(input) {
    var x = input.value;
    x = x.replace(/,/g, ""); // Strip out all commas
    x = x.reverse();
    x = x.replace(/.../g, function(e) {
        return e + ",";
    }); // Insert new commas
    x = x.reverse();
    x = x.replace(/^,/, ""); // Remove leading comma
    input.value = x;
}

function numberWithCommas(x) {
    x = x.toString();
    var pattern = /(-?\d+)(\d{3})/;
    while (pattern.test(x))
        x = x.replace(pattern, "$1,$2");
    return x;
}