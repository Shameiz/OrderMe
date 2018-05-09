//
//  DataService.swift
//  OrderMe
//
//  Created by Shameiz Rangwala on 2018-05-02.
//  Copyright © 2018 CodeSchool. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage
import SwiftyJSON

class DataService{
    static let instance = DataService()
    var provinceList = [String:Category]()
    var yearList = [String:Category]()
    var sortedProvince = [String]()
    var sortedYear = [String]()
    
    func getOrders(completion: @escaping CompletionHandler){
        Alamofire.request(ORDERS_URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            if response.result.error == nil{
                guard let data = response.data else{return}
                let json = JSON(data)
                if let orders = json["orders"].array{
                for item in orders{
                    if let province = item["shipping_address"]["province"].string{
                        if let year = item["created_at"].string{
                            let formattedYear = String(year.substring(to: year.index(year.endIndex, offsetBy: -21)))
                            
                            let price  = item["total_price_usd"].stringValue
                            let id = item["order_number"].intValue
                            var totalItems = 0;
                            let products = item["line_items"].arrayValue
                            for product in products{
                                if let quant = product["quantity"].int{
                                    totalItems += quant
                                }
                            }
                            let order = Order.init(price: price, id: id, items: totalItems)
                            self.addOrderToLists(order: order, formattedYear: formattedYear, province: province)
                        }
                    }
                }
             }
                self.sortedYear = Array(self.yearList.keys).sorted(by: <)
                self.sortedProvince = Array(self.provinceList.keys).sorted(by: <)
                completion(true)
            }
            else{
                completion(false)
            }
        }
    }
    
    func addOrderToLists(order:Order,formattedYear:String,province:String){
        if((self.yearList[formattedYear]) != nil){
            self.yearList[formattedYear]?.addOrder(order: order)
        }
        else{
            self.yearList[formattedYear] = Category.init(number: 1, order: order)
        }
        if((self.provinceList[province]) != nil){
            self.provinceList[province]?.addOrder(order: order)
        }
        else{
            self.provinceList[province] = Category.init(number: 1, order: order)
        }
    }
}
