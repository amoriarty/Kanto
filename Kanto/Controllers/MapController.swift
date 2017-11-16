//
//  MapController.swift
//  Kanto
//
//  Created by Alexandre LEGENT on 16/11/2017.
//  Copyright © 2017 Alexandre Legent. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
	let pinId = "pin"
	
	var selected: Int = 0 {
		didSet { set(region: PLACES[selected].coordinate) }
	}
	
	var follow: Bool = false {
		didSet {
			switch follow {
			case true: locationButton.tintColor = UIColor(red: 0, green: 122 / 255, blue: 1, alpha: 1)
			case false: locationButton.tintColor = .lightGray
			}
		}
	}
	
	lazy var mapView: MKMapView = {
		let map = MKMapView()
		map.translatesAutoresizingMaskIntoConstraints = false
		map.delegate = self
		map.showsUserLocation = true
		map.addAnnotations(PLACES)
		return map
	}()
	
	lazy var segmented: UISegmentedControl = {
		let segmented = UISegmentedControl(items: ["Standart", "Satellite", "Hybrid"])
		segmented.translatesAutoresizingMaskIntoConstraints = false
		segmented.backgroundColor = .white
		segmented.layer.cornerRadius = 5
		segmented.addTarget(self, action: #selector(self.switchMap), for: .valueChanged)
		segmented.selectedSegmentIndex = 0
		return segmented
	}()
	
	lazy var locationButton: UIButton = {
		let button = UIButton()
		let image = UIImage(named: "LocationIcon")?.withRenderingMode(.alwaysTemplate)
		button.translatesAutoresizingMaskIntoConstraints = false
		button.addTarget(self, action: #selector(self.locate), for: .touchUpInside)
		button.setImage(image, for: .normal)
		button.tintColor = .lightGray
		return button
	}()
	
	lazy var locationManager: CLLocationManager = {
		let manager = CLLocationManager()
		manager.delegate = self
		manager.requestWhenInUseAuthorization()
		manager.desiredAccuracy = kCLLocationAccuracyBest
		manager.distanceFilter = 10
		manager.startUpdatingLocation()
		return manager
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tabBarItem.title = "Map"
		tabBarItem.image = UIImage(named: "MapIcon")
		
		setupViews()
		setupLayouts()
		setupMap()
	}
	
	private func setupViews() {
		view.addSubview(mapView)
		view.addSubview(segmented)
		view.addSubview(locationButton)
	}
	
	private func setupLayouts() {
		mapView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
		mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
		mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
		segmented.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		segmented.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5).isActive = true
		locationButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
		locationButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
		locationButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5).isActive = true
		locationButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5).isActive = true
	}
}
