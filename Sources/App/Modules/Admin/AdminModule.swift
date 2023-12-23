//
//  AdminModule.swift
//
//
//  Created by Erison on 21/12/2023.
//

import Vapor

struct AdminModule: ModuleInterface {
    let router = AdminRouter()
    
    func boot(_ app: Application) throws {
        try router.boot(routes: app.routes)
    }
}
