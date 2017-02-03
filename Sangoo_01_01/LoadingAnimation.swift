//
//  LoadingAnimation.swift
//  Sangoo_01_01
//
//  Created by Florenz Erstling on 03.02.17.
//  Copyright © 2017 Florenz. All rights reserved.
//

import UIKit

class LoadingAnimation {
    
    
    var animation = UILabel(frame: CGRect(x:0,y: 0, width: 250, height:50))
    
    func start() {
        
        animation.text = "Loading"
        
    }
    
    func stop() {
        
        animation.text = "Fertig"
        
    }

    
    
}
