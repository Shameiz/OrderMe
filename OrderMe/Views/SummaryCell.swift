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
 
    func configureCell(category:String,count:Int){
        self.category.text = category;
        self.count.text = String(count);
    }

}
