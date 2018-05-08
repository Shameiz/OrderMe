//
//  Category.swift
//  OrderMe
//
//  Created by Shameiz Rangwala on 2018-05-08.
//  Copyright © 2018 CodeSchool. All rights reserved.
//

import Foundation
struct Category {
    private(set) public var number: Int
    private(set) public var orderList: [Order]
    
    init(number: Int, orderList: [Order]) {
        self.number = number
        self.orderList = orderList
    }
}
