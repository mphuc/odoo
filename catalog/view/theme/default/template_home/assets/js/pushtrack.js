
odoo.define('odoo.odoo_tracking', function(require) {
    var ajax = require('web.ajax');
    var core = require('web.core');
    var website = require('web_editor.base');

    var OneSignal = window.OneSignal || [];

    website.ready().done(function () {
      OneSignal.push(function() {
        OneSignal.on('notificationPermissionChange', function(permissionChange) {
          var currentPermission = permissionChange.to;
          console.log('New permission state:', currentPermission);
          if (currentPermission == 'granted') {
            ajax.post('/openerp_website/push/info', {}).done(function(o) {
                var info = JSON.parse(o);
                var tags = {};
                if (info.user_id) {
                    OneSignal.syncHashedEmail(info.mail);
                    tags.user_id = info.user_id;
                    tags.user_name = info.user_name;
                    tags.partner_id = info.partner_id;
                }

                tags.geo_city = info.geo_city;
                tags.geo_country_name = info.geo_country_name;
                tags.geo_tz = info.geo_tz;

                tags.lang = info.req_lang;

                OneSignal.sendTags(tags);
            });
          }
        });
      });


      if ($(".openerp_website_pricing_app").length) {
        OneSignal.push(["sendTag", "pagePricing", "1"]);
      }
    });
});
    