//
//  UIImage+Cache.swift
//  AppPJ
//
//  Created by Pawel Janka on 29/04/2020.
//  Copyright © 2020 Pawel Janka. All rights reserved.
//

import Foundation
import Kingfisher

extension UIImageView {

    func setImageAndCache(imagePath: String) {
        guard let url = URL(string: imagePath) else {
            return
        }
        self.kf.indicatorType = .activity
        self.kf.setImage(with: url)
    }
}

