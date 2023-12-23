//
//  BlogPostApiController.swift
//
//
//  Created by Erison on 21/12/2023.
//

import Vapor

struct BlogPostApiController {
    
    func mapList(_ model: BlogPostModel) -> Blog.Post.List {
        .init(
            id: model.id!,
            title: model.title,
            slug: model.slug,
            image: model.imageKey,
            excerpt: model.excerpt,
            date: model.date
        )
    }

    func mapDetail(_ model: BlogPostModel) -> Blog.Post.Detail {
        .init(
            id: model.id!,
            title: model.title,
            slug: model.slug,
            image: model.imageKey,
            excerpt: model.excerpt,
            date: model.date,
            category: .init(
                id: model.category.id!,
                title: model.category.title
            ),
            content: model.content
        )
    }
}
