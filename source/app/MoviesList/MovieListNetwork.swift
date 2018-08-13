//
//  MovieListNetwork.swift
//  skymovies
//
//  Created by Tiago da Silva Amaral on 11/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import Foundation

protocol MoviesNetworkInterface{

	func getMovies(completion: @escaping ([Movie]?, Error?) -> Void)
}

class MoviesNetwork: MoviesNetworkInterface {

	fileprivate let network: NetworInterface = Network()
	fileprivate let apiPaths: ApiPaths = ApiPaths()

	func getMovies(completion: @escaping ([Movie]?, Error?) -> Void) {
		self.network.request(self.apiPaths.urlMoviesList, operation: .get, header: nil, params: nil) { (result, error) in
			completion(Movie.listMovie(data: result), error)
		}
	}
}
