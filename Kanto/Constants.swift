//
//  Constants.swift
//  Kanto
//
//  Created by Alexandre LEGENT on 16/11/2017.
//  Copyright © 2017 Alexandre Legent. All rights reserved.
//

import Foundation
import MapKit

let one: MKPointAnnotation = {
	let point = MKPointAnnotation()
	point.title = "42"
	point.subtitle = "I am the subtitle ... yes right here ..."
	point.coordinate = CLLocationCoordinate2DMake(48.89655330000001, 2.318536399999971)
	return point
}()

let two: MKPointAnnotation = {
	let point = MKPointAnnotation()
	point.title = "Apple"
	point.coordinate = CLLocationCoordinate2DMake(37.33182000000001, -122.03118)
	return point
}()

let three: MKPointAnnotation = {
	let point = MKPointAnnotation()
	point.title = "Azay Le Rideau"
	point.coordinate = CLLocationCoordinate2DMake(47.26177, 0.4657399999999825)
	return point
}()

let PLACES: [MKPointAnnotation] = [one, two, three]
let SPAN: CLLocationDegrees = 0.0025
