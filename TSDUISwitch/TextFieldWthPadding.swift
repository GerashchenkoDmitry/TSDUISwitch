//
//  TextFieldwithPadding.swift
//  TSDUISwitch
//
//  Created by admin on 27.10.2023.
//

import UIKit

final class TextFieldWithPadding: UITextField {
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 30)
    
    override public func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override public func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override public func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
