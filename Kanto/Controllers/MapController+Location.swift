//
//  MapController+Location.swift
//  Kanto
//
//  Created by Alexandre LEGENT on 16/11/2017.
//  Copyright © 2017 Alexandre Legent. All rights reserved.
//

import UIKit
import CoreLocation

extension MapController {
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		guard let coordinate = manager.location?.coordinate else { return }
		guard follow else { return }
		set(region: coordinate)
	}
	
	func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
		print("[CL] ", error)
	}
	
	@objc func locate() {
		guard let coordinate = locationManager.location?.coordinate else { return }
		set(region: coordinate)
		follow = !follow
	}
}
