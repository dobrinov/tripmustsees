/*!
 * Fullscreen image jQuery plugin
 * Author: Deyan Dobrinov
 */

;(function ($, window, document, undefined){

  var pluginName = 'fullscreenImage',
      defaults = {
        selectors: { // BEM
          container: '.fullscreen-image',
          logo:      '.fullscreen-image__logo',
          image:     '.fullscreen-image__image',
          arrow:     '.fullscreen-image__arrow'
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

    self.node  = $(self.options.selectors.container);
    self.logo  = $(self.options.selectors.logo);
    self.image = $(self.options.selectors.image);
    self.arrow = $(self.options.selectors.arrow);

    self.loadImage();

    $(window).resize(function(){
      self.resize();
      self.logo.hide();
    });

    self.resize();

    self.dropLogo();
    self.initScrollGuide();
  };

  FullscreenImage.prototype.initScrollGuide = function(){
    var self = this;

    $(window).scroll(function(){
      self.arrow.animate({opacity: 0}, 600, function(){
        self.arrow.remove();
      });
    });
  };

  FullscreenImage.prototype.loadImage = function(){
    var self = this;

    var image = self.image.attr('data-image'),
        img   = $('<img/>');

    img.bind('load', function() {
      self.image
        .css('background-image', 'url(' + image + ')')
        .animate({ opacity: 0 },   0)
        .animate({ opacity: 1 }, 600);
    });

    img.attr('src', image);
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
        top: - self.logo.height() + 20
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
