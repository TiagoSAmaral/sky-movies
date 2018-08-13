//
//  RouterView.swift
//  skymovies
//
//  Created by Tiago da Silva Amaral on 12/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import UIKit

protocol RouterViewInterface: class{

	var visibleViewController: UIViewController? { get }
	func setViewControllers(_: [UIViewController], animated: Bool)
	func pushViewController(_: UIViewController, animated: Bool)
}

class RouterView: UINavigationController, RouterViewInterface {

	var presenter: RouterInterface!

	override func viewDidLoad() {
		super.viewDidLoad()

		self.setupApperance()
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		self.presenter.goTo(destiny: .moviesList, pushForward: nil)
	}

	func setupApperance() {

		self.navigationBar.isTranslucent = false
		self.navigationBar.titleTextAttributes =  [NSAttributedStringKey.foregroundColor: Colors.viewTitle.value]
		self.navigationBar.barTintColor = Colors.blackDefatult.value
		self.navigationBar.setValue(true, forKey: "hidesShadow")
		self.navigationBar.barStyle = .black
	}
}
