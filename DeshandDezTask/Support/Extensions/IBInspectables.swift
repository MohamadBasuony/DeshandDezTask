//
//  Language.swift
//  Asala
//
//  Created by Michele on 10/7/18.
//  Copyright © 2018 Michelle. All rights reserved.
//

import UIKit

extension UIView {

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    @IBInspectable var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }

    @IBInspectable var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }

    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }

    @IBInspectable var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }

    @IBInspectable var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }

    @IBInspectable var defaultShadow: Bool {
        get {
            return false
        }
        set(value) {
            if value {
            }
        }
    }
}

extension UITextField {

    @IBInspectable var placeholderColor: UIColor? {
        get { return nil }
        set {
            self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "",
                                                            attributes: [.foregroundColor: newValue ?? UIColor.white])
        }
    }

    @IBInspectable var translationKey: String {
        get {
            return self.placeholder!
        }
        set {
            self.placeholder = newValue.localized
        }
    }
}

extension UIButton {

    @IBInspectable var translationKey: String {
        get {
            return self.titleLabel?.text ?? ""
        }
        set {
            self.setTitle(newValue.localized, for: .normal)
        }
    }
}

extension UILabel {

    @IBInspectable var translationKey: String {
        get {
            return self.text!
        }
        set {
            self.text = newValue.localized
        }
    }
}

extension UITabBarItem {

    @IBInspectable var translationKey: String {
        get {
            return self.title!
        }
        set {
            self.title = newValue.localized
        }
    }
}

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}

extension UIView {
    
    func edgesToSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview!.topAnchor),
            bottomAnchor.constraint(equalTo: superview!.bottomAnchor),
            leadingAnchor.constraint(equalTo: superview!.leadingAnchor),
            trailingAnchor.constraint(equalTo: superview!.trailingAnchor)
        ])
    }
    
    func edgesToSuperviewSafeLayout() {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.topAnchor),
            bottomAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.bottomAnchor),
            leadingAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.leadingAnchor),
            trailingAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.trailingAnchor)
        ])
    }

    func edgesToSuperviewBoundsWithAutoResizingMask() {
        translatesAutoresizingMaskIntoConstraints = true
        frame = superview!.bounds
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
