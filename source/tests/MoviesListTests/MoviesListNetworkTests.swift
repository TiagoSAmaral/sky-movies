//
//  skymoviesTests.swift
//  skymoviesTests
//
//  Created by Tiago da Silva Amaral on 11/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import Quick
import Nimble
@testable import skymovies

class MoviesListNetworkTests: QuickSpec {

	let stubs: Stubs = Stubs()

	override func setUp() {
		super.setUp()

		self.stubs.stubGetConnection(file: "MoviesJsonMock", host: "localhost", in: "/Movies")
	}

	override func spec() {

		afterSuite {
			Stubs.clearStubs()
		}

		describe("Integration Network Module MoviesList") {
			
			context("Requests", closure: {

				var moviesListNetwork: MoviesNetworkInterface!

				beforeEach {

					// Run before each test
					moviesListNetwork = MoviesNetwork()
				}

				// Puts test code here
				it("Get List Movies", closure: { waitUntil { done in

					moviesListNetwork.getMovies(completion: { (movies, error) in

						expect(movies!.count).to(beGreaterThan(0))
						expect(movies![0].title).to(equal("Doutor Estranho"))
						done()
					})
				}})
			})
		}
	}
}
