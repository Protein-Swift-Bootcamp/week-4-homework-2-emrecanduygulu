//
//  CellView.swift
//  week-4-homework-2-emrecanduygulu
//
//  Created by emre can duygulu on 3.01.2023.
//

import UIKit

class CellView: UITableViewCell {
    
    static let cellId = "CellViewCellId"
    
    lazy var albumLabel = makeLabel(font: .boldSystemFont(ofSize: 18))
    lazy var artistLabel = makeLabel(font: .systemFont(ofSize: 16))
    
    
    
    
    private lazy var VStack: UIStackView = {
        let VStackView = UIStackView(arrangedSubviews: [
            albumLabel,
            artistLabel
        ])
        VStackView.axis = .vertical
        VStackView.spacing = 5
        VStackView.alignment = .fill
        VStackView.distribution = .fill
        VStackView.translatesAutoresizingMaskIntoConstraints = false
        return VStackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        addSubview(VStack)
        NSLayoutConstraint.activate([
            VStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            VStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            VStack.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            VStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
            
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeLabel(font: UIFont) -> UILabel {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 1
        label.textAlignment = .left
        label.font = font
        return label
    }
}

extension CellView {
    func populate(with album: Album){
        albumLabel.text = album.collectionName
        artistLabel.text = album.artistName
    }
}
