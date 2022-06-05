//
//  AppDetailDescriptionView.swift
//  iOSArchitecturesDemo
//
//  Created by Карим Руабхи on 04.06.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

class AppDetailDescriptionView: UIView {
    
    // MARK: - Subviews
    
    private(set) lazy var descriptionTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 35.0)
        label.numberOfLines = 1
        
        return label
    }()

    private(set) lazy var versionTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.numberOfLines = 1
        
        return label
    }()
    
    private(set) lazy var updateDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.numberOfLines = 1
        
        return label
    }()
    
    lazy var descriptionText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 13.0)
        
        
        return label
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupLayout()
    }
    
    // MARK: - UI
    
    func setupLayout() {
        self.addSubview(descriptionTitle)
        self.addSubview(versionTitle)
        self.addSubview(updateDateLabel)
        self.addSubview(descriptionText)
        
        
        NSLayoutConstraint.activate([
            descriptionTitle.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10.0),
            descriptionTitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15.0),
            descriptionText.heightAnchor.constraint(equalToConstant: 40.0),
            descriptionText.widthAnchor.constraint(equalToConstant: 100.0),
            
            versionTitle.topAnchor.constraint(equalTo: self.descriptionTitle.bottomAnchor, constant: 10.0),
            versionTitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15.0),
            versionTitle.heightAnchor.constraint(equalToConstant: 30.0),
            
            updateDateLabel.topAnchor.constraint(equalTo: self.descriptionTitle.bottomAnchor, constant: 10.0),
            updateDateLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15.0),
            updateDateLabel.heightAnchor.constraint(equalToConstant: 30.0),
            
            descriptionText.topAnchor.constraint(equalTo: self.versionTitle.bottomAnchor, constant: 10.0),
            descriptionText.bottomAnchor.constraint(equalTo: self.versionTitle.bottomAnchor, constant: 100), // зафиксировал констрейнт, без него лейбл показывает только три строки при 13 шрифте
            descriptionText.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10.0),
            descriptionText.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10.0)
        ])
    }
    
}
