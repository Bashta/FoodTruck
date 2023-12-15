//
//  BlogPost.swift
//
//
//  Created by Erison on 11/12/2023.
//

import Foundation

extension Blog.Post {

    struct List: Codable {
        let id: UUID
        let title: String
        let slug: String
        let image: String
        let excerpt: String
        let date: Date
    }

    struct Detail: Codable {
        let id: UUID
        let title: String
        let slug: String
        let image: String
        let excerpt: String
        let date: Date
        let category: Blog.Category.List
        let content: String
    }

}
