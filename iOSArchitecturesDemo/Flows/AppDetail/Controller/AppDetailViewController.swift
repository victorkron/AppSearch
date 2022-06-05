//
//  AppDetailViewController.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 20.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

final class AppDetailViewController: UIViewController, UIScrollViewDelegate {
    
    // MARK: - Properties
    
    public var app: ITunesApp
    
    lazy var headerViewController = AppDetailHeaderViewController(app: self.app)
    lazy var descriptionViewController = AppDetailDescriptionViewController(app: self.app)
    lazy var screenshotsViewController = AppDetailScreenshotsViewController(app: self.app)
    
    // MARK: - Construction
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
    }
    
    // MARK: - Private Functions
    
    private func configureUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationItem.largeTitleDisplayMode = .never
        
        addHeaderViewController()
        addDescriptionViewController()
        addScreenshotsViewController()
    }
    
    private func addHeaderViewController() {
        
        addChild(headerViewController)
        view.addSubview(headerViewController.view)
        headerViewController.didMove(toParent: self)
        
        headerViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.headerViewController.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.headerViewController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.headerViewController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
    }
    
    private func addDescriptionViewController() {
        addChild(descriptionViewController)
        view.addSubview(descriptionViewController.view)
        descriptionViewController.didMove(toParent: self)
        
        descriptionViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionViewController.view.topAnchor.constraint(equalTo: self.headerViewController.view.bottomAnchor),
            descriptionViewController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            descriptionViewController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            descriptionViewController.view.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func addScreenshotsViewController() {
        addChild(screenshotsViewController)
        view.addSubview(screenshotsViewController.view)
        screenshotsViewController.didMove(toParent: self)
        
        screenshotsViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            screenshotsViewController.view.topAnchor.constraint(equalTo: self.descriptionViewController.view.bottomAnchor),
            screenshotsViewController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            screenshotsViewController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            screenshotsViewController.view.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
}
