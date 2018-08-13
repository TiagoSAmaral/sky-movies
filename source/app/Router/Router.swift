//
//  Router.swift
//  skymovies
//
//  Created by Tiago da Silva Amaral on 12/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import UIKit

protocol RouterInterface {

	func goTo(destiny: Routes, pushForward data: Any?)
}

class Router: RouterInterface {

	weak var view: RouterViewInterface?

	init(view: RouterViewInterface) {

		self.view = view
	}

	func goTo(destiny: Routes, pushForward data: Any?) {

		switch destiny {
		case .moviesList:

			let viewInstance = buildView(destiny.file, MoviesListView.identifier, MoviesListView.self)
			viewInstance.presenter = MoviesList(view: viewInstance)
			self.view?.setViewControllers([viewInstance], animated: false)
		}
	}

	func buildView<T>(_ nameFile: String, _ identifier: String, _ viewClass: T.Type) -> T{

		return UIStoryboard(name: nameFile, bundle: nil).instantiateViewController(withIdentifier: identifier) as! T
	}
}
