//
//  MapController+MapKit.swift
//  Kanto
//
//  Created by Alexandre LEGENT on 16/11/2017.
//  Copyright © 2017 Alexandre Legent. All rights reserved.
//

import UIKit
import MapKit

extension MapController {
	func setupMap() {
		set(region: PLACES[0].coordinate)
		mapView.register(MKPinAnnotationView.self, forAnnotationViewWithReuseIdentifier: pinId)
	}
	
	func set(region coordinate: CLLocationCoordinate2D) {
		let span = MKCoordinateSpan(latitudeDelta: SPAN, longitudeDelta: SPAN)
		let region = MKCoordinateRegion(center: coordinate, span: span)
		mapView.setRegion(region, animated: true)
	}
	
	@objc func switchMap() {
		switch segmented.selectedSegmentIndex {
		case 0: mapView.mapType = .standard
		case 1: mapView.mapType = .satellite
		default: mapView.mapType = .hybrid
		}
	}
	
	func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
		guard let view = mapView.dequeueReusableAnnotationView(withIdentifier: pinId, for: annotation) as? MKPinAnnotationView else { return nil }
		let random = arc4random_uniform(8)
		let colors: [UIColor] = [.blue, .orange, .red, .green, .yellow, .white, .brown, .black]
		view.pinTintColor = colors[Int(random)]
		return view
	}
}
