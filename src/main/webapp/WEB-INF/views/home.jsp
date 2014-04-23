<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Home</title>
		<script type="text/javascript"
	      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCho61w1vNniwCZcBCco1lur-4QyWS22q8&sensor=false">
	    </script>
	    <script type="text/javascript">
	    var geocoder;
	    var map;
	    var infowindow = new google.maps.InfoWindow();
	    var marker;
	    function initialize() {
	      geocoder = new google.maps.Geocoder();
	      var latlng = new google.maps.LatLng(40.730885,-73.997383);
	      var mapOptions = {
	        zoom: 8,
	        center: latlng
	      };
	      
	      map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
	      var triangleCoords = [
            new google.maps.LatLng(25.774252, -80.190262),
            new google.maps.LatLng(25.774252, -81.190262),
            new google.maps.LatLng(26.774252, -81.190262),
            new google.maps.LatLng(26.774252, -80.190262),              
            new google.maps.LatLng(25.774252, -80.190262)
          ];
	      

            // Construct the polygon.
            bermudaTriangle = new google.maps.Polygon({
              paths: triangleCoords,
              strokeColor: '#FF0000',
              //strokeOpacity: 0.8,
              strokeWeight: 0,
              fillColor: '#FF0000',
              fillOpacity: 0.35
            });
            bermudaTriangle.setMap(map);
            var triangleCoords = [
                new google.maps.LatLng(25.774252, -81.190262),
                new google.maps.LatLng(25.774252, -82.190262),
                new google.maps.LatLng(26.774252, -82.190262),
                new google.maps.LatLng(26.774252, -81.190262),              
                new google.maps.LatLng(25.774252, -81.190262)
              ];

              // Construct the polygon.
              bermudaTriangle1 = new google.maps.Polygon({
                paths: triangleCoords,
                //strokeColor: '#FFF000',
                //strokeOpacity: 0.8,
                strokeWeight: 0,
                fillColor: '#FFF000',
                fillOpacity: 0.35
              });

            bermudaTriangle1.setMap(map);
            
            

  	      var triangleCoords2 = [
              new google.maps.LatLng(25.774252, -80.190262),
              new google.maps.LatLng(25.774252, -80.090262),
              new google.maps.LatLng(25.674252, -80.090262),
              new google.maps.LatLng(25.674252, -80.190262),       
              new google.maps.LatLng(25.774252, -80.190262)
            ];
  	      
  	      bermudaTriangle2 = new google.maps.Polygon({
                paths: triangleCoords2,
                strokeColor: '#FFFF00',
                //strokeOpacity: 0.8,
                strokeWeight: 0,
                fillColor: '#FFFF00',
                fillOpacity: 0.35
              });
  	    bermudaTriangle2.setMap(map);
  	  	insertPolygon(25.674252, -80.090262);
	    }
	    
	    function insertPolygon(Lat, Lng) {
	    	var step=0.01;
	    	new google.maps.LatLng(Lat, Lng);
	    	var cords = [
             new google.maps.LatLng(Lat, Lng),
             new google.maps.LatLng(Lat, Lng+step),
             new google.maps.LatLng(Lat-step, Lng+step),
             new google.maps.LatLng(Lat-step, Lng),
             new google.maps.LatLng(Lat, Lng)
           ];
	    	polygon = new google.maps.Polygon({
              paths: cords,
              strokeColor: '#FFF000',
              //strokeOpacity: 0.8,
              strokeWeight: 0,
              fillColor: '#FFF000',
              fillOpacity: 0.35
            });
	    	polygon.setMap(map);
	    	
	    }

	    function codeAddress() {
	    	  var address = document.getElementById('address').value;
	    	  geocoder.geocode( { 'address': address}, function(results, status) {
	    	    if (status == google.maps.GeocoderStatus.OK) {
	    	      map.setCenter(results[0].geometry.location);
	    	      var marker = new google.maps.Marker({
	    	          map: map,
	    	          position: results[0].geometry.location
	    	      });
	    	    } else {
	    	      alert('Geocode was not successful for the following reason: ' + status);
	    	    }
	    	  });
	    	}

	    google.maps.event.addDomListener(window, 'load', initialize);
	    </script>
	    
	    <style type="text/css">
	      #map-canvas { height: 300px; width: 700px; }
	    </style>
	</head>
	<body onload="initialize()">
		<h1>
			T
		</h1>		
		<P>  The time on the server is ${serverTime}. </P>
		 <div id="panel">
      <input id="address" type="textbox" value="Sydney, NSW">
      <input type="button" value="Geocode" onclick="codeAddress()">
    </div>
    <div id="map-canvas"></div>
  </body>
	
	</body>
</html>
