//
//  MoviesModelTests.swift
//  skymoviesTests
//
//  Created by Tiago da Silva Amaral on 13/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import Quick
import Nimble
@testable import skymovies

class MoviesModelTests: QuickSpec {

	override func spec() {
		
        describe("Create List of Movie") {

			context("", closure: {

				beforeEach {

                    // Run before each test

                }

                afterEach{

                     // Run after each test
                }

                // Puts test code here
				it("Create List", closure: {

					let data = Stubs.loadFile(with: "MoviesJsonMock", in: MoviesModelTests.self)
					let results = Movie.listMovie(data: data)!

					expect(results.count).to(equal(12))
				})

				it("Nil result", closure: {
					let results = Movie.listMovie(data: nil)
					expect(results).to(beNil())
				})
            })
        }
	}
}
