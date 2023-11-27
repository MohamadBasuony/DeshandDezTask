//
//  DashedView.swift
//  DeshandDezTask
//
//  Created by Mohamad Basuony on 27/11/2023.
//

import UIKit

class DashedView: UIView {

    override func layoutSubviews() {
        drawDottedLine()

    }
    func drawDottedLine() {
        let path = UIBezierPath(roundedRect: self.bounds, cornerRadius: 24.0)
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.main.cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.lineDashPattern = [7, 3] // 7 is the length of dash, 3 is length of the gap.
        shapeLayer.fillColor = nil
        shapeLayer.path = path.cgPath
        self.layer.addSublayer(shapeLayer)
    }
}
