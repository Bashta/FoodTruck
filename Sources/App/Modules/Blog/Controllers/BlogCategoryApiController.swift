//
//  BlogCategoryApiController.swift
//
//
//  Created by Erison on 02/01/2024.
//

import Vapor

extension Blog.Category.List: Content {}

struct BlogCategoryApiController {

    func listOutput(_ req: Request, _ models: [BlogCategoryModel]) async throws -> [Blog.Category.List] {
        models.map {
            .init(id: $0.id!, title: $0.title)
        }
    }

    func listApi(_ req: Request) async throws -> [Blog.Category.List] {
        let models = try await BlogCategoryModel
            .query(on: req.db)
            .all()
        return try await listOutput(req, models)
    }

}
