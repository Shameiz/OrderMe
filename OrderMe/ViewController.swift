//
//  ViewController.swift
//  OrderMe
//
//  Created by Shameiz Rangwala on 2018-05-02.
//  Copyright © 2018 CodeSchool. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var province = true;
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var heading: UILabel!
    @IBAction func streamChanged(_ sender: UISegmentedControl) {
        province = !province;
        reloadPageData()
    }
    
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
            cell.configureCell(category: Array(summaryList)[indexPath.row].key, count: Array(summaryList)[indexPath.row].value)
            return cell;
        }
        return SummaryCell();
    }
    

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
        // Do any additional setup after loading the view, typically from a nib.
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

