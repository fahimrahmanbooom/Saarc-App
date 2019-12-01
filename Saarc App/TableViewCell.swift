//
//  TableViewCell.swift
//  Saarc App
//
//  Created by Fahim Rahman on 29/11/19.
//  Copyright © 2019 Fahim Rahman. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var countryImage: UIImageView!
    
    @IBOutlet weak var countryName: UILabel!
    
    @IBOutlet weak var capitalName: UILabel!
    
    @IBOutlet weak var tempLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(appData: ImageAndNameData) {
        countryImage.image = appData.countryImageArray
        countryName.text = appData.countryNameArray
        capitalName.text = appData.capitalNameArray
    }
}
