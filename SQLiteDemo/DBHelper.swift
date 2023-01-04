//
//  DBHelper.swift
//  SQLiteDemo
//
//  Created by Sunil Developer on 04/01/23.
//

import Foundation
import UIKit
import SQLite3

class DBHelper {
    let dbPath: String = "myDb.sqlite"
    var database: OpaquePointer?
    
    
    init() {
        database = openDatabase()
        createtable()
    }
    
    func openDatabase() -> OpaquePointer? {
        do {
            let fileUrl = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(dbPath)
            var db: OpaquePointer?
            if sqlite3_open(fileUrl.path, &db) == SQLITE_OK {
                return db
            } else {
                print("error while opening the database")
                return nil
            }
        } catch(let error) {
            print(error.localizedDescription)
        }
        
        return nil
    }
    // Employee
    func createtable() {
        let createTableStr = "CREATE TABLE IF NOT EXISTS employee(id INTEGER PRIMARY KEY, name TEXT, age INTEGER, mobile TEXT, address TEXT );"
        var createTableStatement: OpaquePointer?
        if sqlite3_prepare_v2(database, createTableStr, -1, &createTableStatement, nil) == SQLITE_OK {
            if sqlite3_step(createTableStatement) == SQLITE_OK {
                print("table successfully created.")
            } else {
                print("something went wrong.")
            }
        } else {
            print("create table statement could not be prepared.")
        }
        sqlite3_finalize(createTableStatement)
    }
   
    func insertData(employee: Employee) {
        let insertQuary = "INSERT INTO employee(id,name,age,mobile,address) VALUES(?,?,?,?,?);"
        var insertStatement: OpaquePointer?
        if sqlite3_prepare_v2(database, insertQuary, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_int(insertStatement, 1, Int32(employee.id))
            sqlite3_bind_text(insertStatement, 2, (employee.name as NSString).utf8String, -1, nil)
            sqlite3_bind_int(insertStatement, 3, Int32(employee.age))
            sqlite3_bind_text(insertStatement, 4, (employee.mobile as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 5, (employee.address as NSString).utf8String, -1, nil)
            if sqlite3_step(insertStatement) == SQLITE_OK {
                print("data inserted successfully.")
            } else {
                print("could not insert row.")
            }
        } else {
            print("insert statement could not be prepared.")
        }
        sqlite3_finalize(insertStatement)
    }
    
    func featchEmployeeData() -> [Employee] {
        let featchQuery = "SELECT * FROM employee"
        var featchQuaryStatement: OpaquePointer?
        var empDetail : [Employee] = []
        if sqlite3_prepare_v2(database, featchQuery, -1, &featchQuaryStatement, nil) == SQLITE_OK {
            while sqlite3_step(featchQuaryStatement) == SQLITE_ROW {
                let id = Int(sqlite3_column_int(featchQuaryStatement, 0))
                let name = String(describing: String(cString: sqlite3_column_text(featchQuaryStatement, 1)))
                let age = Int(sqlite3_column_int(featchQuaryStatement, 2))
                let mobile = String(describing: String(cString: sqlite3_column_text(featchQuaryStatement, 3)))
                let address = String(describing: String(cString: sqlite3_column_text(featchQuaryStatement, 4)))
               let employeeObj = Employee(id: id, name: name, age: age, mobile: mobile, address: address)
                empDetail.append(employeeObj)
            }
        } else {
            print("select statement not prepared")
        }
        sqlite3_finalize(featchQuaryStatement)
        return empDetail
    }
    
}
