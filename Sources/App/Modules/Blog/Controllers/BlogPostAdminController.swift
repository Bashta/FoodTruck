//
//  BlogPostAdminController.swift
//
//
//  Created by Erison on 21/12/2023.
//

import Vapor
import Fluent

struct BlogPostAdminController: AdminListController, AdminDetailController, AdminCreateController, AdminUpdateController {
    typealias DatabaseModel = BlogPostModel
    typealias CreateModelEditor = BlogPostEditor
    typealias UpdateModelEditor = BlogPostEditor
    
    let modelName: Name = .init(singular: "post")
    let parameterId: String = "postId"
    
    func listColumns() -> [ColumnContext] {
        [
            .init("image"),
            .init("title"),
        ]
    }
    
    func listCells(for model: DatabaseModel) -> [CellContext] {
        [
            .init(model.imageKey, type: .image),
            .init(model.title, link: .init(label: model.title)),
        ]
    }
    
    func detailFields(for model: DatabaseModel) -> [DetailContext] {
        [
            .init("image", model.imageKey, type: .image),
            .init("title", model.title),
        ]
    }
    
    func deleteView(_ req: Request) async throws -> Response {
        let model = try await findBy(identifier(req), on: req.db)
        let template = BlogPostAdminDeleteTemplate(
            .init(
                title: "Delete post",
                name: model.title,
                type: "post"
            )
        )
        return req.templates.renderHtml(template)
    }
    
    func deleteAction(_ req: Request) async throws -> Response {
        let model = try await findBy(identifier(req), on: req.db)
        try await req.fs.delete(key: model.imageKey)
        try await model.delete(on: req.db)
        return req.redirect(to: "/admin/blog/posts/")
    }
}
