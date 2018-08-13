//
//  UIViewControllerExtensionsTests.swift
//  skymoviesTests
//
//  Created by Tiago da Silva Amaral on 12/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import Quick
import Nimble
@testable import skymovies

class UIViewControllerExtensionsTests: QuickSpec {

	override func spec() {
		
        describe("Test Extensions") {

			context("", closure: {

				var viewController: UIViewController!

				beforeEach {

                    // Run before each test
					viewController = UIViewController()
                }

                afterEach{

                     // Run after each test
                }

                // Puts test code here
				it("Show Alert Loading", closure: {

					var alert: UIAlertController!

					viewController.showLoadingBlockScreen{
						alert = viewController.presentedViewController as! UIAlertController
						expect(alert.message!).toEventuallyNot(equal("Aguarde ..."))
					}
				})

				it("Hidden Alert Loading", closure: {

					var alert: UIAlertController!

					viewController.showLoadingBlockScreen{
						alert = viewController.presentedViewController as! UIAlertController
						expect(alert.message!).toEventuallyNot(equal("Aguarde ..."))
					}

					viewController.hideLoadingBlockScreen(finish: {
						alert = viewController.presentedViewController as! UIAlertController
						expect(alert).to(beNil())
					})
				})

				it("Show Alert Message", closure: {

					var alert: UIAlertController!
					var alertAction: UIAlertAction!
					viewController.showAlert(with: "Alert", and: "Message", completion: {

						alert = viewController.presentedViewController as! UIAlertController
						alertAction = alert.actions.first! as UIAlertAction
						expect(alertAction.title!).toEventuallyNot(equal("Alert"))
						expect(alert.message!).toEventuallyNot(equal("Message"))
					})
				})

            })
        }
	}
}
