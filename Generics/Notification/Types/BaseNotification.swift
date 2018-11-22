//
//  BaseNotification.swift
//  Generics
//
//  Created by Andrew Kochulab on 11/21/18.
//  Copyright © 2018 Andrew Kochulab. All rights reserved.
//

import Foundation

class BaseNotification: Notifiable {
    static var name: Name {
        let className = String(describing: self)
        
        return Name(className)
    }
    
    let userInfo: UserInfo
    
    
    required init(userInfo: UserInfo = [:]) {
        self.userInfo = userInfo
    }
    
    func post(object: Any? = nil) {
        NotificationCenter.default.post(
            name: type(of: self).name,
            object: object,
            userInfo: userInfo
        )
    }
    
    class func observe<Notification>(
        object: Any? = nil,
        queue: OperationQueue? = nil,
        handler: @escaping (Notification) -> Void
    ) where Notification: Notifiable {
        NotificationCenter.default.addObserver(forName: name, object: object, queue: queue) { notification in
            let typedNotification = Notification.init(userInfo: notification.userInfo ?? [:])
            handler(typedNotification)
        }
    }
}
