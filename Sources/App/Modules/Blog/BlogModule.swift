//
//  BlogModule.swift
//
//
//  Created by Erison on 14/12/2023.
//

import Vapor

struct BlogModule: ModuleInterface {

    let router = BlogRouter()

    func boot(_ app: Application) throws {
        app.migrations.add(BlogMigrations.V1())
        app.migrations.add(BlogMigrations.Seed())
        try router.boot(routes: app.routes)
    }
}
