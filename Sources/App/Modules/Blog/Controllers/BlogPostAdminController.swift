//
//  BlogPostAdminController.swift
//
//
//  Created by Erison on 21/12/2023.
//

import Vapor
import Fluent

struct BlogPostAdminController: AdminListController {
    
    typealias DatabaseModel = BlogPostModel
    
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
    
    func detailView(_ req: Request) async throws -> Response {
        let post = try await findBy(identifier(req), on: req.db)
        let detail = BlogPostApiController().mapDetail(post)
        let template = BlogPostAdminDetailTemplate(
            .init(
                title: "Post details",
                detail: detail
            )
        )
        return req.templates.renderHtml(template)
    }
    
    private func renderEditForm(_ req: Request, _ title: String, _ form: BlogPostEditForm) -> Response {
        let template = BlogPostAdminEditTemplate(
            .init(
                title: title,
                form: form.render(req: req)
            )
        )
        return req.templates.renderHtml(template)
    }
    
    func createView(_ req: Request) async throws -> Response {
        let model = BlogPostModel()
        let form = BlogPostEditForm(model)
        try await form.load(req: req)
        return renderEditForm(req, "Create post", form)
    }
    
    func createAction(_ req: Request) async throws -> Response {
        let model = BlogPostModel()
        let form = BlogPostEditForm(model)
        try await form.load(req: req)
        try await form.process(req: req)
        let isValid = try await form.validate(req: req)
        guard isValid else {
            return renderEditForm(req, "Create post", form)
        }
        try await form.write(req: req)
        try await model.create(on: req.db)
        try await form.save(req: req)
        return req.redirect(
            to: "/admin/blog/posts/\(model.id!.uuidString)/"
        )
    }
    
    func updateView(_ req: Request) async throws -> Response {
        let model = try await findBy(identifier(req), on: req.db)
        let form = BlogPostEditForm(model)
        try await form.load(req: req)
        try await form.read(req: req)
        return renderEditForm(req, "Update post", form)
    }
    
    func updateAction(_ req: Request) async throws -> Response {
        let model = try await findBy(identifier(req), on: req.db)
        let form = BlogPostEditForm(model)
        try await form.load(req: req)
        try await form.process(req: req)
        let isValid = try await form.validate(req: req)
        guard isValid else {
            return renderEditForm(req, "Update post", form)
        }
        try await form.write(req: req)
        try await model.update(on: req.db)
        try await form.save(req: req)
        return req.redirect(
            to: "/admin/blog/posts/\(model.id!.uuidString)/update/"
        )
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
