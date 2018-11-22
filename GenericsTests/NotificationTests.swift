//
//  NotificationTests.swift
//  GenericsTests
//
//  Created by Andrew Kochulab on 11/21/18.
//  Copyright © 2018 Andrew Kochulab. All rights reserved.
//

import XCTest

final class WithoutParametersNotification: BaseNotification { }

final class OneParameterNotification: BaseNotification {
    
    var value: Int
    
    convenience init(value: Int) {
        self.init(userInfo: [
            \OneParameterNotification.value : value
        ])
        
        self.value = value
    }
    
    required init(userInfo: UserInfo) {
        self.value = userInfo[\OneParameterNotification.value] as! Int
        
        super.init(userInfo: userInfo)
    }
}

struct User: Equatable {
    var firstName: String
    var lastName: String
}

class NotificationTests: XCTestCase {
    func testWithoutParameters() {
        WithoutParametersNotification.observe { (notification: WithoutParametersNotification) in
            XCTAssert(true, #function)
        }
        
        WithoutParametersNotification().post()
    }
    
    func testWithOneParameter() {
        let value = 2
        
        OneParameterNotification.observe { (notification: OneParameterNotification) in
            XCTAssert(value == notification.value, #function)
        }
        
        OneParameterNotification(value: value).post()
    }
    
    func testUserNotification() {
        let user = User(firstName: "Test", lastName: "Test1")
        
        ObjectNotification<User>.observe { (notification) in
            XCTAssert(notification.object == user, #function)
        }
        
        ObjectNotification(object: user).post()
    }
    
//    @objc
//    func notificationHandle(_ notification: Notification) {
//        guard let userInfo = notification.userInfo else {
//            return
//        }
//
//        guard let object = userInfo["object"] as? User else {
//            return
//        }
//
//        object
//    }
}
