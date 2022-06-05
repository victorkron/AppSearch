//
//  AppDetailScreenshotsViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Карим Руабхи on 04.06.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

class AppDetailScreenshotsViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let app: ITunesApp
    private let imageDownloader = ImageDownloader()

    private var images: [UIImage] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    private var collectionView: UICollectionView!
    
    private struct Constants {
        static let reuseIdentifier = "reuseId"
    }
    
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
        
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: view.frame.width, height: 200)
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 200), collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ScreenshotCell.self, forCellWithReuseIdentifier: Constants.reuseIdentifier)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = UIColor.white
        self.view.addSubview(collectionView)
        
        collectionView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        
        fillData()
    }
    
    
    // MARK: - Private functions
    
    func fillData() {
        downloadImages()
    }
    
    private func downloadImages() {
        let urls = self.app.screenshotUrls
        urls.forEach { url in
            self.imageDownloader.getImage(fromUrl: url) { [weak self] (image, _) in
                if let image = image {
                    self?.images.append(image)
                }
            }
        }
    }
}


extension AppDetailScreenshotsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let dequeuedCell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.reuseIdentifier, for: indexPath)
        
        guard let cell = dequeuedCell as? ScreenshotCell else {
            return dequeuedCell
        }
        
        let image = self.images[indexPath.row]
        cell.configure(with: image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let appDetaillViewController = PhotoFullScreenViewController(app: app)
        self.navigationController?.pushViewController(appDetaillViewController, animated: true)
    }
}


