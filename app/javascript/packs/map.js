import 'mapbox-gl/dist/mapbox-gl.css'
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css'

import mapboxgl from 'mapbox-gl/dist/mapbox-gl.js';

import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

function desk_show() {
  const mapElement = document.getElementById('map');

  if (mapElement) {
    mapboxgl.accessToken = process.env.MAPBOX_API_KEY;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/led8/cjoinwbiw01ay2spc8akmhsrx'
    });

    const markers = JSON.parse(mapElement.dataset.markers);

    if ((markers.lng != null) && (markers.lat != null)) {
    new mapboxgl.Marker()
      .setLngLat([markers.lng, markers.lat])
      .setPopup(new mapboxgl.Popup({ offset: 25 })
      .setHTML(markers.infoWindow.content))
      .addTo(map);
    } else {
      new mapboxgl.Marker()
      .setLngLat([markers.lng, markers.lat])
    }

    if ((markers.lng != null) && (markers.lat != null)) {
      map.setZoom(14);
      map.setCenter([markers.lng, markers.lat]);
    } else {
      map.setZoom(1);
    }

    map.addControl(new MapboxGeocoder({
      accessToken: mapboxgl.accessToken
    }));
  }
}
desk_show();

function desks_index() {
  const mapElement = document.getElementById('map-index');

  if (mapElement) {
    mapboxgl.accessToken = process.env.MAPBOX_API_KEY;
    const map = new mapboxgl.Map({
      container: 'map-index',
      style: 'mapbox://styles/led8/cjoinwbiw01ay2spc8akmhsrx'
    });

    const markers = JSON.parse(mapElement.dataset.markers);

    markers.forEach((marker) => {
      if ((marker.lng != null) && (marker.lat != null)) {
        new mapboxgl.Marker()
          .setLngLat([marker.lng, marker.lat])
          .setPopup(new mapboxgl.Popup({ offset: 25 })
          .setHTML(marker.infoWindow.content))
          .addTo(map);
      } else {
      new mapboxgl.Marker()
      .setLngLat([marker.lng, marker.lat])
      }
    })

    if (markers.length === 0) {
      map.setZoom(1);
    } else if (markers.length === 1) {
      map.setZoom(14);
      map.setCenter([markers[0].lng, markers[0].lat]);
    } else {
      const bounds = new mapboxgl.LngLatBounds();
      markers.forEach((marker) => {
        bounds.extend([marker.lng, marker.lat]);
      });
      map.fitBounds(bounds, { duration: 0, padding: 75 })
    }

    map.addControl(new MapboxGeocoder({
    accessToken: mapboxgl.accessToken
    }));
  }
}
desks_index();
