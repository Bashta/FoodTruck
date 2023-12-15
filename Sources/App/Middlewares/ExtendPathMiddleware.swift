//
//  ExtendPathMiddleware.swift
//
//
//  Created by Erison on 11/12/2023.
//

import Vapor

struct ExtendPathMiddleware: AsyncMiddleware {

    func respond(to request: Request, chainingTo next: AsyncResponder) async throws -> Response {
        let containsDot = request.url.path.contains(".")
        let containsSlashSuffix = request.url.path.hasSuffix("/")

        if !containsSlashSuffix && !containsDot {
            return request.redirect(to: request.url.path + "/", redirectType: .permanent)
        }

        return try await next.respond(to: request)
    }
}
