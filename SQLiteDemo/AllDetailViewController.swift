//
//  AllDetailViewController.swift
//  SQLiteDemo
//
//  Created by Sunil Developer on 04/01/23.
//

import UIKit

class AllDetailViewController: UIViewController {

    var featchDataObj: DBHelper = DBHelper()
    @IBOutlet weak var tableView: UITableView!
    
    var employeeDetail: [Employee] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: AllEmployeeDetailCell.identifier, bundle: nil), forCellReuseIdentifier: AllEmployeeDetailCell.identifier)
        employeeDetail = featchDataObj.featchEmployeeData()
       
    }
    
    
    @IBAction func onClickAddBtn(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        
        employeeDetail = featchDataObj.featchEmployeeData()
        tableView.reloadData()
    }
    
}

// Extension

extension AllDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeDetail.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AllEmployeeDetailCell.identifier, for: indexPath) as! AllEmployeeDetailCell
        let obj = employeeDetail[indexPath.row]
        cell.lblName.text = obj.name
        cell.lblAge.text = "\(obj.age)"
        cell.lblMobile.text = obj.mobile
        cell.lblAddress.text = obj.address
        return cell
    }
    
    
}
