//
//  CountryListTableViewCell.swift
//  CountryList
//
//  Created by Sayed Mahmudul Alam on 7/7/19.
//  Copyright © 2019 smalam119. All rights reserved.
//

import UIKit

class CountryListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var countryTitleLabel: UILabel!
    @IBOutlet weak var countryCapitalLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func prepareView(countryName: String, countryCapital: String) {
        countryTitleLabel.text = countryName
        countryCapitalLabel.text = countryCapital
    }

}
