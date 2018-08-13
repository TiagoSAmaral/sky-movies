//
//  MoviesListCellTests.swift
//  skymoviesTests
//
//  Created by Tiago da Silva Amaral on 13/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import Quick
import Nimble
@testable import skymovies

class MoviesListCellTests: QuickSpec {

	override func spec() {
		
        describe("Tests Cell") {

			context("", closure: {

				var moviesListCell: MoviesListCell!

				beforeEach {

                    // Run before each test
					moviesListCell = Bundle.main.loadNibNamed(MoviesListCell.identifier, owner: nil, options: nil)?.first as! MoviesListCell
                }

                afterEach{

                     // Run after each test
                }

                // Puts test code here
				it("Build URL getImage", closure: {

					let originalUrl = URL(string: "http://urltest/123456789.jpg")

					let result = moviesListCell.arrangeUrl(original: originalUrl!)
					expect(result.absoluteString).to(equal("https://image.tmdb.org/t/p/w1280/123456789.jpg"))
				})

				it("Set color text White", closure: {

					moviesListCell.setApperance()
					expect(moviesListCell.title.textColor).to(equal(UIColor.white))
				})

				it("Set cell", closure: {
					let movie = Movie(id: "123",
										title: "Movie Test",
										overview: "MovieTest",
										duration: "000",
										release_year: "000",
										cover_url: URL(string: "http://url.com")!,
										backdrops_url: [URL(string: "http://url.com")!])

					moviesListCell.setCell(with: movie)

					expect(moviesListCell.title.text).to(equal("Movie Test"))
				})
            })
        }
	}
}
