$(function() {
    $(".o_mobile_menu_toggle").click(function() {
        $("#header").toggleClass("o_mobile_menu_opened");
        if ($(".o_mobile_menu_toggle i").hasClass("fa-bars")) {
            $(".o_mobile_menu_toggle i").removeClass("fa-bars").addClass("fa-times");
        } else {
            $(".o_mobile_menu_toggle i").removeClass("fa-times").addClass("fa-bars");
        }
    });
    var myNavBar = {
        flagAdd: true,
        elements: [],
        init: function(elements) {
            this.elements = elements;
        },
        add: function() {
            if (this.flagAdd) {
                for (var i = 0; i < this.elements.length; i++) {
                    document.getElementById(this.elements[i]).className += " o_scrolled";
                }
                this.flagAdd = false;
            }
        },
        remove: function() {
            for (var i = 0; i < this.elements.length; i++) {
                document.getElementById(this.elements[i]).className = document.getElementById(this.elements[i]).className.replace(/(?:^|\s)o_scrolled(?!\S)/g, '');
            }
            this.flagAdd = true;
        }
    };
    myNavBar.init(["header"]);

    function offSetManager() {
        var yOffset = 0;
        var currYOffSet = window.pageYOffset;
        if (yOffset < currYOffSet) {
            myNavBar.add();
        } else if (currYOffSet == yOffset) {
            myNavBar.remove();
        }
    }
    window.onscroll = function(e) {
        offSetManager();
    }
    offSetManager();



     autoPlayYouTubeModal();

  //FUNCTION TO GET AND AUTO PLAY YOUTUBE VIDEO FROM DATATAG
  function autoPlayYouTubeModal() {
      var trigger = $("body").find('[data-toggle="modal"]');
      trigger.click(function () {
          var theModal = $(this).data("target"),
              videoSRC = $(this).attr("data-theVideo"),
              videoSRCauto = videoSRC + "?autoplay=1";
          $(theModal + ' iframe').attr('src', videoSRCauto);
          $(theModal + ' button.close').click(function () {
              $(theModal + ' iframe').attr('src', videoSRC);
          });
      });
  } 
});