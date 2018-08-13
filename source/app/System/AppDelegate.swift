//
//  AppDelegate.swift
//  skymovies
//
//  Created by Tiago da Silva Amaral on 11/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.

		self.launchApplication()
		return true
	}

	func launchApplication() {

		let navigatioController = RouterView()
		navigatioController.presenter = Router(view: navigatioController)

		self.window = UIWindow(frame: UIScreen.main.bounds)
		self.window?.rootViewController = navigatioController
		self.window?.makeKeyAndVisible()
	}
}
