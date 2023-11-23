//
//  Extensions.swift
//  TSDUISwitch
//
//  Created by admin on 21.11.2023.
//

import Foundation
import UIKit

// MARK: HideKeyboard extension

extension UIViewController {
    func hideKeyboardOnTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func textFieldDidEndEditing(sender: UITextField) {
        sender.resignFirstResponder()
    }
}
