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
    var provinceList = [String:Int]()
    var yearList = [String:Int]()
    
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
                            self.yearList[formattedYear] = (self.yearList[formattedYear] ?? 0) + 1;
                            self.provinceList[province] = (self.provinceList[province] ?? 0) + 1;
                            
                        }
                    }
                }
                    print(self.provinceList)
                    print(self.yearList)
                }
                completion(true)
            }
            else{
                completion(false)
            }
        }
    }
}
