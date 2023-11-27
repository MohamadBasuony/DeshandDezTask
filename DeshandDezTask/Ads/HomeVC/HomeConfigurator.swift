//
//  HomeConfigurator.swift
//  DeshandDezTask
//
//  Created by Mohamad Basuony on 26/11/2023.
//

import Foundation

protocol HomeConfigurator {
    func configure(view: HomeVC)
}

class HomeConfiguratorImplementation: HomeConfigurator {
    func configure(view: HomeVC) {
        let service = ApiAdsService()
        let router = HomeRouterImplementation(view: view)
        let presenter = HomePresenterImplementation(service: service, delegate: view, router: router)
        view.presenter = presenter
    }
}

