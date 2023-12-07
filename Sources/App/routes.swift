import Vapor
import SwiftHtml

struct DefaultTemplate: TemplateRepresentable {
    let title: String
    
    func render(_ req: Request) -> Tag {
        Html {
            Head {
                Title(title)
            }
            Body {
                H1(title)
            }
        }
    }
}

func routes(_ app: Application) throws {
    
    app.get { req async in
        "It works!"
    }
    
    app.routes.get("hello") { req -> Response in
        let template = DefaultTemplate(title: "Hello Teplate Rendering")
        return req.templates.renderHtml(template)
    }
}
