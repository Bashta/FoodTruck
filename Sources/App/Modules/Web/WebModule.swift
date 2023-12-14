//
//  WebModule.swift
//
//
//  Created by Erison on 14/12/2023.
//

import Foundation

import Vapor

struct WebModule: ModuleInterface {
    
    let router = WebRouter()
    
    func boot(_ app: Application) throws {
        try router.boot(routes: app.routes)
    }
}
