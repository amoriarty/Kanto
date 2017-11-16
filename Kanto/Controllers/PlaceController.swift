//
//  PlaceController.swift
//  Kanto
//
//  Created by Alexandre LEGENT on 16/11/2017.
//  Copyright © 2017 Alexandre Legent. All rights reserved.
//

import UIKit

class PlaceController: UITableViewController {
	private let cellid = "placesidtoutoulouloute"
	
	override func viewDidLoad() {
		title = "Places"
		super.viewDidLoad()
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellid)
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return PLACES.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath)
		cell.textLabel?.text = PLACES[indexPath.item].title
		return cell
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		guard let controller = tabBarController?.viewControllers?[0] as? MapController else { return }
		controller.selected = indexPath.item
		tabBarController?.selectedIndex = 0
	}
}
