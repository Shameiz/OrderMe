//
//  OrderVCExtension.swift
//  OrderMe
//
//  Created by Shameiz Rangwala on 2018-05-08.
//  Copyright © 2018 CodeSchool. All rights reserved.
//

import Foundation
import UIKit

extension OrderVC: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.orderList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = colView.dequeueReusableCell(withReuseIdentifier: "orderCell", for: indexPath) as? OrderCell{
            cell.configureCell(order: orderList[indexPath.row])
            return cell;
        }
        return OrderCell();
    }
}
