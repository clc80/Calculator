//
//  CalcButton.swift
//  Calculator
//
//  Created by Claudia Maciel on 1/7/21.
//

import UIKit

@IBDesignable
class CalcButton: UIButton {
    override func prepareForInterfaceBuilder() {
        customizeView()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeView()
    }
    
    func customizeView() {
        backgroundColor = UIColor(named: "background3")
        layer.cornerRadius = 10.0
    }


}
