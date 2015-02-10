function loadGoogleMapsScript() {
  var script = document.createElement('script');
  script.type = 'text/javascript';
  script.src = '//maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true&callback=initializeGoogleMap';
  document.body.appendChild(script);
}

function initializeGoogleMap(){
  $(document).ready(function(){
    $('.map').map();
  });
}

window.onload = loadGoogleMapsScript;
