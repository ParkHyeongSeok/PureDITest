//
//  AppAssembler.swift
//  PureTest
//
//  Created by 박형석 on 2022/03/30.
//

import Foundation
import Swinject

struct AppAssembler {
    static let assembler = Assembler([
        ServiceAssembly(),
        ViewAssembly()
    ])
}
