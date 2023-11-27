//
//  UIImageView+Extnsion.swift
//  SellerApp
//
//  Created by Mohamad Basuony on 28/09/2022.
//

import Foundation
import UIKit
//import SDWebImage
//
//extension UIImageView {
//    func downloadImage(path : String , placeHolder : UIImage = UIImage()) {
//        let url = URL(string: path)
//        self.sd_setImage(with: url, placeholderImage: placeHolder, context: nil)
//    }
//}
//
extension UIImage {
    static func gradientImageWithBounds(bounds: CGRect, colors: [CGColor]) -> UIImage {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
