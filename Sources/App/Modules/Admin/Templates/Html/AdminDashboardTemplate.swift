//
//  AdminDashboardTemplate.swift
//
//
//  Created by Erison on 21/12/2023.
//

import Vapor
import SwiftHtml

struct AdminDashboardTemplate: TemplateRepresentable {
    var context: AdminDashboardContext
    
    init(_ context: AdminDashboardContext) {
        self.context = context
    }
    
    @TagBuilder
    func render(_ req: Request) -> Tag {
        AdminIndexTemplate(.init(title: context.title)) {
            Div {
                Section {
                    P(context.icon)
                    H1(context.title)
                    P(context.message)
                }
                Nav {
                    H2("Blog")
                    Ul {
                        Li {
                            A("Posts")
                                .href("/admin/blog/posts/")
                        }
                        Li {
                            A("Categories")
                                .href("/admin/blog/categories/")
                        }
                    }
                }
            }
            .id("dashboard")
            .class("container")
        }
        .render(req)
    }
}
