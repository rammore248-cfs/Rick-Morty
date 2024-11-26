//
//  Extensions.swift
//  Rick&Morty
//
//  Created by XTSW-MAC-1137-2 on 22/11/24.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            self.addSubview($0)
        })
    }
}
