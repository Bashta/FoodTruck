//
//  TemplateRenderer.swift
//
//
//  Created by Erison on 07/12/2023.
//

import Vapor
import SwiftHtml

public struct TemplateRenderer {
    
    var request: Request
    
    init(_ req: Request) {
        self.request = req
    }
    
    public func renderHtml(_ template: TemplateRepresentable, minify: Bool = false, indent: Int = 4) -> Response {
        let document = Document(.html) {
            template.render(request)
        }
        
        let body = DocumentRenderer(minify: minify, indent: indent)
            .render(document)
        return Response(status: .ok, headers: ["":""], body: .init(string: body))
    }
}
