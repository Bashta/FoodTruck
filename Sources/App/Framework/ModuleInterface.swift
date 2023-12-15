//
//  ModuleInterface.swift
//
//
//  Created by Erison on 14/12/2023.
//

import Vapor

public protocol ModuleInterface {
    static var identifier: String { get }
    func boot(_ app: Application) throws
}

public extension ModuleInterface {
    static var identifier: String {
        String(describing: self).dropLast(6).lowercased()
    }

    func boot(_ app: Application) throws {  }
}
