//
//  WebFrontendController.swift
//
//
//  Created by Erison on 09/12/2023.
//

import Vapor

struct WebFrontendController {
    func homeView(req: Request) throws -> Response {
        let context = WebHomeContext(
            icon: "👋",
            title: "Home",
            message: "Hi there, welcome to hy homepage 🥸",
            paragraph: 
                [
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                 "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                 "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.",
                 "Nisi ut aliquip ex ea commodo consequat.",
            ],
            link: .init(
                label: "Read my blog →",
                url: "/blog/"
            )
        )

        return req.templates.renderHtml(
            WebHomeTemplate(context)
        )
    }
}
