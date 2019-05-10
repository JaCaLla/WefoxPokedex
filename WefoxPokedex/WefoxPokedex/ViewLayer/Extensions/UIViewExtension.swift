//
//  UIViewExtension.swift
//  WefoxPokedex
//
//  Created by Javier Calatrava Llaveria on 10/05/2019.
//  Copyright © 2019 Javier Calatrava Llaveria. All rights reserved.
//

import Foundation
import UIKit

extension UIView {

    func dropShadow() {
        self.layer.borderColor = self.backgroundColor?.cgColor
        self.layer.borderWidth = 3.0
        self.layer.shadowColor = UIColor.darkGray.cgColor//self.backgroundColor?.cgColor
        self.layer.shadowRadius = 3.0
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = false
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale =  UIScreen.main.scale//[UIScreen mainScreen].scale;
    }
}
