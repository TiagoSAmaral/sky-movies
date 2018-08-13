//
//  Network.swift
//  skymovies
//
//  Created by Tiago da Silva Amaral on 11/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import UIKit
import Alamofire

protocol NetworInterface{

	func request(
		_ address: URL,
		operation: HTTPMethod,
		header: [String: String]?,
		params: [String: String]?,
		completion: @escaping (Data?, Error?) -> Void)
}

class Network: NetworInterface {

	func request(_ address: URL, operation: HTTPMethod, header: [String: String]?, params: [String: String]?, completion: @escaping (Data?, Error?) -> Void) {

		UIApplication.shared.isNetworkActivityIndicatorVisible = true

		Alamofire.request(address, method: operation, parameters: params, encoding: URLEncoding.default, headers: header).responseJSON { (response) in

			completion(response.data, response.error)
			UIApplication.shared.isNetworkActivityIndicatorVisible = false
		}
	}
}
