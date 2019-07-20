//
//  CountryListTests.swift
//  CountryListTests
//
//  Created by Sayed Mahmudul Alam on 7/7/19.
//  Copyright © 2019 smalam119. All rights reserved.
//

import XCTest
@testable import CountryList

class CountryListTests: XCTestCase {
    
    var countryListViewModel: CountryListViewModel?

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        countryListViewModel = CountryListViewModel()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_country_list_count_text() {
        self.countryListViewModel!.fetchCountryList(onSuccess: {
            let countryListCountText = self.countryListViewModel?.getCountryListCountText()
            XCTAssertEqual(countryListCountText, "250 items found")
        }) {
            let countryListCountText = self.countryListViewModel?.getCountryListCountText()
            XCTAssertEqual(countryListCountText, "0 item found")
        }
        
    }

}
