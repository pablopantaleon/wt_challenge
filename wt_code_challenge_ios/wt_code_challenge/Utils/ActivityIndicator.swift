//
//  ActivityIndicator.swift
//  wt_code_challenge
//
//  Created by Pablo Reyes on 1/11/21.
//

import UIKit

protocol SupportsIndicator {
    @discardableResult func showActivityIndicator() -> UIActivityIndicatorView
    func hideActivityIndicator()
}

extension SupportsIndicator where Self: UIViewController {
    
    @discardableResult func showActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView(frame: view.frame)
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicatorView)
        activityIndicatorView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        activityIndicatorView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        activityIndicatorView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        activityIndicatorView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        if #available(iOS 13.0, *) {
            activityIndicatorView.style = .large
        }
        activityIndicatorView.tag = -2000
        activityIndicatorView.backgroundColor = UIColor.white.withAlphaComponent(0.7)
        activityIndicatorView.color = .black
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }
    
    func hideActivityIndicator() {
        if let activityIndicatorView = view.viewWithTag(-2000) {
            activityIndicatorView.removeFromSuperview()
        }
    }
}
