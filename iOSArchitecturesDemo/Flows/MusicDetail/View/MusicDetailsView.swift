//
//  MusicDetailsView.swift
//  iOSArchitecturesDemo
//
//  Created by Карим Руабхи on 07.06.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit
import WebKit

class MusicDetailsView: UIView {
    
    private(set) lazy var webView: WKWebView! = {
        let webView = WKWebView(frame: .null, configuration: WKWebViewConfiguration())
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    private(set) lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }
    
    // MARK: - UI
    
    private func configureUI() {
        self.backgroundColor = .white
        self.label.text = "0%"
        setWebView()
    }
    
    private func setWebView() {
        self.addSubview(self.webView)
        self.addSubview(self.label)
        
        NSLayoutConstraint.activate([
            self.label.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.label.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.label.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.label.heightAnchor.constraint(equalToConstant: 100),
            
            self.webView.topAnchor.constraint(equalTo: self.label.bottomAnchor),
            self.webView.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.webView.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.webView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    // MARK: - Public Function
    
    func setProgress(_ progress: String) {
        label.text = progress
    }
}
