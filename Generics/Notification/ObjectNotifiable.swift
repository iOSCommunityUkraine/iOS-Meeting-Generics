//
//  ObjectNotifiable.swift
//  Generics
//
//  Created by Andrew Kochulab on 11/21/18.
//  Copyright © 2018 Andrew Kochulab. All rights reserved.
//

import Foundation

protocol ObjectNotifiable: Notifiable {
    
    // MARK: - Types
    
    associatedtype Model
    
    
    // MARK: - Properties
    
    var object: Model { get }
    
}
