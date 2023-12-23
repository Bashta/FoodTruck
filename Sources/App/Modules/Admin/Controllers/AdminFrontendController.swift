//
//  AdminFrontendController.swift
//
//
//  Created by Erison on 21/12/2023.
//


import Vapor

struct AdminFrontendController {
    
    func dashboardView(req: Request) throws -> Response {
        let user = try req.auth.require(AuthenticatedUser.self)
        let template = AdminDashboardTemplate(
            .init(
                icon: "👋"
                ,
                title: "Dashboard",
                message: "Hello \(user.email), welcome to the CMS."
            )
        )
        return req.templates.renderHtml(template)
    }
}
