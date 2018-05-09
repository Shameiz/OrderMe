//
//  SummaryVCExtension.swift
//  OrderMe
//
//  Created by Shameiz Rangwala on 2018-05-08.
//  Copyright © 2018 CodeSchool. All rights reserved.
//

import Foundation
import UIKit

extension SummaryVC: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if province{
            return DataService.instance.provinceList.count
        }
        else{
            return DataService.instance.yearList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "summaryCell", for: indexPath) as? SummaryCell{
            let summaryList = province ? DataService.instance.provinceList : DataService.instance.yearList
            let sortedKey = province ? DataService.instance.sortedProvince : DataService.instance.sortedYear
            cell.configureCell(category: sortedKey[indexPath.row], count: (summaryList[sortedKey[indexPath.row]]?.number)!)
            return cell;
        }
        return SummaryCell();
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let orderVC = storyboard?.instantiateViewController(withIdentifier: "orderVC") as? OrderVC else {return}
        let summaryList = province ? DataService.instance.provinceList : DataService.instance.yearList
        let sortedKey = province ? DataService.instance.sortedProvince : DataService.instance.sortedYear
        orderVC.initData(orderList: (summaryList[sortedKey[indexPath.row]]?.orderList)!, heading: sortedKey[indexPath.row])
        
        presentDetail(orderVC)
    }

}
