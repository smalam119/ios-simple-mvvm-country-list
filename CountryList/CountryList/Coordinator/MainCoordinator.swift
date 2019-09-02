//
//  MainCoordinator.swift
//  CountryList
//
//  Created by Sayed Mahmudul Alam on 9/2/19.
//  Copyright © 2019 smalam119. All rights reserved.
//

import UIKit


class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func gotoCountryDetail() {
        let vc = CountryDetailViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    
}
