//
//  WebRouter.swift
//
//
//  Created by Erison on 09/12/2023.
//

import Vapor

struct WebRouter: RouteCollection {
    let frontendController = WebFrontendController()
    
    func boot(routes: RoutesBuilder) throws {
        routes.get(use: frontendController.homeView)
    }
}
