//
//  AppDetailView.swift
//  iOSArchitecturesDemo
//
//  Created by Evgeny Kireev on 02/06/2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import UIKit

final class AppDetailView: UIView {
    
    // MARK: - Subviews
    
    let imageView = UIImageView()
    let throbber = UIActivityIndicatorView(style: .gray)
    
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
    }
}
