//
//  TextareaFieldTemplate.swift
//
//
//  Created by Erison on 16/12/2023.
//

import Vapor
import SwiftHtml

public struct TextareaFieldTemplate: TemplateRepresentable {
    
    public var context: TextareaFieldContext
    
    public init(_ context: TextareaFieldContext) {
        self.context = context
    }
    
    @TagBuilder
    public func render(_ req: Request) -> Tag {
        LabelTemplate(context.label).render(req)
        Textarea(context.value)
            .placeholder(context.placeholder)
            .name(context.key)
        if let error = context.error {
            Span(error)
                .class("error")
        }
    }
}
