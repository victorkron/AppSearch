//
//  WKWebView+disable.swift
//  iOSArchitecturesDemo
//
//  Created by Карим Руабхи on 07.06.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import Foundation
import WebKit

extension WKWebView {
    func disableActionWithWebView() {
        let js = "document.querySelector('body').style.pointerEvents = 'none'"
        self.evaluateJavaScript("<script> \(js) </script>")
    }
}
