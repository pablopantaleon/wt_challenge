//
//  UIImageExtensions.swift
//  wt_code_challenge
//
//  Created by Pablo Reyes on 1/11/21.
//

import UIKit
import Kingfisher

extension UIImageView {
    func addImage(from url: String, with placeHolder: UIImage? = nil) {
        guard let urlImage = URL(string: url) else {
            image = placeHolder
            return
        }
        kf.setImage(with: urlImage, placeholder: placeHolder)
    }
}
