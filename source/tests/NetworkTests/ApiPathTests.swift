//
//  ApiPathTests.swift
//  skymoviesTests
//
//  Created by Tiago da Silva Amaral on 12/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import skymovies

class ApiPathTests: QuickSpec {

	override func spec() {

		describe("Test bulid Url Paths") {

			context("Paths in Debug", closure: {

				var apiPath: ApiPaths!
				beforeEach {

					// Run before each test
					apiPath = ApiPaths()
				}

				afterEach{

					// Run after each test
				}

				// Puts test code here
				it("Get list movies Url", closure: {

					expect(apiPath.urlMoviesList).to(equal(URL(string: "http://localhost:3001/Movies")!))
				})
			})
		}
	}
}
