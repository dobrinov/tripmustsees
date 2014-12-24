/*!
 * Map jQuery plugin
 * Author: Deyan Dobrinov
 */

;(function ($, window, document, undefined){

  var pluginName = 'map',
      defaults = {
        selectors: { // BEM
          container: '.map',
          canvas: '.map__canvas'
        }
      };

  function Map(element, options) {
    var self = this;

    self.element = element;

    self.options = $.extend({}, defaults, options) ;

    self._defaults = defaults;
    self._name = pluginName;

    self.init();
  }

  Map.prototype.init = function(){
    var self = this;

    self.node = $(self.options.selectors.container);
    self.map = $(self.options.selectors.canvas);

    var map_options = {
                        zoom: parseInt(self.map.attr('data-zoom')),
                        center: {
                          lat: parseInt(self.map.attr('data-lat')),
                          lng: parseInt(self.map.attr('data-lng'))
                        },
                        panControl: false,
                        streetViewControl: false,
                        mapTypeControl: false,
                        zoomControl: true,
                        zoomControlOptions: {
                          style: google.maps.ZoomControlStyle.SMALL,
                          position: google.maps.ControlPosition.LEFT_CENTER
                        },
                      };

    self.map = new google.maps.Map(document.getElementsByClassName(self.options.selectors.canvas.replace('.', ''))[0], map_options);
  };

  $.fn[pluginName] = function(options){
    return this.each(function(){
      if (!$.data(this, 'plugin_' + pluginName)) {
        $.data(this, 'plugin_' + pluginName, new Map(this, options));
      }
    });
  };

})(jQuery, window, document);


$(document).ready(function(){
  $('.map').map();
});
