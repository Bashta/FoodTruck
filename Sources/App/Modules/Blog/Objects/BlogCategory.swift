//
//  BlogCategory.swift
//
//
//  Created by Erison on 14/12/2023.
//

import Foundation

extension Blog.Category {

    struct List: Codable {
        let id: UUID
        let title: String
    }
    
    struct Detail: Codable {
        let id: UUID
        let title: String
    }

}
