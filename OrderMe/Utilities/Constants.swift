//
//  Constants.swift
//  OrderMe
//
//  Created by Shameiz Rangwala on 2018-05-02.
//  Copyright © 2018 CodeSchool. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool ) -> ()

let ORDERS_URL = "https://shopicruit.myshopify.com/admin/orders.json?page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6"

let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]
