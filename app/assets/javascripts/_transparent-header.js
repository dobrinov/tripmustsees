/*!
 * Transparent header jQuery plugin
 * Author: Deyan Dobrinov
 */

;(function ($, window, document, undefined){

  var pluginName = 'transparentHeader',
      defaults = {
        selectors: { // BEM
          container: '.header_transparent',
          marker: '.fullscreen-image__overlay',
          body: '.body'
        }
      };

  function TransparentHeader(element, options){
    var self = this;

    self.element = element;

    self.options = $.extend({}, defaults, options) ;

    self._defaults = defaults;
    self._name = pluginName;

    self.init();
  }

  TransparentHeader.prototype.init = function(){
    var self = this;

    self.node    = $(self.options.selectors.container);
    self.marker  = $(self.options.selectors.marker);
    self.body    = $(self.options.selectors.body);

    self.full_screen_image_height = self.marker.height();
    self.header_height = self.node.outerHeight();

    $(window).on( "resize", function(e){
      self.full_screen_image_height = self.marker.height();
    });

    $(window).on( "scroll", function(e){
      var current_scroll_position = $(this).scrollTop();

      if(current_scroll_position < self.full_screen_image_height - self.header_height){
        self.node.css('top', '0px');
      } else if(
          current_scroll_position >= self.full_screen_image_height - self.header_height &&
          current_scroll_position < self.full_screen_image_height
      ){
        console.log('move header up');
        self.node.addClass('header_transparent');
        self.node.css('top', -(current_scroll_position - (self.full_screen_image_height - self.header_height)))
      } else if(
          current_scroll_position >= self.full_screen_image_height &&
          current_scroll_position < self.full_screen_image_height + self.header_height
      ){
        console.log('move header down');
        self.node.removeClass('header_transparent');
        self.node.css('top', current_scroll_position - (self.full_screen_image_height + self.header_height))
      } else if(
          current_scroll_position >= self.full_screen_image_height + self.header_height
      ){
        self.node.css('top', '0px');
      }
    });
  };

  $.fn[pluginName] = function(options){
    return this.each(function(){
      if (!$.data(this, 'plugin_' + pluginName)) {
        $.data(this, 'plugin_' + pluginName, new TransparentHeader(this, options));
      }
    });
  };
})(jQuery, window, document);


$(document).ready(function(){
  $('.header_transparent').transparentHeader();
});
