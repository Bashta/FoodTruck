//
//  UserModule.swift
//
//
//  Created by Erison on 14/12/2023.
//

import Vapor

struct UserModule: ModuleInterface {
    func boot(_ app: Application) throws {
        app.migrations.add(UserMigrations.v1())
        app.migrations.add(UserMigrations.seed())
    }
}
