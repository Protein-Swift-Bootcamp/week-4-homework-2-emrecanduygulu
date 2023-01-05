//
//  CellView.swift
//  week-4-homework-2-emrecanduygulu
//
//  Created by emre can duygulu on 3.01.2023.
//

import UIKit

class CellView: UITableViewCell {
    
    lazy var albumLabel = makeLabel(font: .systemFont(ofSize: 12))
    lazy var artistLabel = makeLabel(font: .systemFont(ofSize: 12))
    let albumImageView = UIImageView()
    
    private lazy var HStack: UIStackView = {
        let HStackView = UIStackView(arrangedSubviews: [
            albumImageView,
            VStack
        ])
        HStackView.axis = .horizontal
        HStackView.spacing = 5
        HStackView.alignment = .fill
        HStackView.distribution = .fill
        return HStackView
    }()
    
    private lazy var VStack: UIStackView = {
        let VStackView = UIStackView(arrangedSubviews: [
            albumLabel,
            artistLabel
        ])
        VStackView.axis = .vertical
        VStackView.spacing = 5
        VStackView.alignment = .fill
        VStackView.distribution = .fill
        return VStackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(HStack)
        NSLayoutConstraint.activate([
            HStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            HStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            HStack.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            HStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
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
        return label
    }
}
