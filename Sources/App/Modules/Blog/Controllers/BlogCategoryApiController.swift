//
//  BlogCategoryApiController.swift
//
//
//  Created by Erison on 02/01/2024.
//

import Vapor

extension Blog.Category.List: Content {}
extension Blog.Category.Detail: Content {}

struct BlogCategoryApiController: ModelController {
    
    typealias DatabaseModel = BlogCategoryModel
    
    var modelName: Name = .init(
        singular: "category",
        plural: "categories"
    )
    
    var parameterId: String = "categoryId"
    
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
    
    func detailOutput(_ req: Request, _ model: BlogCategoryModel) async throws -> Blog.Category.Detail {
        .init(id: model.id!, title: model.title)
    }
    
    func detailApi(_ req: Request) async throws -> Blog.Category.Detail {
        let model = try await findBy(identifier(req), on: req.db)
        return try await detailOutput(req, model)
    }

}
