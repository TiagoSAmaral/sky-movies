//
//  NSObject+IdentifierTests.swift
//  skymoviesTests
//
//  Created by Tiago da Silva Amaral on 12/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import skymovies

class IdentifiersTests: QuickSpec {

	override func spec() {

		describe("Test Extension Identifiers") {

			context("", closure: {

				// Puts test code here
				it("Detect name of class", closure: {

					expect(NSObject.identifier).to(equal("NSObject"))
				})
			})
		}
	}
}
