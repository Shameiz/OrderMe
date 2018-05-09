//
//  Order.swift
//  OrderMe
//
//  Created by Shameiz Rangwala on 2018-05-08.
//  Copyright © 2018 CodeSchool. All rights reserved.
//

import Foundation
struct Order {
    private(set) public var price: String
    private(set) public var id: Int
    private(set) public var items: Int
    
    init(price: String, id: Int, items: Int) {
        self.price = price
        self.id = id
        self.items = items
    }
}

