//
//  BlogPost.swift
//
//
//  Created by Erison on 11/12/2023.
//

import Foundation

struct BlogPost: Codable {
    let title: String
    let slug: String
    let image: String
    let excerpt: String
    let date: Date
    let category: String?
    let content: String
}
