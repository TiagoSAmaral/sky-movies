//
//  UIViewController+Loading.swift
//  skymovies
//
//  Created by Tiago da Silva Amaral on 12/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import UIKit

extension UIViewController {

	func showLoadingBlockScreen(completion: (() -> Void)? ) {

		let alert = UIAlertController(title: nil, message: "Aguarde ...", preferredStyle: .alert)
		let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
		loadingIndicator.hidesWhenStopped = true
		loadingIndicator.activityIndicatorViewStyle = .gray
		loadingIndicator.startAnimating()

		alert.view.addSubview(loadingIndicator)
		self.present(alert, animated: true, completion: completion)
	}

	func hideLoadingBlockScreen(finish: (() -> Void)?) {

		self.dismiss(animated: true, completion: finish)
	}

	func showAlert(with title: String, and message: String, completion: (() -> Void)?) {

		self.dismiss(animated: true, completion: {
			let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
			alert.addAction(UIAlertAction(title: "Fechar", style: .cancel, handler: nil))
			self.present(alert, animated: true, completion: completion)
		})
	}
}
