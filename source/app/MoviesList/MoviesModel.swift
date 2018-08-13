//
//  MoviesModel.swift
//  skymovies
//
//  Created by Tiago da Silva Amaral on 11/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import Foundation

struct Movie: Codable{

	let id: String
	let title: String
	let overview: String
	let duration: String
	let release_year: String
	let cover_url: URL
	let backdrops_url: [URL]

	static func listMovie(data: Data?) -> [Movie]? {

		if let validData = data {
			return try? JSONDecoder().decode(Array<Movie>.self, from: validData)
		} else {
			return nil
		}
	}
}
