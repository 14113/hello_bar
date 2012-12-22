(function() {

  if (window.module == null) {
    window.module = function(name, fn) {
      if (!(this[name] != null)) {
        this[name] = {};
      }
      if (!(this[name].module != null)) {
        this[name].module = window.module;
      }
      return fn.apply(this[name], []);
    };
  }

}).call(this);
(function() {
  var $,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  $ = jQuery;

  this.module('Util', function() {
    return this.Announcement = (function() {

      function Announcement(opt) {
        this.opt = opt;
        this.registerLink = __bind(this.registerLink, this);

        if (!this.opt) {
          this.opt = {};
        }
        this.close_link = $(this.opt['close_link']);
        this.link = this.close_link.attr('href');
      }

      Announcement.prototype.registerLink = function() {
        var _this = this;
        return this.close_link.bind("ajax:success", function(data, response, status) {
          $(this).parent().slideUp(280);
          return false;
        }).bind("ajax:error", function(data, xhr) {
          return true;
        });
      };

      return Announcement;

    })();
  });

}).call(this);