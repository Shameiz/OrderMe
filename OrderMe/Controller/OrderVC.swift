//
//  OrderVC.swift
//  OrderMe
//
//  Created by Shameiz Rangwala on 2018-05-08.
//  Copyright © 2018 CodeSchool. All rights reserved.
//

import UIKit

class OrderVC: UIViewController{

    @IBOutlet weak var pageTitle: UILabel!
    @IBOutlet weak var colView: UICollectionView!
    var orderList: [Order]!
    var heading : String!
    
    func initData(orderList:[Order],heading:String){
        self.orderList=orderList;
        self.heading=heading;
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        pageTitle.text=heading;
        colView.delegate = self as UICollectionViewDelegate;
        colView.dataSource = self;
    }


    @IBAction func onBackBtnPressed(_ sender: Any) {
        dismissDetail()
    }
    
}
