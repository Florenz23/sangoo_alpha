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
    
    var button = UIButton(frame: CGRect(x:UIScreen.main.bounds.width / 2 - UIScreen.main.bounds.width * 0.75 / 2,y:10,width: UIScreen.main.bounds.width * 0.75,height:50))
    var textField = SkyFloatingLabelTextField(frame: CGRect(x:UIScreen.main.bounds.width / 2 - UIScreen.main.bounds.width * 0.9 / 2,y:10,width:UIScreen.main.bounds.width * 0.9,height:45))

    
    func setupButton()  {
        
        button.setTitle("Weiter", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor(red:0.2, green: 0.6, blue:1, alpha:1)
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 1
        
    }
    
    func disableButton()  {
        
        button.backgroundColor = UIColor(red:0.69, green:0.71, blue:0.70, alpha:1.0)
        button.isEnabled = false
        
    }
    
    func enableButton() {
        
        button.backgroundColor = UIColor(red:0.2, green: 0.6, blue:1, alpha:1)
        button.isEnabled = true
        
    }

    
    func setupTextField(description : String, text : String) {
        
        textField.placeholder = description
        textField.becomeFirstResponder()
        textField.title = description
        textField.text = text
        
    }
    
    func disableTextField() {
        
        textField.isUserInteractionEnabled = false
        
    }
    
    func enableTextField() {
        
        print("jo")
        textField.isUserInteractionEnabled = true
        //textField.resignFirstResponder()
        
    }
    
    func iniTableView(tableView : UITableView) -> UITableView{
        
        
        return tableView
        
    }
    
    
}
