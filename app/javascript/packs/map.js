import 'mapbox-gl/dist/mapbox-gl.css'
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css'

import mapboxgl from 'mapbox-gl/dist/mapbox-gl.js';

import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const mapElement = document.getElementById('map');

if (mapElement) {
  mapboxgl.accessToken = process.env.MAPBOX_API_KEY;
  const map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/led8/cjohdo9053xp32st9nmwo72ah'
  });

  const markers = JSON.parse(mapElement.dataset.markers);

    new mapboxgl.Marker()
      .setLngLat([markers.lng, markers.lat])
      .setPopup(new mapboxgl.Popup({ offset: 25 }) // add popups
      .setHTML(markers.infoWindow.content))
      .addTo(map);

  if (markers) {
    map.setZoom(14);
    map.setCenter([markers.lng, markers.lat]);
  } else {
    const bounds = new mapboxgl.LngLatBounds();
      bounds.extend([markers.lng, markers.lat]);
    map.fitBounds(bounds, { duration: 0, padding: 75 })
  }

  map.addControl(new MapboxGeocoder({
    accessToken: mapboxgl.accessToken
  }));

}
