import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  connect() {
    mapboxgl.accessToken = 'pk.eyJ1IjoiamRzMTEyIiwiYSI6ImNsZTc5cG45dzAzZHYzb21nMDQ0Z2E1ZG8ifQ.og1gWD3YnEV5VcKoHRmYyw';
    const map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v12',
    center: [-74.5, 40], // starting position [lng, lat]
    zoom: 9,
    });
  }
}
