//
//  ListViewController.swift
//  week-4-homework-2-emrecanduygulu
//
//  Created by emre can duygulu on 7.01.2023.
//

import UIKit

class ListViewController: UIViewController, AlbumListViewModelOutput {
    func showData() {
        viewSource.tableView.reloadData()
    }
    func showError(errorMessage: String) {
        print("Error")
    }
    
    func openAlbumDetails(album: Album) {
        let viewController = DetailViewController(with: DetailViewModel(albumId: album.id))
        show(viewController, sender: nil)
    }
    
    func isLoading(_ value: Bool) {
        if value == true {
            viewSource.activityIndicator.startAnimating()
        } else {
            viewSource.activityIndicator.stopAnimating()
        }
    }
    
    
    private lazy var viewSource = ListView()
    
    private let viewModel = AlbumListViewModel()
    
    init() {
        
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = viewSource
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSource.tableView.delegate = self
        viewSource.tableView.dataSource = self
        viewSource.searchBar.delegate = self
        viewModel.output = self
        title = "Search"
    }
    
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CellView = tableView.dequeueReusableCell(withIdentifier: CellView.cellId, for: indexPath) as! CellView
        let album = viewModel.albums[indexPath.row]
        cell.populate(with: album)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        viewModel.albums.count
    }
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.openAlbumDetails(indexPath: indexPath)
    }
}

extension ListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.loadAlbumList(searchTerm: searchText)
    }
}
