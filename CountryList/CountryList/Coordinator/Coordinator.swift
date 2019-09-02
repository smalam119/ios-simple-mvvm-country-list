//
//  Coordinator.swift
//  CountryList
//
//  Created by Sayed Mahmudul Alam on 9/2/19.
//  Copyright © 2019 smalam119. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
}
