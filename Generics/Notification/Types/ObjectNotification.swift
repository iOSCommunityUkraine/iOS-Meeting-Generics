//
//  ObjectNotification.swift
//  Generics
//
//  Created by Andrew Kochulab on 11/21/18.
//  Copyright © 2018 Andrew Kochulab. All rights reserved.
//

import Foundation

class ObjectNotification<Model>: BaseNotification, ObjectNotifiable {
    
    // MARK: - Properties
    
    var object: Model
    
    
    // MARK: - Initialization
    
    convenience init(object: Model) {
        self.init(userInfo: [
            \ObjectNotification.object : object
        ])
        
        self.object = object
    }
    
    required init(userInfo: UserInfo) {
        self.object = userInfo[\ObjectNotification.object] as! Model
        
        super.init(userInfo: userInfo)
    }
    
    
    // MARK: - Appearance
    
    override static func observe<Notification>(
        object: Any? = nil,
        queue: OperationQueue? = nil,
        handler: @escaping (Notification) -> Void
    ) where Notification: ObjectNotification<Model> {
        NotificationCenter.default.addObserver(
        forName: name, object: object, queue: queue) { notification in
            let typedNotification = Notification.init(userInfo: notification.userInfo ?? [:])
            handler(typedNotification)
        }
    }
}
