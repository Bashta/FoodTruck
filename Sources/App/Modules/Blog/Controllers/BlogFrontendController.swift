//
//  BlogFrontendController.swift
//
//
//  Created by Erison on 11/12/2023.
//

import Vapor

struct BlogFrontendController {
    var posts: [BlogPost] = {
        stride(from: 1, to: 9, by: 1).map { index in
            BlogPost(
                title: "Sample post #\(index)",
                slug: "sample-post-\(index)",
                image: "/img/posts/\(String(format: "%02d", index + 1)).jpg",
                excerpt: "Lorem ipsum",
                date: Date().addingTimeInterval(-Double.random(in: 0...(86400 * 60))),
                category: Bool.random() ? "Sample category" : nil,
                content: "Lorem ipsum dolor sit amet."
            )
        }.sorted { $0.date > $1.date }
    }()
    
    func blogView(req: Request) throws -> Response {
        let context = BlogPostsContext(
            icon: "🔥",
            title: "Blog",
            message: "Hot news and stories about everything.",
            posts: posts
        )
        return req.templates.renderHtml(
            BlogPostsTemplate(context)
        )
    }
}
