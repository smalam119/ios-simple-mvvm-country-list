//
//  CountryListView.swift
//  CountryList
//
//  Created by Sayed Mahmudul Alam on 7/8/19.
//  Copyright © 2019 smalam119. All rights reserved.
//

import Foundation

struct CountryListView {
    
    let name: String?
    let capital: String?
    
    init(name: String, capital: String) {
        self.name = name
        self.capital = capital
    }
}
