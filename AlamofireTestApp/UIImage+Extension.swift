//
//  UIImage+Extension.swift
//  AlamofireTestApp
//
//  Created by Talha Batuhan Irmalı on 16.01.2023.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    func setImage(imageUrl: String) {
        self.kf.setImage(with: URL(string: imageUrl))
    }
}
