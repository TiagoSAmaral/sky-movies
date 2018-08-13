//
//  ViewController.swift
//  skymovies
//
//  Created by Tiago da Silva Amaral on 11/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import UIKit

protocol MoviesListViewInterface: class {

	func showAlert(with title: String, and message: String, completion: (() -> Void)?)
	func setTitleView(with text: String)
	func reloadView()

}

class MoviesListView: UICollectionViewController, MoviesListViewInterface {

	var presenter: MoviesListInterface!
	var refreshControl: UIRefreshControl!

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.

		self.setApperance(with: Colors.blackDefatult.value)
		self.registerCell()
		self.setupPullToRefresh()
	}

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		self.layoutGridView()
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		self.showLoadingBlockScreen(completion: nil)
		self.presenter!.willShowView()
	}

	@objc func refreshList() {
		self.refreshControl.beginRefreshing()
		self.presenter!.willShowView()
	}

	func setupPullToRefresh () {
		self.refreshControl = UIRefreshControl()
		self.refreshControl!.addTarget(self, action: #selector(self.refreshList), for: .valueChanged)
		self.collectionView!.addSubview(self.refreshControl)
	}

	func layoutGridView() {
		let flow = self.collectionView!.collectionViewLayout as! UICollectionViewFlowLayout
		self.presenter!.setupGridView(flow: flow, orientation: UIDevice.current.orientation)
	}

	func registerCell() {
		self.collectionView!.register(UINib(nibName: MoviesListCell.identifier, bundle: nil), forCellWithReuseIdentifier: MoviesListCell.identifier)
	}

	func setApperance(with color: UIColor) {
		self.collectionView!.backgroundColor = color
	}

	func setTitleView(with text: String) {
		self.navigationItem.title = text
	}

	func reloadView() {
		self.collectionView?.reloadData()
		self.refreshControl.endRefreshing()
		self.hideLoadingBlockScreen(finish: nil)
	}

	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return self.showMessageTableEmpty(text: "Não há filmes para exibir", amount: self.presenter!.listSize, collectionView: self.collectionView!)
	}

	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		return self.presenter!.buildCell(at: indexPath, inTo: collectionView)
	}
}
