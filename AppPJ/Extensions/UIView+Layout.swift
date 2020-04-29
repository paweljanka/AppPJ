//
//  UIView+Layout.swift
//  AppPJ
//
//  Created by Pawel Janka on 29/04/2020.
//  Copyright © 2020 Pawel Janka. All rights reserved.
//

import UIKit

extension UIView {

    func addSubview(_ view: UIView, constraints: [NSLayoutConstraint]) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }

    func corner(withRadius radius: CGFloat) {
        layer.cornerRadius = radius
        clipsToBounds = true
    }
}
