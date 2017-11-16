//
//  MainController.swift
//  Kanto
//
//  Created by Alexandre LEGENT on 16/11/2017.
//  Copyright © 2017 Alexandre Legent. All rights reserved.
//

import UIKit

class MainController: UITabBarController {
	let mapController = MapController()
	
	let placeController: UINavigationController = {
		let root = PlaceController()
		let controller = UINavigationController(rootViewController: root)
		controller.tabBarItem.title = "Places"
		controller.tabBarItem.image = UIImage(named: "PlaceIcon")
		return controller
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		viewControllers = [mapController, placeController]
	}
}

