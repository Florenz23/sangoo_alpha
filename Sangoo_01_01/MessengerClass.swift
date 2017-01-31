//
//  MessengerClass.swift
//  Sangoo_01_01
//
//  Created by Florenz Erstling on 31.01.17.
//  Copyright © 2017 Florenz. All rights reserved.
//

import SwiftMessages



class Messenger {
    
    func warning(messageText : String) {
        
        let view = MessageView.viewFromNib(layout: .TabView)
        
        // Theme message elements with the warning style.
        view.configureTheme(.warning)
        
        // Add a drop shadow.
        view.configureDropShadow()
        
        // Set message title, body, and icon. Here, we're overriding the default warning
        // image with an emoji character.
        view.configureContent(title: "Oops", body: messageText, iconText: "")
        
        var config = SwiftMessages.Config()
        config.presentationStyle = .bottom
        
        // Show the message.
        SwiftMessages.show(config: config, view: view)
        
        
    }
    
    func success(messageText : String) {
        
        let view = MessageView.viewFromNib(layout: .StatusLine)
        
        // Theme message elements with the warning style.
        view.configureTheme(.success)
        
        // Add a drop shadow.
        view.configureDropShadow()
        
        // Set message title, body, and icon. Here, we're overriding the default warning
        view.configureContent(title: "Ok", body: messageText)
        
        var config = SwiftMessages.Config()
        config.presentationStyle = .bottom

        // Show the message.
        SwiftMessages.show(config: config, view: view)
        
        
    }

    
    
    
}
