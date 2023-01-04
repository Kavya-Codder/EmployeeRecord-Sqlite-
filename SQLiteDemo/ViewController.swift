//
//  ViewController.swift
//  SQLiteDemo
//
//  Created by Sunil Developer on 03/01/23.
//

import UIKit
import SQLite3

enum Validation : String {
    case name = "Please enter name"
    case age = "Please enter age"
    case mobile = "Please enter mobile number"
    case address = "Please enter address"
}

class ViewController: UIViewController {
    var dbHelperObj: DBHelper = DBHelper()
    
    @IBOutlet weak var viewContainer: UIView!
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAge: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    
    @IBOutlet weak var btnSave: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetUp()
    }
    
    @IBAction func onClickSaveBtn(_ sender: Any) {
 
        let validation = doValidation()
        if validation.0 {
            dbHelperObj.insertData(employee: Employee(id: Int.random(in: 0..<6), name: txtName.text ?? "", age: Int(txtAge.text ?? "") ?? 0, mobile: txtMobile.text ?? "", address: txtAddress.text ?? ""))
          print(dbHelperObj.featchEmployeeData())

            self.navigationController?.popViewController(animated: true)
        } else {
            showAlert(title: "Error", message: validation.1, hendler: nil)
        }
        
    }
    
    func doValidation() -> (Bool, String) {
        if (txtName.text?.isEmpty ?? false) {
            return(false, Validation.name.rawValue)
        } else if (txtAge.text?.isEmpty ?? false) {
            return(false, Validation.age.rawValue)
        } else if (txtMobile.text?.isEmpty ?? false) {
            return(false, Validation.mobile.rawValue)
        } else if (txtAddress.text?.isEmpty ?? false) {
            return(false, Validation.address.rawValue)
        }
        return(true, "")
    }
    
    func initialSetUp() {
        btnSave.clipsToBounds = true
        btnSave.layer.cornerRadius = 20
        btnSave.layer.borderWidth = 1.0
        btnSave.layer.borderColor = UIColor.white.cgColor
        txtName.clipsToBounds  = true
        txtName.layer.cornerRadius = 5
        txtAge.clipsToBounds  = true
        txtAge.layer.cornerRadius = 5
        txtMobile.clipsToBounds  = true
        txtMobile.layer.cornerRadius = 5
        txtAddress.clipsToBounds  = true
        txtAddress.layer.cornerRadius = 5
    }
}
        
        
   
