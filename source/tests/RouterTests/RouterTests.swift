//
//  RouterTests.swift
//  skymovies
//
//  Created by Tiago da Silva Amaral on 12/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import skymovies

class RouterTests: QuickSpec {

	override func spec() {

		describe("Test Router") {

			context("Navigation", closure: {

				var router: Router!
				var routerView: RouterViewInterface!
				beforeEach {

					// Run before each test
					routerView = RouterView()
					router = Router(view: routerView)
				}

				afterEach{

					// Run after each test
				}

				// Puts test code here
				it ("Go to MoviesList", closure: {

					router.goTo(destiny: .moviesList, pushForward: nil)
					expect(router.view!.visibleViewController).toEventually(beAnInstanceOf(MoviesListView.self))
				})

				it ("BuildView", closure: {

					let view = router.buildView(Routes.moviesList.file, MoviesListView.identifier, MoviesListView.self)
					expect(view).toEventually(beAnInstanceOf(MoviesListView.self))
				})
			})
		}
	}
}
