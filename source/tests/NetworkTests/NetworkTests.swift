//
//  NetworkTests.swift
//  skymoviesTests
//
//  Created by Tiago da Silva Amaral on 11/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//
import Quick
import Nimble
@testable import skymovies

class NetworkTests: QuickSpec {

	let stubs: Stubs = Stubs()

	override func setUp() {
		super.setUp()

		self.stubs.stubGetConnection(file: "MoviesJsonMock", host: "localhost", in: "/movies")
	}

	override func spec() {

		afterSuite {
			Stubs.clearStubs()
		}

		describe("Test Network class") {

			context("", closure: {

				var network: NetworInterface!

				beforeEach {

					// Run before each test
					network = Network()
				}

				afterEach{
					// Run after each test
				}

				// Puts test code here
				it("Test Get Method", closure: { waitUntil { done in

					let url = URL(string: "http://localhost/movies")!
					network.request(url, operation: .get, header: nil, params: nil, completion: { (result, error) in

						let resultString = String(data: result!, encoding: String.Encoding.utf8)
						expect(resultString).toNot(equal(""))
						expect(error).to(beNil())
						done()
					})
					
				}})
			})
		}
	}
}
