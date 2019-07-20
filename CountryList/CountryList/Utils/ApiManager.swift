//
//  ApiManager.swift
//  CountryList
//
//  Created by Sayed Mahmudul Alam on 7/10/19.
//  Copyright © 2019 smalam119. All rights reserved.
//

import Foundation
import Alamofire

struct ApiManager {
    
    static func fetchCountryListFromServer(onSuccess: @escaping ([Country]) -> Void, onFailure: @escaping (Error) -> Void) {
        Alamofire.request("https://restcountries.eu/rest/v2/all").responseJSON { (response) in
            let result = response.result
            switch result {
            case .success:
                guard let countryListJson = response.data else {
                    return
                }
                do {
                    let jsonDecoder = JSONDecoder()
                    let countryList = try jsonDecoder.decode([Country].self, from: countryListJson)
                    onSuccess(countryList)
                } catch let error {
                    onFailure(error)
                }
                break
            case .failure(let error):
                onFailure(error)
            }
        }
    }
}
