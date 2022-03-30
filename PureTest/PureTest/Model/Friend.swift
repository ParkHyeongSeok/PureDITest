//
//  Friend.swift
//  PureTest
//
//  Created by 박형석 on 2022/02/12.
//

import Foundation

final class Friend {
    let name: String
    let age: Int
    
    init(name: String,
         age: Int) {
        self.name = name
        self.age = age
    }
}

extension Friend: Equatable {
    static func == (lhs: Friend, rhs: Friend) -> Bool {
        return lhs.name == rhs.name && lhs.age == rhs.age
    }
}
