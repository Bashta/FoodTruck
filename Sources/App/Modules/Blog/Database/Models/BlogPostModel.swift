//
//  BlogPostModel.swift
//
//
//  Created by Erison on 12/12/2023.
//

import Vapor
import Fluent

final class BlogPostModel: DatabaseModelInterface {
    typealias Module = BlogModule
    static let schema: String = "blog_posts"

    struct FieldKeys {
        struct V1 {
            static var title: FieldKey { "title" }
            static var slug: FieldKey { "slug" }
            static var imageKey: FieldKey { "image_key" }
            static var excerpt: FieldKey { "excerpt" }
            static var date: FieldKey { "date" }
            static var content: FieldKey { "content" }
            static var categoryId: FieldKey { "category_id" }
        }
    }

    @ID()
    var id: UUID?

    @Field(key: FieldKeys.V1.title)
    var title: String

    @Field(key: FieldKeys.V1.slug)
    var slug: String

    @Field(key: FieldKeys.V1.imageKey)
    var imageKey: String

    @Field(key: FieldKeys.V1.excerpt)
    var excerpt: String

    @Field(key: FieldKeys.V1.date)
    var date: Date

    @Field(key: FieldKeys.V1.content)
    var content: String

    @Parent(key: FieldKeys.V1.categoryId)
    var category: BlogCategoryModel

    init() { }

    init(
        id: UUID? = nil,
        title: String,
        slug: String,
        imageKey: String,
        excerpt: String,
        date: Date,
        content: String,
        categoryId: UUID) {
        self.id = id
        self.title = title
        self.slug = slug
        self.imageKey = imageKey
        self.excerpt = excerpt
        self.date = date
        self.content = content
        $category.id = categoryId
    }
}
