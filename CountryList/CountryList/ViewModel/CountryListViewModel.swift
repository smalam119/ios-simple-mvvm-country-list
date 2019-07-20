//
//  CountryListViewModel.swift
//  CountryList
//
//  Created by Sayed Mahmudul Alam on 7/8/19.
//  Copyright © 2019 smalam119. All rights reserved.
//

import Foundation
import Alamofire

class CountryListViewModel {
    
    let countryUrlList = "https://restcountries.eu/rest/v2/all"
    var delegate: CountryListDelegate?
    private(set) var countryName = ""
    private(set) var countryCapital = ""
    var countryList: [Country] = [] {
        didSet {
            delegate?.countryListDidFetchedFromServer()
        }
    }
}

extension CountryListViewModel {
    
    func getCountryName(index: Int) -> String {
        guard let countryName = countryList[index].name else {
            return "Country Name Not Available"
        }
        return countryName
    }
    
    func getCountryCapital(index: Int) -> String {
        guard let countryCapital = countryList[index].capital else {
            return "Capital Not Available"
        }
        return "Capital: \(countryCapital)"
    }
    
    func fetchCountryList() {
        ApiManager.fetchCountryListFromServer(onSuccess: { (countryList) in
            self.countryList = countryList
        }) { (error) in
            print(error)
        }
    }
    
    func fetchCountryList(onSuccess: @escaping () -> Void, onFailure: @escaping () -> Void) {
        ApiManager.fetchCountryListFromServer(onSuccess: { (countryList) in
            self.countryList = countryList
            onSuccess()
        }) { (error) in
            onFailure()
            print(error)
        }
    }
    
    func getCountryListCountText() -> String {
        let countryListCount = countryList.count
        return countryListCount > 1 ? "\(countryListCount) items found" : "\(countryListCount) item found"
    }
}
