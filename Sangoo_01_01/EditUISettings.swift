//
//  UIRegistration.swift
//  Sangoo_01_01
//
//  Created by Florenz Erstling on 31.01.17.
//  Copyright © 2017 Florenz. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class EditUISettings {
    
    var textField = SkyFloatingLabelTextField(frame: CGRect(x:UIScreen.main.bounds.width / 2 - UIScreen.main.bounds.width * 0.9 / 2,y:10,width:UIScreen.main.bounds.width * 0.9,height:45))
    var headingLabel = UILabel(frame: CGRect(x:15,y:0,width: UIScreen.main.bounds.width - 2 * 15 ,height:60))
    
    
    func setupTextField(description : String, text : String) {
        
        textField.placeholder = description
        textField.title = description
        textField.text = text
        
    }
    
    func setupHeadingLabel(text:String) {
        
        headingLabel.text = text
        headingLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        
    }
    
    func disableTextField() {
        
        textField.isUserInteractionEnabled = false
        
    }
    
    func enableTextField() {
        
        textField.isUserInteractionEnabled = true
        //textField.resignFirstResponder()
        
    }
    
    
}
