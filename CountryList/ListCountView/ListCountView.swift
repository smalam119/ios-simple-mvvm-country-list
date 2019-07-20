//
//  ListCountView.swift
//  CountryList
//
//  Created by Sayed Mahmudul Alam on 7/12/19.
//  Copyright © 2019 smalam119. All rights reserved.
//

import UIKit

class ListCountView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var countLabel: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit(contentView: contentView, nibName: "ListCountView")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit(contentView: contentView, nibName: "ListCountView")
    }
    
    func commonInit(contentView: UIView, nibName: String) {
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    func setCountLabelText(text: String) {
        countLabel.text = text
    }
}
