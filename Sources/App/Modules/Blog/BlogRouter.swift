//
//  BlogRouter.swift
//
//
//  Created by Erison on 11/12/2023.
//

import Vapor

struct BlogRouter: RouteCollection {
    let controller = BlogFrontendController()
    
    func boot(routes: RoutesBuilder) throws {
        routes.get("blog", use: controller.blogView)
        routes.get(.anything, use: controller.postView)
    }
}
