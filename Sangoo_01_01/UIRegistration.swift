//
//  UIRegistration.swift
//  Sangoo_01_01
//
//  Created by Florenz Erstling on 31.01.17.
//  Copyright © 2017 Florenz. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class UIRegistration {
    
    
    
    func iniButton() -> UIButton {
        
        var button = UIButton(frame: CGRect(x:UIScreen.main.bounds.width / 2 - UIScreen.main.bounds.width * 0.75 / 2,y:10,width: UIScreen.main.bounds.width * 0.75,height:50))
        
        return button
        
    }
    
    func setupButton(button : UIButton) -> UIButton {
        
        button.setTitle("Weiter", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor(red:0.2, green: 0.6, blue:1, alpha:1)
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 1
        
        return button
    }
    
    func iniTextField() -> SkyFloatingLabelTextField {
        
        let textField = SkyFloatingLabelTextField(frame: CGRect(x:UIScreen.main.bounds.width / 2 - UIScreen.main.bounds.width * 0.9 / 2,y:10,width:UIScreen.main.bounds.width * 0.9,height:45))
        return textField
        
    }
    
    func setupTextField(textField : SkyFloatingLabelTextField, description : String) -> SkyFloatingLabelTextField {
        
        textField.placeholder = description
        textField.title = description
        textField.becomeFirstResponder()
        
        return textField
    }
    
    func iniTableView(tableView : UITableView) -> UITableView{
        
        
        return tableView
        
    }
    
    
}
