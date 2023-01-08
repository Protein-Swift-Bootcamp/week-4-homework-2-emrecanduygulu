//
//  DetailView.swift
//  week-4-homework-2-emrecanduygulu
//
//  Created by emre can duygulu on 5.01.2023.
//

import UIKit
import WebKit

class DetailView: UIView {
    
    lazy var activityIndicator = UIActivityIndicatorView(style: .large)
    
    lazy var albumLabel = makeLabel(font: .boldSystemFont(ofSize: 18))
    lazy var artistLabel = makeLabel(font: .systemFont(ofSize: 16))
    
    private lazy var webView = WKWebView()
    
    
    private lazy var detailStack: UIStackView = {
        let VStackView = UIStackView(arrangedSubviews: [
            labelStack,
            webView
        ])
        VStackView.axis = .vertical
        VStackView.alignment = .fill
        VStackView.distribution = .fill
        VStackView.translatesAutoresizingMaskIntoConstraints = false
        return VStackView
    }()
    
    private lazy var labelStack: UIStackView = {
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
    
    init() {
        super.init(frame: .zero)
        
        detailStack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(detailStack)
        NSLayoutConstraint.activate([
            detailStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            detailStack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            detailStack.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            detailStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 10),
            webView.leadingAnchor.constraint(equalTo: detailStack.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: detailStack.trailingAnchor),
            webView.topAnchor.constraint(equalTo: labelStack.bottomAnchor, constant: 10),
            
            
        ])
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
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

extension DetailView {
    func populate(with album: Album?) {
        guard let album = album else {
            return
        }
        albumLabel.text = "Album: \(album.collectionName)"
        artistLabel.text = "Artist: \(album.artistName)"
        let requestObj = URLRequest(url: album.collectionViewURL)
        webView.load(requestObj)
    }
}
