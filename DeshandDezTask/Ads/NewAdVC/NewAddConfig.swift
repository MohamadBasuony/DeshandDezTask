//
//  NewAddConfig.swift
//  DeshandDezTask
//
//  Created by Mohamad Basuony on 27/11/2023.
//

import Foundation
protocol NewAddConfigurator {
    func configure(view: NewAdVC)
}

class NewAddConfiguratorImplementation: NewAddConfigurator {
    func configure(view: NewAdVC) {
        let router = NewAddRouterImplementation(view: view)
        let presenter = NewAddPresenterImplementation(router: router)
        view.presenter = presenter
    }
}

