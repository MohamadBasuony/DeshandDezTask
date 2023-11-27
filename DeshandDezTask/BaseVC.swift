//
//  BaseVC.swift
//  DeshandDezTask
//
//  Created by Mohamad Basuony on 26/11/2023.
//

import UIKit

class BaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        addGradientBackground()
        // Do any additional setup after loading the view.
    }
    
    func addGradientBackground(){
        let layer0 = CAGradientLayer()
        layer0.colors = [
        UIColor(red: 0.02, green: 0.031, blue: 0.102, alpha: 1).cgColor,
        UIColor(red: 0.127, green: 0.099, blue: 0.259, alpha: 1).cgColor
        ]
        layer0.locations = [0, 1]
        layer0.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer0.endPoint = CGPoint(x: 0.75, y: 0.5)
        layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0.73, b: 0.57, c: -0.57, d: 0.15, tx: 0.55, ty: 0.35))
        layer0.bounds = view.bounds.insetBy(dx: -0.5*view.bounds.size.width, dy: -0.5*view.bounds.size.height)
        layer0.position = view.center
        view.layer.addSublayer(layer0)
    }
}
