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
	      }
	      map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
	    

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
	    var bermudaTriangle;
	    var triangleCoords = [
	                          new google.maps.LatLng("${geo}", -80.190262),
	                          new google.maps.LatLng(18.466465, -66.118292),
	                          new google.maps.LatLng(32.321384, -64.75737),
	                          new google.maps.LatLng(25.774252, -80.190262)
	                        ];
	    bermudaTriangle = new google.maps.Polygon({
	        paths: triangleCoords,
	        strokeColor: '#FF0000',
	        strokeOpacity: 0.8,
	        strokeWeight: 2,
	        fillColor: '#FF0000',
	        fillOpacity: 0.35
	      });

	      bermudaTriangle.setMap(map);
	      
	   // Add a listener for the click event.
	      google.maps.event.addListener(bermudaTriangle, 'click', showArrays);

	      infoWindow = new google.maps.InfoWindow();
	    }
	    
	    /** @this {google.maps.Polygon} */
	    function showArrays(event) {

	      // Since this polygon has only one path, we can call getPath()
	      // to return the MVCArray of LatLngs.
	      var vertices = this.getPath();

	      var contentString = '<b>Bermuda Triangle polygon</b><br>' +
	          'Clicked location: <br>' + event.latLng.lat() + ',' + event.latLng.lng() +
	          '<br>';

	      // Iterate over the vertices.
	      for (var i =0; i < vertices.getLength(); i++) {
	        var xy = vertices.getAt(i);
	        contentString += '<br>' + 'Coordinate ' + i + ':<br>' + xy.lat() + ',' +
	            xy.lng();
	      }

	      // Replace the info window's content and position.
	      infoWindow.setContent(contentString);
	      infoWindow.setPosition(event.latLng);

	      infoWindow.open(map);
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
