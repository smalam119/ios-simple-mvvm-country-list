//
//  ViewController.swift
//  CountryList
//
//  Created by Sayed Mahmudul Alam on 7/7/19.
//  Copyright © 2019 smalam119. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var countryListTableView: UITableView!
    @IBOutlet weak var countLabel: UILabel!
    
    weak var coordinator: MainCoordinator?
    var countryListViewModel: CountryListViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        countryListViewModel = CountryListViewModel()
        countryListViewModel?.delegate = self
        prepareTableview(tableView: countryListTableView)
        countryListViewModel?.fetchCountryList()
    }
    
    func prepareTableview(tableView: UITableView) {
        let nib = UINib.init(nibName: "CountryListTableViewCell", bundle: nil)
        self.countryListTableView.register(nib, forCellReuseIdentifier: "CountryListTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryListTableViewCell", for: indexPath) as! CountryListTableViewCell
        let row = indexPath.row
        guard let countryName = countryListViewModel?.getCountryName(index: row), let countryCapital = countryListViewModel?.getCountryCapital(index: row) else {
            return cell
        }
        cell.prepareView(countryName: countryName, countryCapital: countryCapital)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = countryListViewModel?.countryList.count else {
            return 0
        }
        return count
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.gotoCountryDetail()
    }
}

extension ViewController: CountryListDelegate {
    func countryListDidFetchedFromServer() {
        countryListTableView.reloadData()
        countLabel.text = countryListViewModel?.getCountryListCountText()
    }
}

