//
//  BlogCategoryAdminController.swift
//
//
//  Created by Erison on 26/12/2023.
//

import Vapor
import Fluent

struct BlogCategoryAdminController: AdminListController, AdminDetailController {

    typealias DatabaseModel = BlogCategoryModel
    
    let modelName: Name = .init(singular: "category", plural: "categories")
    let parameterId: String = "categoryId"
    
    func listColumns() -> [ColumnContext] {
        [
            .init("title"),
        ]
    }
    
    func listCells(for model: DatabaseModel) -> [CellContext] {
        [
            .init(model.title, link: .init(label: model.title)),
        ]
    }

    func detailFields(for model: BlogCategoryModel) -> [DetailContext] {
        [
            .init("title", model.title),
        ]
    }

}
