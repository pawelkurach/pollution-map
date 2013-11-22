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
