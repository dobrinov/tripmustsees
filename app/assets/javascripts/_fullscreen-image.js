/*!
 * Map jQuery plugin
 * Author: Deyan Dobrinov
 */

;(function ($, window, document, undefined){

  var pluginName = 'fullscreenImage',
      defaults = {
        selectors: { // BEM
          container: '.fullscreen-image',
          logo: '.fullscreen-image__logo'
        }
      };

  function FullscreenImage(element, options){
    var self = this;

    self.element = element;

    self.options = $.extend({}, defaults, options) ;

    self._defaults = defaults;
    self._name = pluginName;

    self.init();
  }

  FullscreenImage.prototype.init = function(){
    var self = this;

    self.node = $(self.options.selectors.container);
    self.logo = $(self.options.selectors.logo);

    $(window).resize(function(){
      self.resize();
      self.logo.hide();
    });

    self.resize();

    self.dropLogo();
  };

  FullscreenImage.prototype.resize = function(){
    var self = this;
    self.node.height(self.getVisibleHeight());
  };

  FullscreenImage.prototype.dropLogo = function(){
    var self = this;

    self.logo.css('top',  -self.node.height() / 2);
    setTimeout(function(){
      self.logo.animate({
        top: - self.logo.height() + 25
      }, {
        duration: 1200,
        easing: "easeOutBounce"
      });
    }, 1000);
  };

  FullscreenImage.prototype.getVisibleWidth = function(){
    return window.innerWidth||document.documentElement.clientWidth||document.body.clientWidth||0;
  };

  FullscreenImage.prototype.getVisibleHeight = function(){
    return window.innerHeight||document.documentElement.clientHeight||document.body.clientHeight||0;
  };

  $.fn[pluginName] = function(options){
    return this.each(function(){
      if (!$.data(this, 'plugin_' + pluginName)) {
        $.data(this, 'plugin_' + pluginName, new FullscreenImage(this, options));
      }
    });
  };

})(jQuery, window, document);


$(document).ready(function(){
  $('.fullscreen-image').fullscreenImage();
});
