//
//  MoviesListViewTests.swift
//  skymoviesTests
//
//  Created by Tiago da Silva Amaral on 12/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import Quick
import Nimble
@testable import skymovies

class MoviesListViewTests: QuickSpec {

	let stubs: Stubs = Stubs()

	override func setUp() {
		super.setUp()

		self.stubs.stubGetConnection(file: "MoviesJsonMock", host: "localhost", in: "/Movies")
	}

	override func spec() {

		afterSuite {
			Stubs.clearStubs()
		}
		
        describe("Tests MoviesListView") {

			context("", closure: {

				var moviesListView: MoviesListView!

				beforeEach {

                    // Run before each test
					moviesListView = self.instantiate()["View"] as! MoviesListView

                }

                afterEach{

                     // Run after each test
                }

//				it("Layout Gridview Portrait", closure: {
//
//					moviesListView.registerCell()
//					moviesListView.layoutGridView()
//
//					let flow = moviesListView.collectionView!.collectionViewLayout as! UICollectionViewFlowLayout
//					expect(flow.minimumInteritemSpacing).to(equal(2.0))
//					expect(flow.minimumLineSpacing).to(equal(2.0))
//				})

				it("Set Apperance Color", closure: {

					moviesListView.setApperance(with: UIColor.red)
					expect(moviesListView.collectionView!.backgroundColor).to(equal(UIColor.red))
				})

				it("Check Title", closure: {

					let titleTest: String = "Title Test"
					moviesListView.setTitleView(with: titleTest)
					expect(moviesListView.navigationItem.title).to(equal(titleTest))
				})

				it("Check RefreshControl not nil", closure: {

					moviesListView.setupPullToRefresh()
					expect(moviesListView.refreshControl!).notTo(beNil())
				})

				it("Check UpdateData", closure: {
					moviesListView.refreshList()
					expect(moviesListView.collectionView!.numberOfItems(inSection: 0)).toEventually(equal(12))
				})
            })
        }
	}

	func instantiate() -> [String: Any] {

		let navControllerLocal = RouterView()
		navControllerLocal.presenter = Router(view: navControllerLocal)

		let viewLocal = MoviesListView()
		let repositoriesLocal = MoviesList(view: viewLocal)
		viewLocal.presenter = repositoriesLocal
		viewLocal.collectionView =  UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout() )
		viewLocal.viewDidLoad()

		return ["View": viewLocal, "Navigation": navControllerLocal, "Presenter": repositoriesLocal]
	}
}
