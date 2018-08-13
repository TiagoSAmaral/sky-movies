//
//  MoviesListTests.swift
//  skymoviesTests
//
//  Created by Tiago da Silva Amaral on 13/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import Quick
import Nimble
@testable import skymovies

class MoviesListTests: QuickSpec {

	let stubs: Stubs = Stubs()

	override func setUp() {
		super.setUp()

		self.stubs.stubGetConnection(file: "MoviesJsonMock", host: "localhost", in: "/Movies")
	}

	override func spec() {

		afterSuite {
			Stubs.clearStubs()
		}

        describe("Tests MoviesList") {

			context("", closure: {

				var moviesList: MoviesList!
				var view: MoviesListView!
				beforeEach {
                    // Run before each test
					let elements = self.instantiate()
					moviesList = elements["Presenter"] as! MoviesList
					view = elements["View"] as! MoviesListView
                }

                afterEach{
					// Run after each test
                }

                // Puts test code here

				it("request List movies", closure: {

					moviesList.requestMovies()
					expect(moviesList.movies.count).toEventually(equal(12))
				})

				it("Load data to view", closure: {

					let movies = [Movie(id: "123",
										title: "Movie Test",
										overview: "MovieTest",
										duration: "000",
										release_year: "000",
										cover_url: URL(string: "http://url.com")!,
										backdrops_url: [URL(string: "http://url.com")!])]

					moviesList.loadDataInView(movies: movies)
					expect(moviesList.movies.count).to(equal(1))
					expect(moviesList.listSize).to(equal(1))
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
