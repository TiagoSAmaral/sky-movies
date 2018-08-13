//
//  UITableViewControllerExtensionsTests.swift
//  skymoviesTests
//
//  Created by Tiago da Silva Amaral on 12/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import Quick
import Nimble
@testable import skymovies

class UITableViewControllerTests: QuickSpec {

	override func spec() {
		
        describe("Test Extensions") {

			context("", closure: {

				var collectionViewController: UICollectionViewController!

				beforeEach {

                    // Run before each test
					collectionViewController = UICollectionViewController()
					collectionViewController.collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout() )
                }

                afterEach{

                     // Run after each test
                }

                // Puts test code here
				it("Message in empty TableView", closure: {

					let amount = collectionViewController.showMessageTableEmpty(text: "Message", amount: 0, collectionView: collectionViewController.collectionView!)

					let label = collectionViewController.collectionView!.backgroundView as! UILabel

					expect(label.text!).to(equal("Message"))
					expect(amount).to(equal(0))

				})

				it("Not Show Message when TableView not empty", closure: {

					let amount = collectionViewController.showMessageTableEmpty(text: "Message", amount: 1, collectionView: collectionViewController.collectionView!)

					let label = collectionViewController.collectionView!.backgroundView as? UILabel

					expect(label).to(beNil())
					expect(amount).to(equal(1))
				})
            })
        }
	}
}
