//
//  OrderCell.swift
//  OrderMe
//
//  Created by Shameiz Rangwala on 2018-05-08.
//  Copyright © 2018 CodeSchool. All rights reserved.
//

import UIKit

class OrderCell: UICollectionViewCell {
    
    @IBOutlet weak var orderNumber: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var items: UILabel!
    
    func configureCell(order:Order){
        self.orderNumber.text = "Order# \(String(order.id))";
        self.price.text = "$\(order.price) US";
        self.items.text = "Items : \(String(order.items))";
    }
}
