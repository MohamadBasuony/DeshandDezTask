//
//  UIApplication.swift
//  AJEL
//
//  Created by Michelle Gerges on 7/31/18.
//  Copyright © 2018 Michelle Gerges. All rights reserved.
//

import Foundation
import UIKit
import MapKit

extension UIApplication {
    func openURLWithSafariBrowser(_ urlString: String?) {
        if let urlString = urlString,
            let url = URL(string: urlString) {
            self.open(url, options: [:], completionHandler: nil)
        }
    }

    func callA(number: String?) {
        if let numberItSelf = number,
            let url = URL(string: "tel://\(numberItSelf)") {
            self.open(url, options: [:], completionHandler: nil)
        }
    }

    func sendMail(email: String?) {
        if let emailItSelf = email,
            let url = URL(string: "mailto://\(emailItSelf)") {
            self.open(url, options: [:], completionHandler: nil)
        }
    }

    func openMapsApp(latitude: Double?, longitude: Double?, name: String? = nil) {
        guard let lat = latitude, let long = longitude else { return }
        guard let googleMapsAppSchemaURL = URL(string: "comgooglemaps://"),
            let googleMapsAppURL = URL(string: "comgooglemaps://?center=\(lat),\(long)&q=\(lat),\(long)"),
            let appleMapsAppSchemaURL = URL(string: "http://maps.apple.com"),
            let googleMapsWepsitURL = URL(string: "https://www.google.com/maps/@\(lat),\(long)") else {
                return
        }

        if self.canOpenURL(googleMapsAppSchemaURL) {
            self.open(googleMapsAppURL, options: [:], completionHandler: nil)
            return
        }

        if self.canOpenURL(appleMapsAppSchemaURL) {
            let coordinates = CLLocationCoordinate2DMake(lat, long)
            let placemark = MKPlacemark(coordinate: coordinates)
            let mapItem = MKMapItem(placemark: placemark)
            mapItem.name = name
            mapItem.openInMaps(launchOptions: nil)
            return
        }

        self.open(googleMapsWepsitURL, options: [:], completionHandler: nil)
    }

    func goToAppSettings() {

        if let locationSettingsUrl = URL(string: UIApplication.openSettingsURLString) {
            self.open(locationSettingsUrl, options: [:], completionHandler: nil)
        }
    }
}
