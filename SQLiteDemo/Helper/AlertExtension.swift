//
//  AlertExtension.swift
//  SQLiteDemo
//
//  Created by Sunil Developer on 05/01/23.
//

import Foundation
import UIKit
extension UIViewController {
    
func showAlert(title: String, message: String, hendler: ((UIAlertAction) -> Swift.Void)? = nil) {
    let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: .default, handler: hendler)
    alertVC.addAction(action)
    self.present(alertVC, animated: true, completion: nil)
}
}
