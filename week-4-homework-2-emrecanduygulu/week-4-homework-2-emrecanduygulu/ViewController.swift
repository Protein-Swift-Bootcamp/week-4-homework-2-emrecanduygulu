//
//  ViewController.swift
//  week-4-homework-2-emrecanduygulu
//
//  Created by emre can duygulu on 2.01.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.fetchAlbums(for: "aacayipsin")
        print(viewModel.albums)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
            print(self!.viewModel.albums)
        }
    }

    let viewModel = AlbumListViewModel()
}

