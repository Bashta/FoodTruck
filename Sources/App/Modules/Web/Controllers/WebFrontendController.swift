//
//  WebFrontendController.swift
//
//
//  Created by Erison on 09/12/2023.
//

import Vapor

struct WebFrontendController {
    func homeView(req: Request) throws -> Response {
        req.templates.renderHtml(
            WebHomeTemplate(
                .init(title: "Home", message: "Hi there Wellcome to my page!")
            )
        )
    }
}
