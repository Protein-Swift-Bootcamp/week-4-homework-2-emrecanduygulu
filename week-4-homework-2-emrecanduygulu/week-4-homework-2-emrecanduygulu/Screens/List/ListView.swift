//
//  ListView.swift
//  week-4-homework-2-emrecanduygulu
//
//  Created by emre can duygulu on 5.01.2023.
//

import UIKit

class ListView: UIView {
    
    lazy var activityIndicator = UIActivityIndicatorView(style: .large)
    
    lazy var searchBar: UISearchBar = {
        let sBar = UISearchBar()
        sBar.placeholder = "Search an album or a song..."
        sBar.translatesAutoresizingMaskIntoConstraints = false
        return sBar
    }()
    
    lazy var tableView: UITableView = {
        let tView = UITableView(frame: .zero, style: .plain)
        tView.estimatedRowHeight = 100
        tView.register(CellView.self, forCellReuseIdentifier: CellView.cellId)
        tView.tableFooterView = UIView()
        tView.translatesAutoresizingMaskIntoConstraints = false
        return tView
    }()
    
    
    init() {
        super.init(frame: .zero)
        
        
        addSubview(searchBar)
        NSLayoutConstraint.activate([
            searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            searchBar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor)
        ])
        
        //        VStack.translatesAutoresizingMaskIntoConstraints = false
        //        addSubview(VStack)
        //        NSLayoutConstraint.activate([
        //            VStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        //            VStack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        //            VStack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        //            VStack.topAnchor.constraint(equalTo: self.topAnchor),
        //            tableView.heightAnchor.constraint(equalToConstant: 500),
        //            tableView.leadingAnchor.constraint(equalTo: VStack.leadingAnchor),
        //            tableView.trailingAnchor.constraint(equalTo: VStack.trailingAnchor)
        //        ])
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
