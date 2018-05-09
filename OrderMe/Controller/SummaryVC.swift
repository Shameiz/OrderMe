//
//  ViewController.swift
//  OrderMe
//
//  Created by Shameiz Rangwala on 2018-05-02.
//  Copyright © 2018 CodeSchool. All rights reserved.
//

import UIKit

class SummaryVC: UIViewController{
    var province = true;
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var heading: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self;
        tableView.dataSource = self;
        reloadPageData()
        DataService.instance.getOrders { (success) in
            if(success){
                self.tableView.reloadData()
            }
        }
    }
    
    @IBAction func streamChanged(_ sender: UISegmentedControl) {
        province = !province;
        reloadPageData()
    }
    
    func reloadPageData(){
        if province{
            heading.text = "By Province"
        }
        else{
            heading.text = "By Year"
        }
        tableView.reloadData()
    }

}

