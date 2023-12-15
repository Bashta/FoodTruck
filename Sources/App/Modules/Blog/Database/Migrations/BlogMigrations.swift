//
//  BlogMigrations.swift
//
//
//  Created by Erison on 14/12/2023.
//

import Foundation
import Fluent

enum BlogMigrations {

    struct V1: AsyncMigration {
        func prepare(on db: Database) async throws {
            try await db.schema(BlogCategoryModel.schema)
                .id()
                .field(BlogCategoryModel.FieldKeys.V1.title, .string, .required)
                .create()
            try await db.schema(BlogPostModel.schema)
                .id()
                .field(BlogPostModel.FieldKeys.V1.title, .string, .required)
                .field(BlogPostModel.FieldKeys.V1.slug, .string, .required)
                .field(BlogPostModel.FieldKeys.V1.imageKey, .string, .required)
                .field(BlogPostModel.FieldKeys.V1.excerpt, .data, .required)
                .field(BlogPostModel.FieldKeys.V1.date, .datetime, .required)
                .field(BlogPostModel.FieldKeys.V1.content, .data, .required)
                .field(BlogPostModel.FieldKeys.V1.categoryId, .uuid)
                .foreignKey(
                    BlogPostModel.FieldKeys.V1.categoryId,
                    references: BlogCategoryModel.schema, .id,
                    onDelete: DatabaseSchema.ForeignKeyAction.setNull,
                    onUpdate: .cascade
                )
                .unique(on: BlogPostModel.FieldKeys.V1.slug)
                .create()
        }

        func revert(on db: Database) async throws {
            try await db.schema(BlogCategoryModel.schema).delete()
            try await db.schema(BlogPostModel.schema).delete()
        }
    }
}

// MARK: - Seed

extension BlogMigrations {
    struct Seed: AsyncMigration {
        func prepare(on db: Database) async throws {
            let categories = (1...4).map { index in
                BlogCategoryModel(title: "Sample category #\(index)")
            }
            try await categories.create(on: db)
            try await (1...9).map { index in
                BlogPostModel(
                    id: nil, title: "Sample post #\(index)"
                    ,
                    slug: "sample-post-\(index)"
                    ,
                    imageKey: "/img/posts/\(String(format: "%02d", index + 1)).jpg",
                    excerpt: "Lorem ipsum",
                    date: Date().addingTimeInterval(-Double.random(in: 0...(86400 *
                                                                            60))),
                    content: "Lorem ipsum dolor sit amet.",
                    categoryId: categories[Int.random(in: 0..<categories.count)].id!
                )
            }
            .create(on: db)
        }
        func revert(on db: Database) async throws {
            try await BlogPostModel.query(on: db).delete()
            try await BlogCategoryModel.query(on: db).delete()
        }
    }
}
