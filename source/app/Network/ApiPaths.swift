//
//  ApiPaths.swift
//  skymovies
//
//  Created by Tiago da Silva Amaral on 11/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import Foundation

class ApiPaths {

	fileprivate let enviroment: Environment = Environment()
	fileprivate var urlBase: String!

	init() {

		switch enviroment.current {
		case .debug:
			self.urlBase = "http://localhost:3001"
		case .release:
			self.urlBase = "https://sky-exercise.herokuapp.com/api"
		}
	}

	var urlMoviesList: URL {

		let urlFinal = URL(string: "\(self.urlBase!)/Movies")!
		return urlFinal
	}
}
