//
//  TableViewCell.swift
//  OrderMe
//
//  Created by Shameiz Rangwala on 2018-05-02.
//  Copyright © 2018 CodeSchool. All rights reserved.
//

import UIKit

class SummaryCell: UITableViewCell {

    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var count: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(category:String,count:Int){
        self.category.text = category;
        self.count.text = String(count);
    }

}
