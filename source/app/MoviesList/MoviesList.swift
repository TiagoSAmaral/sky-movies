//
//  MoviesList.swift
//  skymovies
//
//  Created by Tiago da Silva Amaral on 12/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import UIKit

protocol MoviesListInterface{

	var listSize: Int { get }
	func willShowView()
	func setupGridView(flow: UICollectionViewFlowLayout, orientation: UIDeviceOrientation)

	func buildCell(at indexPath: IndexPath, inTo collection: UICollectionView) -> UICollectionViewCell
}

class MoviesList: MoviesListInterface {

	var listSize: Int = 0
	let network: MoviesNetworkInterface = MoviesNetwork()
	var movies: [Movie] = [Movie]()
	weak var view: MoviesListViewInterface!

	init(view: MoviesListViewInterface) {

		self.view = view
		self.view.setTitleView(with: "Cine Sky")
	}

	func willShowView() {

		self.requestMovies()
	}

	func requestMovies() {
		self.network.getMovies { (movies, error) in
			if error != nil {
				self.showErrorMessage(movies: movies, error: error)
			} else {
				self.loadDataInView(movies: movies!)
			}
		}
	}

	func showErrorMessage(movies: [Movie]?, error: Error?) {
		if error != nil {
			self.view!.showAlert(with: " ", and: "Não foi possível exibir os filmes. Verifique sua conexão e tente novamente.", completion: nil)
		}

		if movies != nil && movies!.isEmpty {
			self.view!.showAlert(with: " ", and: "Não há novos filmes para exibir.", completion: nil)
		}
	}

	func loadDataInView(movies: [Movie]) {
		self.listSize = movies.count
		self.movies = movies
		self.view!.reloadView()
	}

	func setupGridView(flow: UICollectionViewFlowLayout, orientation: UIDeviceOrientation) {
		let itemsInOneLine: Int = (orientation == .portrait ||
			orientation == .portraitUpsideDown ||
			orientation == .faceUp ||
			orientation == .faceDown) ? 2 : 3

		let itemSpacing: CGFloat = 2

		flow.sectionInset = UIEdgeInsets.zero

		let width = UIScreen.main.bounds.size.width - (itemSpacing * CGFloat(itemsInOneLine - 1))
		flow.itemSize = CGSize(width: floor(width / CGFloat(itemsInOneLine)), height: (width / CGFloat(itemsInOneLine)) + 60)
		flow.minimumInteritemSpacing = 2
		flow.minimumLineSpacing = 2
	}

	func buildCell(at indexPath: IndexPath, inTo collection: UICollectionView) -> UICollectionViewCell{

		let cell = collection.dequeueReusableCell(withReuseIdentifier: MoviesListCell.identifier, for: indexPath) as! MoviesListCell
		cell.setCell(with: self.movies[indexPath.row])
		return cell
	}
}
