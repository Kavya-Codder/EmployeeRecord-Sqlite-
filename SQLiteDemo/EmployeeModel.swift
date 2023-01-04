//
//  EmployeeModel.swift
//  SQLiteDemo
//
//  Created by Sunil Developer on 04/01/23.
//

import Foundation
class Employee {
    var id: Int = 0
    var name: String = ""
    var age: Int = 0
    var mobile: String = ""
    var address: String = ""
    
    init(id: Int, name: String, age: Int, mobile: String, address: String) {
        self.id = id
        self.name = name
        self.age = age
        self.mobile = mobile
        self.address = address
    }
}

