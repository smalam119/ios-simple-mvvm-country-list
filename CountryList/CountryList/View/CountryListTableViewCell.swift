//
//  CountryListTableViewCellXib.swift
//  CountryList
//
//  Created by Sayed Mahmudul Alam on 8/12/19.
//  Copyright © 2019 smalam119. All rights reserved.
//

import UIKit

class CountryListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var countryCapitalLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func prepareView(countryName: String, countryCapital: String) {
        countryNameLabel.text = countryName
        countryCapitalLabel.text = countryCapital
    }

}
