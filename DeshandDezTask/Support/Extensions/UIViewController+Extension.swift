//
//  UIViewController+Extension.swift
//  Seller App
//
//  Created by Mohamad Basuony on 06/09/2022.
//

import Foundation
import UIKit
import CoreData

extension UIViewController {

    func setupNav() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        appearance.shadowColor = .white
        appearance.shadowImage = UIImage(named: "shadow")
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance

    }
    
    func addImageToNavBar(name : String){
        let logo = UIImage(named: name)
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
    }
    
    func setNavBarRightItems(item : [UIBarButtonItem]){
        let rightItems = item
        self.navigationItem.rightBarButtonItems = rightItems

    }
    
    func setNavBarLeftItems(item : [UIBarButtonItem]){
        let leftItems = item
        self.navigationItem.leftBarButtonItems = leftItems
    }

    func isIPad() -> Bool {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return true
        } else {
            return false
        }
    }

    func alertError(_ message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

    func alertErrorWithAction(_ message: String , action : UIAlertAction) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alert.addAction(okAction)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

    func alertErrorWithActions(_ message: String , actions : [UIAlertAction]) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(actions.first ?? UIAlertAction())
        alert.addAction(actions.last ?? UIAlertAction())
        present(alert, animated: true, completion: nil)
    }
}

extension UIViewController {
    func openSellerPortal() {
        if let url = URL(string: "https://seller.stg.omniorder.com.au") {
            UIApplication.shared.open(url)
        }
    }

    func openUrl(urlString : String) {
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url)
        }
    }
}

//extension UIViewController : NVActivityIndicatorViewable{
//    func showIndicatorInView() {
//        startAnimating()
//    }
//    
//    func hideIndicatorInView() {
//        stopAnimating()
//    }
//}
