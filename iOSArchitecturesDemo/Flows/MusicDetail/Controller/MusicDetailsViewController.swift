//
//  MusicDetailsViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Карим Руабхи on 07.06.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit
import WebKit

class MusicDetailsViewController: UIViewController {
    
//    public let song: ITunesSong
    
    private var detailView: MusicDetailsView {
        return self.view as! MusicDetailsView
    }
    
    private var viewModel: MusicDetailsViewModel
    
    
    init(viewModel: MusicDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = MusicDetailsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebView()
        bindViewModel()
    }
    
    // MARK: - Private Function
    
    private func bindViewModel() {
        viewModel.progress.addObserver(self) { [weak self] (progress, _) in
            self?.detailView.label.text = "\(progress.progressValue)%"
        }
    }
    
    private func loadWebView() {
        guard let url = viewModel.getUrl() else {
            return
        }
        
        self.detailView.webView.load(URLRequest(url: url))
        self.detailView.webView.disableActionWithWebView()
    }
}
